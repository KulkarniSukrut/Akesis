/// Theme system for Askesis
/// Implements the design tokens as a complete Flutter ThemeData

library theme;

import 'package:flutter/material.dart';
import 'tokens.dart' as tokens;

/// Custom theme extension for semantic colors
class AppColorScheme extends ThemeExtension<AppColorScheme> {
  final tokens.SemanticColors colors;

  const AppColorScheme(this.colors);

  @override
  AppColorScheme copyWith({tokens.SemanticColors? colors}) {
    return AppColorScheme(colors ?? this.colors);
  }

  @override
  AppColorScheme lerp(ThemeExtension<AppColorScheme>? other, double t) {
    if (other is! AppColorScheme) return this;
    // For simplicity, return this at t < 0.5, other at t >= 0.5
    return t < 0.5 ? this : other;
  }
}

/// Light theme
final ThemeData lightTheme = _buildTheme(
  brightness: Brightness.light,
  semanticColors: const tokens.LightSemanticColors(),
);

/// Dark theme
final ThemeData darkTheme = _buildTheme(
  brightness: Brightness.dark,
  semanticColors: const tokens.DarkSemanticColors(),
);

ThemeData _buildTheme({
  required Brightness brightness,
  required tokens.SemanticColors semanticColors,
}) {
  final ColorScheme baseColorScheme = ColorScheme(
    brightness: brightness,
    primary: semanticColors.accent,
    onPrimary: brightness == Brightness.light ? Colors.white : semanticColors.canvas,
    primaryContainer: semanticColors.accentLight,
    onPrimaryContainer: semanticColors.accent,
    secondary: semanticColors.accentMuted,
    onSecondary: brightness == Brightness.light ? semanticColors.ink : semanticColors.canvas,
    secondaryContainer: semanticColors.border,
    onSecondaryContainer: semanticColors.inkMuted,
    tertiary: semanticColors.success,
    onTertiary: Colors.white,
    tertiaryContainer: semanticColors.successLight,
    onTertiaryContainer: semanticColors.success,
    error: semanticColors.error,
    onError: Colors.white,
    errorContainer: semanticColors.errorLight,
    onErrorContainer: semanticColors.error,
    surface: semanticColors.surface,
    onSurface: semanticColors.ink,
    surfaceContainerHighest: semanticColors.surfaceElevated,
    onSurfaceVariant: semanticColors.inkMuted,
    outline: semanticColors.border,
    outlineVariant: semanticColors.border,
    shadow: Colors.black.withValues(alpha: 0.1),
    scrim: Colors.black.withValues(alpha: 0.3),
    inverseSurface: brightness == Brightness.light ? semanticColors.canvas : semanticColors.surface,
    onInverseSurface: brightness == Brightness.light ? semanticColors.ink : semanticColors.canvas,
    inversePrimary: semanticColors.accent,
  );

  return ThemeData(
    useMaterial3: true,
    brightness: brightness,
    colorScheme: baseColorScheme,
    extensions: [AppColorScheme(semanticColors)],
    
    // Scaffold
    scaffoldBackgroundColor: semanticColors.canvas,
    
    // App Bar
    appBarTheme: AppBarTheme(
      backgroundColor: semanticColors.canvas,
      surfaceTintColor: Colors.transparent,
      foregroundColor: semanticColors.ink,
      elevation: 0,
      scrolledUnderElevation: 0,
      titleTextStyle: tokens.AppTypography.headlineMedium.copyWith(
        color: semanticColors.ink,
      ),
      centerTitle: false,
      toolbarHeight: 56,
    ),
    
    // Card
    cardTheme: CardThemeData(
      color: semanticColors.surface,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(tokens.Radius.lg),
        side: BorderSide(
          color: semanticColors.border,
          width: 0.5,
        ),
      ),
      clipBehavior: Clip.antiAlias,
    ),
    
    // Elevated Button
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: semanticColors.accent,
        foregroundColor: brightness == Brightness.light ? Colors.white : semanticColors.canvas,
        elevation: 0,
        padding: const EdgeInsets.symmetric(
          horizontal: tokens.Spacing.md,
          vertical: tokens.Spacing.sm,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(tokens.Radius.md),
        ),
        textStyle: tokens.AppTypography.labelLarge,
        minimumSize: const Size(tokens.TouchTargets.minSize, tokens.TouchTargets.minSize),
      ).copyWith(
        overlayColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.hovered)) {
            return semanticColors.accentHover.withValues(alpha: 0.1);
          }
          if (states.contains(WidgetState.pressed)) {
            return semanticColors.accentHover.withValues(alpha: 0.2);
          }
          return null;
        }),
      ),
    ),
    
    // Outlined Button
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: semanticColors.accent,
        side: BorderSide(color: semanticColors.accent, width: 1.5),
        padding: const EdgeInsets.symmetric(
          horizontal: tokens.Spacing.md,
          vertical: tokens.Spacing.sm,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(tokens.Radius.md),
        ),
        textStyle: tokens.AppTypography.labelLarge,
        minimumSize: const Size(tokens.TouchTargets.minSize, tokens.TouchTargets.minSize),
      ).copyWith(
        overlayColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.hovered)) {
            return semanticColors.accentLight;
          }
          if (states.contains(WidgetState.pressed)) {
            return semanticColors.accentLight.withValues(alpha: 0.5);
          }
          return null;
        }),
      ),
    ),
    
