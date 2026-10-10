/// Settings Page

library features.settings;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../core/design/design.dart' as tokens;
import '../../presentation/theme/theme_provider.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;
    final themeMode = ref.watch(themeModeProvider);
    
    return Scaffold(
      backgroundColor: colors.canvas,
      appBar: AppBar(
        title: Text('Settings', style: tokens.AppTypography.headlineMedium.copyWith(color: colors.ink)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(tokens.Spacing.screenMargin),
        children: [
          // Appearance Section
          Text('Appearance', style: tokens.AppTypography.overline.copyWith(color: colors.accent)),
          const SizedBox(height: tokens.Spacing.md),
          Container(
            decoration: BoxDecoration(
              color: colors.surface,
              border: Border.all(color: colors.border, width: 0.5),
              borderRadius: BorderRadius.circular(tokens.Radius.lg),
            ),
            child: Column(
              children: [
                _SettingsTile(
                  icon: LucideIcons.sun,
                  title: 'Light',
                  subtitle: 'Always use light mode',
                  trailing: Radio<ThemeMode>(
                    value: ThemeMode.light,
                    groupValue: themeMode,
                    onChanged: (value) => ref.read(themeModeProvider.notifier).setThemeMode(value!),
                    activeColor: colors.accent,
                  ),
                ),
                Divider(height: 1, color: colors.border, indent: tokens.Spacing.lg),
                _SettingsTile(
                  icon: LucideIcons.moon,
                  title: 'Dark',
                  subtitle: 'Always use dark mode',
                  trailing: Radio<ThemeMode>(
                    value: ThemeMode.dark,
                    groupValue: themeMode,
                    onChanged: (value) => ref.read(themeModeProvider.notifier).setThemeMode(value!),
                    activeColor: colors.accent,
                  ),
                ),
                Divider(height: 1, color: colors.border, indent: tokens.Spacing.lg),
                _SettingsTile(
                  icon: LucideIcons.monitor,
                  title: 'System',
                  subtitle: 'Follow system preference',
                  trailing: Radio<ThemeMode>(
                    value: ThemeMode.system,
                    groupValue: themeMode,
                    onChanged: (value) => ref.read(themeModeProvider.notifier).setThemeMode(value!),
                    activeColor: colors.accent,
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: tokens.Spacing.sectionGap),
          
          // Data Section
          Text('Data', style: tokens.AppTypography.overline.copyWith(color: colors.accent)),
          const SizedBox(height: tokens.Spacing.md),
          Container(
            decoration: BoxDecoration(
              color: colors.surface,
              border: Border.all(color: colors.border, width: 0.5),
              borderRadius: BorderRadius.circular(tokens.Radius.lg),
            ),
            child: Column(
              children: [
                _SettingsTile(
                  icon: LucideIcons.download,
                  title: 'Export Data',
                  subtitle: 'Download all your data as JSON',
                  trailing: Icon(LucideIcons.chevronRight, color: colors.inkMuted),
                  onTap: () {},
                ),
                Divider(height: 1, color: colors.border, indent: tokens.Spacing.lg),
                _SettingsTile(
                  icon: LucideIcons.database,
                  title: 'Supabase Config',
                  subtitle: 'Configure backend connection',
                  trailing: Icon(LucideIcons.chevronRight, color: colors.inkMuted),
                  onTap: () {},
                ),
              ],
            ),
          ),
          
          const SizedBox(height: tokens.Spacing.sectionGap),
          
          // About Section
          Text('About', style: tokens.AppTypography.overline.copyWith(color: colors.accent)),
          const SizedBox(height: tokens.Spacing.md),
          Container(
            decoration: BoxDecoration(
              color: colors.surface,
              border: Border.all(color: colors.border, width: 0.5),
              borderRadius: BorderRadius.circular(tokens.Radius.lg),
            ),
            child: _SettingsTile(
              icon: LucideIcons.info,
              title: 'Askesis',
              subtitle: 'Personal Operating System v1.0.0',
              trailing: Icon(LucideIcons.chevronRight, color: colors.inkMuted),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Widget trailing;
  final VoidCallback? onTap;

  const _SettingsTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(tokens.Radius.lg),
      child: Padding(
        padding: const EdgeInsets.all(tokens.Spacing.md),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: colors.accentLight,
                borderRadius: BorderRadius.circular(tokens.Radius.md),
              ),
              child: Icon(icon, color: colors.accent, size: tokens.IconSizes.md),
            ),
            const SizedBox(width: tokens.Spacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: tokens.AppTypography.bodyMedium.copyWith(color: colors.ink)),
                  Text(subtitle, style: tokens.AppTypography.bodySmall.copyWith(color: colors.inkMuted)),
                ],
              ),
            ),
            trailing,
          ],
        ),
      ),
    );
  }
}