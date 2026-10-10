/// Settings Page

library features.settings;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../core/design/design.dart' as tokens;
import '../../data/providers/repository_providers.dart';
import '../../data/supabase/supabase.dart';
import '../../domain/models/models.dart';
import '../../presentation/theme/theme_provider.dart';

final _profileProvider = FutureProvider.family<UserProfile?, String>((ref, userId) {
  return ref.read(userProfileRepositoryProvider).getCurrentUser();
});

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;
    final userId = ref.watch(currentUserIdProvider);
    final profileAsync = userId != null ? ref.watch(_profileProvider(userId)) : null;

    if (userId == null) {
      return Scaffold(
        backgroundColor: colors.canvas,
        appBar: AppBar(
          title: Text('Settings', style: tokens.AppTypography.headlineMedium.copyWith(color: colors.ink)),
        ),
        body: Center(
          child: Text(
            'Sign in to manage settings',
            style: tokens.AppTypography.bodyMedium.copyWith(color: colors.ink),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: colors.canvas,
      appBar: AppBar(
        title: Text('Settings', style: tokens.AppTypography.headlineMedium.copyWith(color: colors.ink)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(tokens.Spacing.screenMargin),
        children: [
          Text('Profile', style: tokens.AppTypography.overline.copyWith(color: colors.accent)),
          const SizedBox(height: tokens.Spacing.md),
          Container(
            decoration: BoxDecoration(
              color: colors.surface,
              border: Border.all(color: colors.border, width: 0.5),
              borderRadius: BorderRadius.circular(tokens.Radius.lg),
            ),
            child: _SettingsTile(
              icon: LucideIcons.user,
              title: profileAsync?.value?.fullName?.isNotEmpty == true
                  ? profileAsync!.value!.fullName!
                  : 'No name set',
              subtitle: 'Edit your profile',
              trailing: Icon(LucideIcons.chevronRight, color: colors.inkMuted),
              onTap: () => _showEditProfileDialog(context, ref, userId, profileAsync?.value),
            ),
          ),
          const SizedBox(height: tokens.Spacing.sectionGap),
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
                    groupValue: ref.watch(themeModeProvider),
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
                    groupValue: ref.watch(themeModeProvider),
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
                    groupValue: ref.watch(themeModeProvider),
                    onChanged: (value) => ref.read(themeModeProvider.notifier).setThemeMode(value!),
                    activeColor: colors.accent,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: tokens.Spacing.sectionGap),
          Text('Session', style: tokens.AppTypography.overline.copyWith(color: colors.accent)),
          const SizedBox(height: tokens.Spacing.md),
          Container(
            decoration: BoxDecoration(
              color: colors.surface,
              border: Border.all(color: colors.border, width: 0.5),
              borderRadius: BorderRadius.circular(tokens.Radius.lg),
            ),
            child: _SettingsTile(
              icon: LucideIcons.logOut,
              title: 'Sign out',
              subtitle: 'End your current session',
              trailing: Icon(LucideIcons.chevronRight, color: colors.inkMuted),
              onTap: () => _showSignOutDialog(context, ref),
            ),
          ),
          const SizedBox(height: tokens.Spacing.sectionGap),
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
            ),
          ),
        ],
      ),
    );
  }
