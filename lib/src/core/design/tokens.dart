/// Design Tokens for Askesis
/// 
/// A personal operating system with "notebook crossed with instrument panel" aesthetic.
/// Calm, editorial, tactile, precise. One person's tool, not a SaaS dashboard.

library design.tokens;

import 'package:flutter/material.dart';

/// Color palette - warm, not techy
/// Light: off-white paper, deep ink
/// Dark: warm near-black (never pure #000, never navy-blue-grey)
/// One restrained accent: burnt vermilion/saffron

/// Light mode colors
class LightColors {
  // Backgrounds
  static const Color canvas = Color(0xFFFAF9F6);        // Warm off-white paper
  static const Color surface = Color(0xFFFFFFFF);       // Pure white for cards
  static const Color surfaceElevated = Color(0xFFF5F3EF); // Slightly warmer for elevated

  // Text
  static const Color ink = Color(0xFF1C1B18);           // Deep warm ink (not pure black)
  static const Color inkMuted = Color(0xFF6B6760);      // Muted text
  static const Color inkSubtle = Color(0xFF9A968F);     // Subtle/hint text

  // Borders & Dividers
  static const Color border = Color(0xFFE8E4DC);        // Hairline border
  static const Color borderStrong = Color(0xFFDCCFC0);  // Stronger border

  // Accent - Burnt Vermilion / Saffron
  static const Color accent = Color(0xFFD45A2E);        // Primary accent
  static const Color accentHover = Color(0xFFC04E28);   // Hover state
  static const Color accentLight = Color(0xFFFEF3F0);   // Light background for accent
  static const Color accentMuted = Color(0xFFE8B8A8);   // Muted accent

  // Semantic (minimal, only where meaning requires)
  static const Color success = Color(0xFF2D7D46);       // Deep green
  static const Color successLight = Color(0xFFEBF5EC);
  static const Color warning = Color(0xFFB87D1A);       // Amber
  static const Color warningLight = Color(0xFFFCF3E3);
  static const Color error = Color(0xFFB83A2A);         // Red
  static const Color errorLight = Color(0xFFFDEDEA);

  // Interactive
  static const Color focus = Color(0xFFD45A2E);         // Focus ring uses accent
  static const Color disabled = Color(0xFFD0CBC0);      // Disabled state
}

/// Dark mode colors
class DarkColors {
  // Backgrounds
  static const Color canvas = Color(0xFF1A1917);        // Warm near-black
  static const Color surface = Color(0xFF23211F);       // Slightly lighter surface
  static const Color surfaceElevated = Color(0xFF2D2A27); // Elevated surface

  // Text
  static const Color ink = Color(0xFFF5F3EF);           // Warm white
  static const Color inkMuted = Color(0xFFA8A398);      // Muted text
  static const Color inkSubtle = Color(0xFF7A766C);     // Subtle/hint text

  // Borders & Dividers
  static const Color border = Color(0xFF3A3631);        // Hairline border
  static const Color borderStrong = Color(0xFF4A453E);  // Stronger border

  // Accent - Burnt Vermilion / Saffron (same hue, adjusted for dark)
  static const Color accent = Color(0xFFE87D4A);        // Primary accent
  static const Color accentHover = Color(0xFFF09365);   // Hover state
  static const Color accentLight = Color(0xFF3D2A24);   // Dark background for accent
  static const Color accentMuted = Color(0xFF8B5A45);   // Muted accent

  // Semantic
  static const Color success = Color(0xFF4ADE80);       // Green
  static const Color successLight = Color(0xFF1A3D26);
  static const Color warning = Color(0xFFFBBF24);       // Amber
  static const Color warningLight = Color(0xFF3D331A);
  static const Color error = Color(0xFFF87171);         // Red
  static const Color errorLight = Color(0xFF3D1A1A);

  // Interactive
  static const Color focus = Color(0xFFE87D4A);         // Focus ring uses accent
  static const Color disabled = Color(0xFF4A453E);      // Disabled state
}

/// Spacing scale - based on 4dp grid, generous margins
class Spacing {
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;
  static const double xxxl = 64.0;

  // Component-specific
  static const double cardPadding = 20.0;
  static const double screenMargin = 24.0;
  static const double sectionGap = 32.0;
  static const double itemGap = 12.0;
}

/// Border radius scale
class Radius {
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 12.0;
  static const double lg = 16.0;
  static const double xl = 24.0;
  static const double full = 9999.0;
}

