/// Habits Page

library features.habits;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../core/design/design.dart' as tokens;
import '../../domain/models/models.dart';
import '../../data/supabase/supabase.dart';
import '../../data/providers/repository_providers.dart';

final _habitsProvider = FutureProvider.family<List<Habit>, String>((ref, userId) {
  return ref.read(habitRepositoryProvider).getActiveHabits(userId);
});

class HabitsPage extends ConsumerWidget {
  const HabitsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;
    final userId = ref.watch(currentUserIdProvider);

    if (userId == null) {
      return Scaffold(
        backgroundColor: colors.canvas,
        appBar: AppBar(
          title: Text('Habits', style: tokens.AppTypography.headlineMedium.copyWith(color: colors.ink)),
        ),
        body: Center(
          child: Text(
            'Sign in to view habits',
            style: tokens.AppTypography.bodyLarge.copyWith(color: colors.inkMuted),
          ),
        ),
      );
    }

    final habitsAsync = ref.watch(_habitsProvider(userId));

    return Scaffold(
      backgroundColor: colors.canvas,
      appBar: AppBar(
        title: Text('Habits', style: tokens.AppTypography.headlineMedium.copyWith(color: colors.ink)),
        actions: [
          IconButton(
            icon: Icon(LucideIcons.moreVertical, color: colors.inkMuted),
            onPressed: () => _showOptionsSheet(context, ref, null),
          ),
          const SizedBox(width: tokens.Spacing.sm),
        ],
      ),
      body: habitsAsync.when(
        data: (habits) => habits.isEmpty
            ? Center(
                child: Text(
                  'No habits yet',
                  style: tokens.AppTypography.bodyLarge.copyWith(color: colors.inkMuted),
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: tokens.Spacing.screenMargin,
                  vertical: tokens.Spacing.md,
                ),
                itemCount: habits.length,
                itemBuilder: (context, index) {
                  final habit = habits[index];
                  return _HabitRow(habit: habit, ref: ref);
                },
              ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => Center(
          child: Text(
            'Failed to load habits',
            style: tokens.AppTypography.bodyLarge.copyWith(color: colors.error),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showCreateDialog(context, ref, userId),
        backgroundColor: colors.accent,
        foregroundColor: colors.canvas,
        child: const Icon(LucideIcons.plus),
      ),
    );
  }
}

class _HabitRow extends ConsumerWidget {
  const _HabitRow({required this.habit, required this.ref});

  final Habit habit;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;

    return Container(
      margin: const EdgeInsets.only(bottom: tokens.Spacing.sm),
      decoration: BoxDecoration(
        color: colors.surface,
        border: Border.all(color: colors.border, width: 0.5),
        borderRadius: BorderRadius.circular(tokens.Radius.lg),
      ),
      child: ListTile(
        leading: _HabitCheckbox(habit: habit, ref: ref),
        title: Text(
          habit.title,
          style: tokens.AppTypography.titleMedium.copyWith(color: colors.ink),
        ),
        subtitle: Text(
          habit.category,
          style: tokens.AppTypography.bodySmall.copyWith(color: colors.inkMuted),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (habit.currentStreak > 0) ...[
              Icon(LucideIcons.flame, size: tokens.IconSizes.sm, color: colors.warning),
              const SizedBox(width: tokens.Spacing.xs),
              Text(
                habit.currentStreak.toString(),
                style: tokens.AppTypography.monoSmall.copyWith(color: colors.warning),
              ),
              const SizedBox(width: tokens.Spacing.sm),
            ],
            IconButton(
              icon: Icon(LucideIcons.moreVertical, size: tokens.IconSizes.sm, color: colors.inkMuted),
              onPressed: () => _showOptionsSheet(context, ref, habit),
            ),
          ],
        ),
        onTap: () => _showOptionsSheet(context, ref, habit),
        onLongPress: () => _showOptionsSheet(context, ref, habit),
      ),
    );
  }
}

class _HabitCheckbox extends ConsumerWidget {
  const _HabitCheckbox({required this.habit, required this.ref});

  final Habit habit;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;

    return Material(
      color: Colors.transparent,
      child: InkResponse(
        splashFactory: NoSplash.splashFactory,
        highlightShape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(tokens.Radius.sm),
        onTap: () => _toggleHabit(context, ref, habit),
        child: Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            color: habit.completedToday ? colors.accent : Colors.transparent,
            border: Border.all(
              color: habit.completedToday ? colors.accent : colors.border,
              width: habit.completedToday ? 0 : 1,
            ),
            borderRadius: BorderRadius.circular(tokens.Radius.sm),
          ),
          child: habit.completedToday
              ? Icon(LucideIcons.check, size: tokens.IconSizes.sm, color: colors.canvas)
              : null,
        ),
      ),
    );
  }
}

