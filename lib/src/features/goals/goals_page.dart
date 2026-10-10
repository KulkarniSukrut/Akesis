import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../core/design/design.dart' as tokens;
import '../../data/providers/repository_providers.dart';
import '../../data/supabase/supabase.dart';
import '../../domain/models/models.dart';

final _goalsProvider = FutureProvider.family<List<Goal>, String>((ref, userId) =>
    ref.read(goalRepositoryProvider).getByUserId(userId));

final _objectivesProvider = FutureProvider.family<List<Objective>, String>((ref, goalId) =>
    ref.read(objectiveRepositoryProvider).getByGoalId(goalId));

class GoalsPage extends ConsumerWidget {
  const GoalsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;
    final userId = ref.watch(currentUserIdProvider);

    if (userId == null) {
      return Scaffold(
        backgroundColor: colors.canvas,
        appBar: AppBar(
          title: Text('Goals', style: tokens.AppTypography.headlineMedium.copyWith(color: colors.ink)),
        ),
        body: Center(
          child: Text(
            'Sign in to view goals',
            style: tokens.AppTypography.bodyLarge.copyWith(color: colors.inkMuted),
          ),
        ),
      );
    }

    final goalsAsync = ref.watch(_goalsProvider(userId));

    return Scaffold(
      backgroundColor: colors.canvas,
      appBar: AppBar(
        title: Text('Goals', style: tokens.AppTypography.headlineMedium.copyWith(color: colors.ink)),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colors.accent,
        foregroundColor: colors.canvas,
        onPressed: () => _showCreateGoalDialog(context, ref, userId),
        child: const Icon(LucideIcons.plus),
      ),
      body: goalsAsync.when(
        data: (goals) => ListView(
          padding: EdgeInsets.all(tokens.Spacing.md),
          children: goals.map((goal) => _GoalCard(goal: goal)).toList(),
        ),
        loading: () => Center(child: CircularProgressIndicator(color: colors.accent)),
        error: (_, __) => Center(
          child: Text(
            'Failed to load goals',
            style: tokens.AppTypography.bodyLarge.copyWith(color: colors.inkMuted),
          ),
        ),
      ),
    );
  }

  void _showCreateGoalDialog(BuildContext context, WidgetRef ref, String userId) {
    final colors = context.colors;
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    GoalCategory selectedCategory = GoalCategory.other;
    DateTime? targetDate;
    double progress = 0;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          backgroundColor: colors.surface,
          title: Text('Create Goal', style: tokens.AppTypography.headlineSmall.copyWith(color: colors.ink)),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    labelText: 'Title',
                    labelStyle: tokens.AppTypography.bodyMedium.copyWith(color: colors.inkMuted),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(tokens.Radius.md),
                      borderSide: BorderSide(color: colors.border),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(tokens.Radius.md),
                      borderSide: BorderSide(color: colors.accent, width: 2),
                    ),
                  ),
                  style: tokens.AppTypography.bodyMedium.copyWith(color: colors.ink),
                ),
                SizedBox(height: tokens.Spacing.md),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    labelText: 'Description (optional)',
                    labelStyle: tokens.AppTypography.bodyMedium.copyWith(color: colors.inkMuted),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(tokens.Radius.md),
                      borderSide: BorderSide(color: colors.border),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(tokens.Radius.md),
                      borderSide: BorderSide(color: colors.accent, width: 2),
                    ),
                  ),
                  style: tokens.AppTypography.bodyMedium.copyWith(color: colors.ink),
                  maxLines: 3,
                ),
                SizedBox(height: tokens.Spacing.md),
                DropdownButtonFormField<GoalCategory>(
                  value: selectedCategory,
                  decoration: InputDecoration(
                    labelText: 'Category',
                    labelStyle: tokens.AppTypography.bodyMedium.copyWith(color: colors.inkMuted),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(tokens.Radius.md),
                      borderSide: BorderSide(color: colors.border),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(tokens.Radius.md),
                      borderSide: BorderSide(color: colors.accent, width: 2),
                    ),
                  ),
                  dropdownColor: colors.surface,
                  style: tokens.AppTypography.bodyMedium.copyWith(color: colors.ink),
                  items: GoalCategory.values.map((cat) => DropdownMenuItem(
                    value: cat,
                    child: Text(cat.name[0].toUpperCase() + cat.name.substring(1)),
                  )).toList(),
                  onChanged: (val) => setState(() => selectedCategory = val!),
                ),
                SizedBox(height: tokens.Spacing.md),
                InkWell(
                  onTap: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now().add(const Duration(days: 30)),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 3650)),
                      builder: (context, child) => Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: ColorScheme.light(
                            primary: colors.accent,
                            onPrimary: colors.canvas,
                            surface: colors.surface,
                            onSurface: colors.ink,
                          ),
                        ),
                        child: child!,
                      ),
                    );
                    if (picked != null) setState(() => targetDate = picked);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: tokens.Spacing.md, vertical: tokens.Spacing.sm),
                    decoration: BoxDecoration(
                      border: Border.all(color: colors.border),
                      borderRadius: BorderRadius.circular(tokens.Radius.md),
                    ),
                    child: Row(
                      children: [
                        Icon(LucideIcons.calendar, size: tokens.IconSizes.sm, color: colors.inkMuted),
                        SizedBox(width: tokens.Spacing.sm),
                        Text(
                          targetDate == null
                              ? 'Target Date (optional)'
                              : '${targetDate!.day}/${targetDate!.month}/${targetDate!.year}',
                          style: tokens.AppTypography.bodyMedium.copyWith(
                            color: targetDate == null ? colors.inkMuted : colors.ink,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: tokens.Spacing.md),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Progress: ${progress.round()}%',
                      style: tokens.AppTypography.bodyMedium.copyWith(color: colors.ink),
                    ),
                    Slider(
                      value: progress,
                      min: 0,
                      max: 100,
                      divisions: 100,
                      label: 'Progress',
                      activeColor: colors.accent,
                      inactiveColor: colors.border,
                      onChanged: (val) => setState(() => progress = val),
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel', style: tokens.AppTypography.bodyMedium.copyWith(color: colors.inkMuted)),
            ),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: colors.accent,
                foregroundColor: colors.canvas,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(tokens.Radius.md)),
              ),
              onPressed: () async {
                final title = titleController.text.trim();
                if (title.isEmpty) return;

                final now = DateTime.now();
                final goal = Goal(
                  id: '',
                  userId: userId,
                  title: title,
                  description: descriptionController.text.trim().isEmpty ? null : descriptionController.text.trim(),
                  category: selectedCategory.name,
                  targetDate: targetDate,
                  progress: progress.round(),
                  createdAt: now,
                  updatedAt: now,
                );

                try {
                  await ref.read(goalRepositoryProvider).create(goal);
                  if (context.mounted) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Goal created', style: tokens.AppTypography.bodyMedium.copyWith(color: colors.canvas)),
                        backgroundColor: colors.success,
                      ),
                    );
                  }
                } catch (e) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Failed to create goal', style: tokens.AppTypography.bodyMedium.copyWith(color: colors.canvas)),
                        backgroundColor: colors.error,
                      ),
                    );
                  }
                }
              },
              child: Text('Create', style: tokens.AppTypography.bodyMedium.copyWith(color: colors.canvas)),
            ),
          ],
        ),
      ),
    );
  }
}