/// Typography - The design carries the identity
/// Serif for headings (Fraunces/Newsreader)
/// Grotesk for UI (Instrument Sans/Geist)
/// Monospace for numbers, durations, dates (JetBrains Mono/IBM Plex Mono)

class AppTypography {
  // Font families
  static const String heading = 'Fraunces';
  static const String ui = 'InstrumentSans';
  static const String mono = 'JetBrainsMono';

  // Type scale - mobile first
  // Display / Hero
  static const TextStyle displayLarge = TextStyle(
    fontFamily: heading,
    fontSize: 48,
    fontWeight: FontWeight.w600,
    height: 1.1,
    letterSpacing: -0.5,
  );

  static const TextStyle displayMedium = TextStyle(
    fontFamily: heading,
    fontSize: 36,
    fontWeight: FontWeight.w600,
    height: 1.15,
    letterSpacing: -0.3,
  );

  static const TextStyle displaySmall = TextStyle(
    fontFamily: heading,
    fontSize: 28,
    fontWeight: FontWeight.w500,
    height: 1.2,
    letterSpacing: -0.2,
  );

  // Headings
  static const TextStyle headlineLarge = TextStyle(
    fontFamily: heading,
    fontSize: 24,
    fontWeight: FontWeight.w500,
    height: 1.25,
    letterSpacing: -0.1,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontFamily: heading,
    fontSize: 20,
    fontWeight: FontWeight.w500,
    height: 1.3,
    letterSpacing: 0,
  );

  static const TextStyle headlineSmall = TextStyle(
    fontFamily: heading,
    fontSize: 18,
    fontWeight: FontWeight.w500,
    height: 1.35,
    letterSpacing: 0,
  );

  // UI / Body
  static const TextStyle titleLarge = TextStyle(
    fontFamily: ui,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.4,
    letterSpacing: 0.1,
  );

  static const TextStyle titleMedium = TextStyle(
    fontFamily: ui,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.4,
    letterSpacing: 0.1,
  );

  static const TextStyle titleSmall = TextStyle(
    fontFamily: ui,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    height: 1.4,
    letterSpacing: 0.2,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontFamily: ui,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
    letterSpacing: 0,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: ui,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.5,
    letterSpacing: 0,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: ui,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.5,
    letterSpacing: 0.1,
  );

  // Labels / UI chrome
  static const TextStyle labelLarge = TextStyle(
    fontFamily: ui,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.4,
    letterSpacing: 0.1,
  );

  static const TextStyle labelMedium = TextStyle(
    fontFamily: ui,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.4,
    letterSpacing: 0.2,
  );

  static const TextStyle labelSmall = TextStyle(
    fontFamily: ui,
    fontSize: 11,
    fontWeight: FontWeight.w500,
    height: 1.4,
    letterSpacing: 0.3,
  );

  // Monospace - Numbers, durations, dates, codes
  static const TextStyle monoLarge = TextStyle(
    fontFamily: mono,
    fontSize: 48,
    fontWeight: FontWeight.w600,
    height: 1.1,
    letterSpacing: -0.5,
    fontFeatures: [FontFeature.tabularFigures()],
  );

  static const TextStyle monoMedium = TextStyle(
    fontFamily: mono,
    fontSize: 24,
    fontWeight: FontWeight.w500,
    height: 1.2,
    letterSpacing: -0.2,
    fontFeatures: [FontFeature.tabularFigures()],
  );

  static const TextStyle monoSmall = TextStyle(
    fontFamily: mono,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1.4,
    letterSpacing: 0,
    fontFeatures: [FontFeature.tabularFigures()],
  );

  static const TextStyle monoXSmall = TextStyle(
    fontFamily: mono,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.4,
    letterSpacing: 0,
    fontFeatures: [FontFeature.tabularFigures()],
  );

  // Microcopy / Caption
  static const TextStyle caption = TextStyle(
    fontFamily: ui,
    fontSize: 10,
    fontWeight: FontWeight.w400,
    height: 1.4,
    letterSpacing: 0.3,
  );

  static const TextStyle overline = TextStyle(
    fontFamily: ui,
    fontSize: 10,
    fontWeight: FontWeight.w600,
    height: 1.4,
    letterSpacing: 0.8,
  );
}

/// Motion - purposeful and quick (150-250ms), eased
class Motion {
  static const Duration fast = Duration(milliseconds: 150);
  static const Duration normal = Duration(milliseconds: 200);
  static const Duration slow = Duration(milliseconds: 250);