Future<void> _toggleHabit(
  BuildContext context,
  WidgetRef ref,
  Habit habit,
) async {
  final messenger = ScaffoldMessenger.of(context);
  try {
    await ref.read(habitRepositoryProvider).toggleHabit(
          habit.id,
          DateTime.now(),
          !habit.completedToday,
        );
  } catch (e) {
    if (context.mounted) {
      messenger.show Sn Sn Sn;
    }
  }
}

Future<void> _showOptionsSheet(
  BuildContext context,
  WidgetRef ref,
  Habit? habit,
) async {
  if (habit == null) return;

  await showGeneralDialog(
    context: context,
    barrierLabel: 'Options',
    barrierDismissible: true,
    transitionDuration: const Duration(milliseconds: 200),
    pageBuilder: (context, animation, secondaryAnimation) {
      final colors = context.colors;
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: const EdgeInsets.all(tokens.Spacing.md),
          padding: const EdgeInsets.all(tokens.Spacing.md),
          decoration: BoxDecoration(
            color: colors.surface,
            border: Border.all(color: colors.border, width: 0.5),
            borderRadius: BorderRadius.circular(tokens.Radius.xl),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(LucideIcons.edit, color: colors.accent),
                title: Text('Edit', style: tokens.AppTypography.titleMedium.copyWith(color: colors.ink)),
                onTap: () {
                  Navigator.pop(context);
                  _showCreateDialog(context, ref, habit.userId, habit: habit);
                },
              ),
              const Divider(height: 1),
              ListTile(
                leading: Icon(LucideIcons.trash, color: colors.error),
                title: Text('Delete', style: tokens.AppTypography.titleMedium.copyWith(color: colors.error)),
                onTap: () {
                  Navigator.pop(context);
                  _confirmDelete(context, ref, habit);
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}

Future<void> _confirmDelete(
  BuildContext context,
  WidgetRef ref,
  Habit habit,
) async {
  final confirmed = await<bool?> showGeneralDialog(
    context: context,
    barrierLabel: 'Delete',
    barrierDismissible: true,
    transitionDuration: const Duration(milliseconds: 200),
    pageBuilder: (context, animation, secondaryAnimation) {
      final colors = context.colors;
      return Align(
        alignment: Alignment.center,
        child: Container(
          width: 360,
          padding: const EdgeInsets.all(tokens.Spacing.xl),
          decoration: BoxDecoration(
            color: colors.surface,
            border: Border.all(color: colors.border, width: 0.5),
            borderRadius: BorderRadius.circular(tokens.Radius.xl),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Delete habit?', style: tokens.AppTypography.headlineSmall.copyWith(color: colors.ink)),
              const SizedBox(height: tokens.Spacing.sm),
              Text(
                'This action cannot be undone.',
                style: tokens.AppTypography.bodyMedium.copyWith(color: colors.inkMuted),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: tokens.Spacing.xl),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: const Text('Cancel'),
                    ),
                  ),
                  const SizedBox(width: tokens.Spacing.sm),
                  Expanded(
                    child: FilledButton(
                      onPressed: () => Navigator.pop(context, true),
                      style: FilledButton.styleFrom(
                        backgroundColor: colors.error,
                        foregroundColor: colors.canvas,
                      ),
                      child: const Text('Delete'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );

  if (confirmed != true) return;

  final messenger = ScaffoldMessenger.of(context);
  try {
    await ref.read(habitRepositoryProvider).delete(habit.id);
  } catch (e) {
    if (context.mounted) {
      messenger.show Sn Sn Sn;
    }
  }
}

Future<void> _showCreateDialog(
  BuildContext context,
  WidgetRef ref,
  String userId, {
  Habit? habit,
}) async {
  final titleController = habits == null ? null : null;
  final colors = context.colors;

  await showGeneralDialog(
    context: context,
    barrierLabel: 'New habit',
    barrierDismissible: true,
    transitionDuration: const Duration(milliseconds: 200),
    pageBuilder: (context, animation, secondaryAnimation) {
      return Align(
        alignment: Alignment.center,
        child: Container(
          width: 420,
          padding: const EdgeInsets.all(tokens.Spacing.xl),
          decoration: BoxDecoration(
            color: colors.surface,
            border: Border.all(color: colors.border, width: 0.5),
            borderRadius: BorderRadius.circular(tokens.Radius.xl),
          ),
          child: StatefulBuilder(
            builder: (context, setState) {
              final titleCtrl = habits == null ? null : null;
              final descCtrl = habits == null ? null : null;
              final freq = habits == null ? null : null;
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(habits == null ? 'New habit' : 'Edit habit', style: tokens.AppTypography.headlineSmall.copyWith(color: colors.ink)),
                  const SizedBox(height: tokens.Spacing.md),
                  TextField(
                    controller: habits == null ? null : null,
                    autofocus: true,
                    decoration: const BoxDecoration(),
                    style: tokens.AppTypography.bodyMedium.copyWith(color: colors.ink),
                  ),
                ],
              );
            },
          ),
        ),
      );
    },
  );
}