class _GoalCard extends ConsumerWidget {
  final Goal goal;

  const _GoalCard({required this.goal});

  Color _statusColor(BuildContext context, GoalStatus status) {
    final colors = context.colors;
    switch (status) {
      case GoalStatus.completed:
        return colors.success;
      case GoalStatus.inProgress:
        return colors.accent;
      case GoalStatus.notStarted:
        return colors.inkSubtle;
      case GoalStatus.archived:
        return colors.inkMuted;
    }
  }

  String _statusLabel(GoalStatus status) {
    switch (status) {
      case GoalStatus.completed:
        return 'Completed';
      case GoalStatus.inProgress:
        return 'In Progress';
      case GoalStatus.notStarted:
        return 'Not Started';
      case GoalStatus.archived:
        return 'Archived';
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;
    final objectivesAsync = ref.watch(_objectivesProvider(goal.id));

    return Container(
      margin: EdgeInsets.only(bottom: tokens.Spacing.md),
      padding: EdgeInsets.all(tokens.Spacing.md),
      decoration: BoxDecoration(
        color: colors.surface,
        border: Border.all(color: colors.border, width: 0.5),
        borderRadius: BorderRadius.circular(tokens.Radius.lg),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            goal.title,
                            style: tokens.AppTypography.headlineSmall.copyWith(color: colors.ink),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        PopupMenuButton<String>(
                          icon: Icon(LucideIcons.moreVertical, size: tokens.IconSizes.md, color: colors.inkMuted),
                          color: colors.surface,
                          onSelected: (value) {
                            if (value == 'delete') _showDeleteConfirmation(context, ref);
                          },
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              value: 'delete',
                              child: Row(
                                children: [
                                  Icon(LucideIcons.trash2, size: tokens.IconSizes.sm, color: colors.error),
                                  SizedBox(width: tokens.Spacing.sm),
                                  Text('Delete', style: tokens.AppTypography.bodyMedium.copyWith(color: colors.error)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: tokens.Spacing.xs),
                    if (goal.description != null && goal.description!.isNotEmpty)
                      Text(
                        goal.description!,
                        style: tokens.AppTypography.bodyMedium.copyWith(color: colors.inkSubtle),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    SizedBox(height: tokens.Spacing.xs),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: tokens.Spacing.sm, vertical: tokens.Spacing.xxs),
                          decoration: BoxDecoration(
                            color: _statusColor(context, goal.status).withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(tokens.Radius.sm),
                          ),
                          child: Text(
                            _statusLabel(goal.status),
                            style: tokens.AppTypography.caption.copyWith(color: _statusColor(context, goal.status)),
                          ),
                        ),
                        SizedBox(width: tokens.Spacing.sm),
                        Text(
                          goal.category[0].toUpperCase() + goal.category.substring(1),
                          style: tokens.AppTypography.caption.copyWith(color: colors.inkMuted),
                        ),
                        if (goal.targetDate != null) ...[
                          SizedBox(width: tokens.Spacing.sm),
                          Icon(LucideIcons.calendar, size: tokens.IconSizes.xs, color: colors.inkMuted),
                          SizedBox(width: tokens.Spacing.xxs),
                          Text(
                            '${goal.targetDate!.day}/${goal.targetDate!.month}/${goal.targetDate!.year}',
                            style: tokens.AppTypography.caption.copyWith(color: colors.inkMuted),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: tokens.Spacing.md),
          LinearProgressIndicator(
            value: (goal.progress / 100).clamp(0.0, 1.0),
            backgroundColor: colors.border,
            valueColor: AlwaysStoppedAnimation(colors.accent),
            minHeight: 6,
            borderRadius: BorderRadius.circular(tokens.Radius.sm),
          ),
          SizedBox(height: tokens.Spacing.md),
          objectivesAsync.when(
            data: (objectives) {
              if (objectives.isEmpty) {
                return Text(
                  'No objectives yet',
                  style: tokens.AppTypography.bodyMedium.copyWith(color: colors.inkMuted),
                );
              }
              return Column(
                children: objectives.map((obj) => _ObjectiveRow(
                  objective: obj,
                  onTap: () => _toggleObjective(context, ref, obj),
                )).toList(),
              );
            },
            loading: () => Center(
              child: Padding(
                padding: EdgeInsets.all(tokens.Spacing.md),
                child: CircularProgressIndicator(color: colors.accent, strokeWidth: 2),
              ),
            ),
            error: (_, __) => Text(
              'Failed to load objectives',
              style: tokens.AppTypography.bodyMedium.copyWith(color: colors.error),
            ),
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context, WidgetRef ref) {
    final colors = context.colors;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: colors.canvas,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(tokens.Radius.lg)),
      ),
      builder: (context) => Container(
        padding: EdgeInsets.all(tokens.Spacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Delete Goal?',
              style: tokens.AppTypography.headlineSmall.copyWith(color: colors.ink),
            ),
            SizedBox(height: tokens.Spacing.sm),
            Text(
              'This action cannot be undone. All objectives will also be deleted.',
              style: tokens.AppTypography.bodyMedium.copyWith(color: colors.inkMuted),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: tokens.Spacing.lg),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: tokens.Spacing.md),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(tokens.Radius.md)),
                    ),
                    child: Text('Cancel', style: tokens.AppTypography.bodyMedium.copyWith(color: colors.inkMuted)),
                  ),
                ),
                SizedBox(width: tokens.Spacing.md),
                Expanded(
                  child: FilledButton(
                    onPressed: () async {
                      Navigator.pop(context);
                      try {
                        await ref.read(goalRepositoryProvider).delete(goal.id);
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Goal deleted', style: tokens.AppTypography.bodyMedium.copyWith(color: colors.canvas)),
                              backgroundColor: colors.success,
                            ),
                          );
                        }
                      } catch (e) {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Failed to delete goal', style: tokens.AppTypography.bodyMedium.copyWith(color: colors.canvas)),
                              backgroundColor: colors.error,
                            ),
                          );
                        }
                      }
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: colors.error,
                      foregroundColor: colors.canvas,
                      padding: EdgeInsets.symmetric(vertical: tokens.Spacing.md),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(tokens.Radius.md)),
                    ),
                    child: Text('Delete', style: tokens.AppTypography.bodyMedium.copyWith(color: colors.canvas)),
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
          ],
        ),
      ),
    );
  }

  void _toggleObjective(BuildContext context, WidgetRef ref, Objective objective) async {
    final colors = context.colors;
    try {
      await ref.read(objectiveRepositoryProvider).markCompleted(objective.id);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              objective.isCompleted ? 'Objective marked incomplete' : 'Objective completed',
              style: tokens.AppTypography.bodyMedium.copyWith(color: colors.canvas),
            ),
            backgroundColor: colors.success,
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to update objective', style: tokens.AppTypography.bodyMedium.copyWith(color: colors.canvas)),
            backgroundColor: colors.error,
          ),
        );
      }
    }
  }
}

class _ObjectiveRow extends StatelessWidget {
  final Objective objective;
  final VoidCallback onTap;

  const _ObjectiveRow({required this.objective, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(tokens.Radius.md),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: tokens.Spacing.xs),
        child: Row(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: objective.isCompleted ? colors.accent : Colors.transparent,
                border: Border.all(
                  color: objective.isCompleted ? colors.accent : colors.border,
                  width: objective.isCompleted ? 0 : 1.5,
                ),
                borderRadius: BorderRadius.circular(tokens.Radius.sm),
              ),
              child: objective.isCompleted
                  ? Icon(LucideIcons.check, size: 14, color: colors.canvas)
                  : null,
            ),
            SizedBox(width: tokens.Spacing.sm),
            Expanded(
              child: Text(
                objective.title,
                style: tokens.AppTypography.bodyMedium.copyWith(
                  color: objective.isCompleted ? colors.inkMuted : colors.ink,
                  decoration: objective.isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