  static const Curve easeOut = Curves.easeOutCubic;
  static const Curve easeInOut = Curves.easeInOutCubic;
  static const Curve spring = Curves.elasticOut;
}

/// Breakpoints for responsive design
class Breakpoints {
  static const double mobile = 0;
  static const double tablet = 600;
  static const double desktop = 900;
  static const double wide = 1200;
}

/// Shadow/elevation - flat design, minimal shadows
class Elevation {
  static const List<BoxShadow> none = [];
  static const List<BoxShadow> hairline = [
    BoxShadow(
      color: Color(0x0A000000),
      blurRadius: 1,
      offset: Offset(0, 1),
    ),
  ];
  static const List<BoxShadow> card = [
    BoxShadow(
      color: Color(0x0D000000),
      blurRadius: 4,
      offset: Offset(0, 1),
    ),
  ];
  static const List<BoxShadow> modal = [
    BoxShadow(
      color: Color(0x1A000000),
      blurRadius: 24,
      offset: Offset(0, 8),
    ),
  ];
}

/// Icon sizes
class IconSizes {
  static const double xs = 14.0;
  static const double sm = 18.0;
  static const double md = 22.0;
  static const double lg = 28.0;
  static const double xl = 36.0;
}

/// Touch targets - minimum 48dp
class TouchTargets {
  static const double minSize = 48.0;
  static const double comfortable = 56.0;
}

/// Semantic color accessor
abstract class SemanticColors {
  Color get canvas;
  Color get surface;
  Color get surfaceElevated;
  Color get ink;
  Color get inkMuted;
  Color get inkSubtle;
  Color get border;
  Color get borderStrong;
  Color get accent;
  Color get accentHover;
  Color get accentLight;
  Color get accentMuted;
  Color get success;
  Color get successLight;
  Color get warning;
  Color get warningLight;
  Color get error;
  Color get errorLight;
  Color get focus;
  Color get disabled;
}

/// Light semantic colors implementation
class LightSemanticColors implements SemanticColors {
  const LightSemanticColors();
  @override Color get canvas => LightColors.canvas;
  @override Color get surface => LightColors.surface;
  @override Color get surfaceElevated => LightColors.surfaceElevated;
  @override Color get ink => LightColors.ink;
  @override Color get inkMuted => LightColors.inkMuted;
  @override Color get inkSubtle => LightColors.inkSubtle;
  @override Color get border => LightColors.border;
  @override Color get borderStrong => LightColors.borderStrong;
  @override Color get accent => LightColors.accent;
  @override Color get accentHover => LightColors.accentHover;
  @override Color get accentLight => LightColors.accentLight;
  @override Color get accentMuted => LightColors.accentMuted;
  @override Color get success => LightColors.success;
  @override Color get successLight => LightColors.successLight;
  @override Color get warning => LightColors.warning;
  @override Color get warningLight => LightColors.warningLight;
  @override Color get error => LightColors.error;
  @override Color get errorLight => LightColors.errorLight;
  @override Color get focus => LightColors.focus;
  @override Color get disabled => LightColors.disabled;
}

/// Dark semantic colors implementation
class DarkSemanticColors implements SemanticColors {
  const DarkSemanticColors();
  @override Color get canvas => DarkColors.canvas;
  @override Color get surface => DarkColors.surface;
  @override Color get surfaceElevated => DarkColors.surfaceElevated;
  @override Color get ink => DarkColors.ink;
  @override Color get inkMuted => DarkColors.inkMuted;
  @override Color get inkSubtle => DarkColors.inkSubtle;
  @override Color get border => DarkColors.border;
  @override Color get borderStrong => DarkColors.borderStrong;
  @override Color get accent => DarkColors.accent;
  @override Color get accentHover => DarkColors.accentHover;
  @override Color get accentLight => DarkColors.accentLight;
  @override Color get accentMuted => DarkColors.accentMuted;
  @override Color get success => DarkColors.success;
  @override Color get successLight => DarkColors.successLight;
  @override Color get warning => DarkColors.warning;
  @override Color get warningLight => DarkColors.warningLight;
  @override Color get error => DarkColors.error;
  @override Color get errorLight => DarkColors.errorLight;
  @override Color get focus => DarkColors.focus;
  @override Color get disabled => DarkColors.disabled;
}