// Text Button
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: semanticColors.accent,
        padding: const EdgeInsets.symmetric(
          horizontal: tokens.Spacing.sm,
          vertical: tokens.Spacing.xs,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(tokens.Radius.sm),
        ),
        textStyle: tokens.AppTypography.labelMedium,
        minimumSize: const Size(tokens.TouchTargets.minSize, tokens.TouchTargets.minSize),
      ).copyWith(
        overlayColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.hovered)) {
            return semanticColors.accentLight;
          }
          if (states.contains(WidgetState.pressed)) {
            return semanticColors.accentLight.withValues(alpha: 0.5);
          }
          return null;
        }),
      ),
    ),
    
    // Input Decoration
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: semanticColors.surface,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: tokens.Spacing.md,
        vertical: tokens.Spacing.sm,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(tokens.Radius.md),
        borderSide: BorderSide(color: semanticColors.border, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(tokens.Radius.md),
        borderSide: BorderSide(color: semanticColors.border, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(tokens.Radius.md),
        borderSide: BorderSide(color: semanticColors.accent, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(tokens.Radius.md),
        borderSide: BorderSide(color: semanticColors.error, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(tokens.Radius.md),
        borderSide: BorderSide(color: semanticColors.error, width: 2),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(tokens.Radius.md),
        borderSide: BorderSide(color: semanticColors.disabled, width: 1),
      ),
      labelStyle: tokens.AppTypography.bodyMedium.copyWith(
        color: semanticColors.inkMuted,
      ),
      hintStyle: tokens.AppTypography.bodyMedium.copyWith(
        color: semanticColors.inkSubtle,
      ),
      errorStyle: tokens.AppTypography.bodySmall.copyWith(
        color: semanticColors.error,
      ),
      floatingLabelStyle: tokens.AppTypography.labelMedium.copyWith(
        color: semanticColors.accent,
      ),
    ),
    
    // Divider
    dividerTheme: DividerThemeData(
      color: semanticColors.border,
      thickness: 0.5,
      space: tokens.Spacing.lg,
    ),
    
    // List Tile
    listTileTheme: ListTileThemeData(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: tokens.Spacing.md,
        vertical: tokens.Spacing.xs,
      ),
      titleTextStyle: tokens.AppTypography.bodyMedium.copyWith(
        color: semanticColors.ink,
      ),
      subtitleTextStyle: tokens.AppTypography.bodySmall.copyWith(
        color: semanticColors.inkMuted,
      ),
      leadingAndTrailingTextStyle: tokens.AppTypography.bodyMedium.copyWith(
        color: semanticColors.inkMuted,
      ),
      iconColor: semanticColors.inkMuted,
      textColor: semanticColors.ink,
      minLeadingWidth: 24,
      minVerticalPadding: tokens.Spacing.xs,
    ),
    
    // Checkbox
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return semanticColors.accent;
        }
        return Colors.transparent;
      }),
      checkColor: WidgetStateProperty.all(
        brightness == Brightness.light ? Colors.white : semanticColors.canvas,
      ),
      side: BorderSide(color: semanticColors.border, width: 1.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(tokens.Radius.sm),
      ),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.compact,
    ),
    
    // Radio
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return semanticColors.accent;
        }
        return semanticColors.inkSubtle;
      }),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.compact,
    ),
    
    // Switch
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return semanticColors.accent;
        }
        return brightness == Brightness.light ? Colors.white : semanticColors.surfaceElevated;
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return semanticColors.accent.withValues(alpha: 0.3);
        }
        return semanticColors.disabled;
      }),
      trackOutlineColor: WidgetStateProperty.all(semanticColors.border),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    ),
    
    // Slider
    sliderTheme: SliderThemeData(
      activeTrackColor: semanticColors.accent,
      inactiveTrackColor: semanticColors.border,
      thumbColor: semanticColors.accent,
      overlayColor: semanticColors.accent.withValues(alpha: 0.1),
      valueIndicatorColor: semanticColors.accent,
      valueIndicatorTextStyle: tokens.AppTypography.monoSmall.copyWith(
        color: brightness == Brightness.light ? Colors.white : semanticColors.canvas,
      ),
      trackHeight: 4,
      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
      overlayShape: const RoundSliderOverlayShape(overlayRadius: 20),
    ),
    
    // Progress Indicator
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: semanticColors.accent,
      linearTrackColor: semanticColors.border,
      circularTrackColor: semanticColors.border,
    ),
    
    // Chip
    chipTheme: ChipThemeData(
      backgroundColor: semanticColors.surfaceElevated,
      disabledColor: semanticColors.disabled.withValues(alpha: 0.3),
      selectedColor: semanticColors.accentLight,
      secondarySelectedColor: semanticColors.accentLight,
      padding: const EdgeInsets.symmetric(
        horizontal: tokens.Spacing.sm,
        vertical: tokens.Spacing.xs,
      ),
      labelStyle: tokens.AppTypography.labelSmall.copyWith(
        color: semanticColors.inkMuted,
      ),
      secondaryLabelStyle: tokens.AppTypography.labelSmall.copyWith(
        color: semanticColors.accent,
      ),
      brightness: brightness,
      elevation: 0,
      pressElevation: 0,
      side: BorderSide(color: semanticColors.border, width: 0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(tokens.Radius.full),
      ),
    ),
    
    // Dialog
    dialogTheme: DialogThemeData(
      backgroundColor: semanticColors.surface,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(tokens.Radius.xl),
        side: BorderSide(color: semanticColors.border, width: 0.5),
      ),
      titleTextStyle: tokens.AppTypography.headlineSmall.copyWith(
        color: semanticColors.ink,
      ),
      contentTextStyle: tokens.AppTypography.bodyMedium.copyWith(
        color: semanticColors.inkMuted,
      ),
    ),
    
    // Bottom Sheet
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: semanticColors.surface,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(tokens.Radius.xl),
        ),
        side: BorderSide(color: semanticColors.border, width: 0.5),
      ),
      modalBackgroundColor: semanticColors.surface,
      constraints: const BoxConstraints(minWidth: double.infinity),
    ),
    
    // Snack Bar
    snackBarTheme: SnackBarThemeData(
      backgroundColor: semanticColors.surfaceElevated,
      contentTextStyle: tokens.AppTypography.bodyMedium.copyWith(
        color: semanticColors.ink,
      ),
      actionTextColor: semanticColors.accent,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(tokens.Radius.md),
      ),
      elevation: 0,
    ),
    
    // Tab Bar
    tabBarTheme: TabBarThemeData(
      labelColor: semanticColors.ink,
      unselectedLabelColor: semanticColors.inkMuted,
      indicatorColor: semanticColors.accent,
      indicatorSize: TabBarIndicatorSize.label,
      labelStyle: tokens.AppTypography.labelMedium,
      unselectedLabelStyle: tokens.AppTypography.labelMedium,
      dividerColor: Colors.transparent,
      overlayColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.hovered)) {
          return semanticColors.accentLight;
          }
          return null;
        }),
      ),
    
    // Tooltip
    tooltipTheme: TooltipThemeData(
      decoration: BoxDecoration(
        color: semanticColors.ink,
        borderRadius: BorderRadius.circular(tokens.Radius.sm),
      ),
      textStyle: tokens.AppTypography.bodySmall.copyWith(
        color: brightness == Brightness.light ? semanticColors.canvas : semanticColors.ink,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: tokens.Spacing.sm,
        vertical: tokens.Spacing.xs,
      ),
      preferBelow: true,
      verticalOffset: 8,
    ),
    
    // Text Selection
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: semanticColors.accent,
      selectionColor: semanticColors.accentLight,
      selectionHandleColor: semanticColors.accent,
    ),
    
    // Scrollbar
    scrollbarTheme: ScrollbarThemeData(
      thumbColor: WidgetStateProperty.all(semanticColors.inkSubtle),
      trackColor: WidgetStateProperty.all(Colors.transparent),
      thickness: WidgetStateProperty.all(4),
      radius: const Radius.circular(tokens.Radius.full),
      minThumbLength: 48,
    ),
    
    // Text Theme - uses our custom typography
    textTheme: TextTheme(
      displayLarge: tokens.AppTypography.displayLarge.copyWith(color: semanticColors.ink),
      displayMedium: tokens.AppTypography.displayMedium.copyWith(color: semanticColors.ink),
      displaySmall: tokens.AppTypography.displaySmall.copyWith(color: semanticColors.ink),
      headlineLarge: tokens.AppTypography.headlineLarge.copyWith(color: semanticColors.ink),
      headlineMedium: tokens.AppTypography.headlineMedium.copyWith(color: semanticColors.ink),
      headlineSmall: tokens.AppTypography.headlineSmall.copyWith(color: semanticColors.ink),
      titleLarge: tokens.AppTypography.titleLarge.copyWith(color: semanticColors.ink),
      titleMedium: tokens.AppTypography.titleMedium.copyWith(color: semanticColors.ink),
      titleSmall: tokens.AppTypography.titleSmall.copyWith(color: semanticColors.ink),
      bodyLarge: tokens.AppTypography.bodyLarge.copyWith(color: semanticColors.ink),
      bodyMedium: tokens.AppTypography.bodyMedium.copyWith(color: semanticColors.ink),
      bodySmall: tokens.AppTypography.bodySmall.copyWith(color: semanticColors.inkMuted),
      labelLarge: tokens.AppTypography.labelLarge.copyWith(color: semanticColors.ink),
      labelMedium: tokens.AppTypography.labelMedium.copyWith(color: semanticColors.inkMuted),
      labelSmall: tokens.AppTypography.labelSmall.copyWith(color: semanticColors.inkSubtle),
    ).apply(
      bodyColor: semanticColors.ink,
      displayColor: semanticColors.ink,
    ),
    
    // Visual density - comfortable for desktop, compact for mobile
    visualDensity: VisualDensity.standard,
    
    // Material Tap Target Size
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
  );
}

/// Helper to access semantic colors from context
extension AppColorSchemeX on BuildContext {
  tokens.SemanticColors get colors => Theme.of(this).extension<AppColorScheme>()!.colors;
  
  // Convenience getters
  Color get canvas => colors.canvas;
  Color get surface => colors.surface;
  Color get surfaceElevated => colors.surfaceElevated;
  Color get ink => colors.ink;
  Color get inkMuted => colors.inkMuted;
  Color get inkSubtle => colors.inkSubtle;
  Color get border => colors.border;
  Color get borderStrong => colors.borderStrong;
  Color get accent => colors.accent;
  Color get accentHover => colors.accentHover;
  Color get accentLight => colors.accentLight;
  Color get accentMuted => colors.accentMuted;
  Color get success => colors.success;
  Color get successLight => colors.successLight;
  Color get warning => colors.warning;
  Color get warningLight => colors.warningLight;
  Color get error => colors.error;
  Color get errorLight => colors.errorLight;
  Color get focus => colors.focus;
  Color get disabled => colors.disabled;
}