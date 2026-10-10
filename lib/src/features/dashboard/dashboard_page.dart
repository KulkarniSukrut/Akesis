/// Dashboard Page - Main "Today" view
/// Hero element: single "today" statement and progress

library features.dashboard;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../core/design/design.dart' as tokens;
import '../../domain/models/models.dart';
import '../../presentation/routing/routing.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;
    
    return Scaffold(
      backgroundColor: colors.canvas,
      body: CustomScrollView(
        slivers: [
          // App Bar
          SliverAppBar(
            pinned: true,
            floating: true,
            snap: true,
            title: Text(
              'Askesis',
              style: tokens.AppTypography.headlineMedium.copyWith(color: colors.ink),
            ),
            actions: [
              IconButton(
                icon: Icon(LucideIcons.settings, color: colors.inkMuted),
                onPressed: () => context.push(Routes.settings),
              ),
              const SizedBox(width: tokens.Spacing.sm),
            ],
          ),
          
          // Content
          SliverPadding(
            padding: const EdgeInsets.all(tokens.Spacing.screenMargin),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                // Today Hero Section
                _TodayHeroSection(),
                const SizedBox(height: tokens.Spacing.sectionGap),
                
                // Habits Progress
                _HabitsProgressCard(),
                const SizedBox(height: tokens.Spacing.sectionGap),
                
                // Priority Tasks
                _PriorityTasksCard(),
                const SizedBox(height: tokens.Spacing.sectionGap),
                
                // Quick Metrics
                _QuickMetricsCard(),
                const SizedBox(height: tokens.Spacing.sectionGap),
                
                // Daily Check-in Prompt
                _CheckInPromptCard(),
                const SizedBox(height: tokens.Spacing.xxl),
              ]),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push(Routes.checkin),
        backgroundColor: colors.accent,
        foregroundColor: colors.canvas,
        child: const Icon(LucideIcons.plus),
      ),
    );
  }
}

class _TodayHeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final now = DateTime.now();
    final dayName = _getDayName(now.weekday);
    final dateStr = '${now.day} ${_getMonthName(now.month)}';
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          dayName,
          style: tokens.AppTypography.overline.copyWith(color: colors.accent),
        ),
        const SizedBox(height: tokens.Spacing.xs),
        Text(
          dateStr,
          style: tokens.AppTypography.displayMedium.copyWith(color: colors.ink),
        ),
        const SizedBox(height: tokens.Spacing.md),
        Container(
          padding: const EdgeInsets.all(tokens.Spacing.cardPadding),
          decoration: BoxDecoration(
            color: colors.surface,
            border: Border.all(color: colors.border, width: 0.5),
            borderRadius: BorderRadius.circular(tokens.Radius.lg),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ready for a focused day',
                      style: tokens.AppTypography.headlineSmall.copyWith(color: colors.ink),
                    ),
                    const SizedBox(height: tokens.Spacing.xs),
                    Text(
                      'Track habits, complete tasks, and build momentum.',
                      style: tokens.AppTypography.bodyMedium.copyWith(color: colors.inkMuted),
                    ),
                  ],
                ),
              ),
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: colors.accentLight,
                  borderRadius: BorderRadius.circular(tokens.Radius.md),
                ),
                child: Icon(LucideIcons.sunrise, color: colors.accent, size: tokens.IconSizes.xl),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _getDayName(int weekday) {
    const names = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
    return names[weekday - 1];
  }

  String _getMonthName(int month) {
    const names = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return names[month - 1];
  }
}

class _HabitsProgressCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    
    return Container(
      padding: const EdgeInsets.all(tokens.Spacing.cardPadding),
      decoration: BoxDecoration(
        color: colors.surface,
        border: Border.all(color: colors.border, width: 0.5),
        borderRadius: BorderRadius.circular(tokens.Radius.lg),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Habits', style: tokens.AppTypography.headlineSmall.copyWith(color: colors.ink)),
              TextButton(
                onPressed: () {},
                child: Text('View all', style: tokens.AppTypography.labelMedium.copyWith(color: colors.accent)),
              ),
            ],
          ),
          const SizedBox(height: tokens.Spacing.md),
          // Placeholder habit items
          ...List.generate(3, (index) => _HabitItem(
            title: ['Morning Gym', 'Deep Work', 'Read 20 Pages'][index],
            category: ['fitness', 'work', 'learning'][index],
            completed: index == 1,
            streak: [4, 12, 7][index],
          )),
        ],
      ),
    );
  }
}

class _HabitItem extends StatelessWidget {
  final String title;
  final String category;
  final bool completed;
  final int streak;

  const _HabitItem({
    required this.title,
    required this.category,
    required this.completed,
    required this.streak,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: tokens.Spacing.xs),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: completed ? colors.success : Colors.transparent,
                border: Border.all(
                  color: completed ? colors.success : colors.border,
                  width: completed ? 0 : 1.5,
                ),
                borderRadius: BorderRadius.circular(tokens.Radius.sm),
              ),
              child: completed
                  ? Icon(LucideIcons.check, size: 16, color: colors.canvas)
                  : null,
            ),
          ),
          const SizedBox(width: tokens.Spacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: tokens.AppTypography.bodyMedium.copyWith(
                    color: completed ? colors.inkMuted : colors.ink,
                    decoration: completed ? TextDecoration.lineThrough : null,
                  ),
                ),
                Text(
                  category,
                  style: tokens.AppTypography.caption.copyWith(color: colors.inkSubtle),
                ),
              ],
            ),
          ),
          if (streak > 0)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: tokens.Spacing.sm, vertical: tokens.Spacing.xs),
              decoration: BoxDecoration(
                color: colors.warningLight,
                borderRadius: BorderRadius.circular(tokens.Radius.full),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(LucideIcons.flame, size: 12, color: colors.warning),
                  const SizedBox(width: tokens.Spacing.xs),
                  Text(
                    '${streak}d',
                    style: tokens.AppTypography.monoXSmall.copyWith(color: colors.warning),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _PriorityTasksCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    
    return Container(
      padding: const EdgeInsets.all(tokens.Spacing.cardPadding),
      decoration: BoxDecoration(
        color: colors.surface,
        border: Border.all(color: colors.border, width: 0.5),
        borderRadius: BorderRadius.circular(tokens.Radius.lg),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Priority Tasks', style: tokens.AppTypography.headlineSmall.copyWith(color: colors.ink)),
              TextButton(
                onPressed: () {},
                child: Text('View all', style: tokens.AppTypography.labelMedium.copyWith(color: colors.accent)),
              ),
            ],
          ),
          const SizedBox(height: tokens.Spacing.md),
          _TaskItem(
            title: 'Leg day: Squats & RDLs',
            category: 'fitness',
            priority: TaskPriority.high,
            dueToday: true,
          ),
          _TaskItem(
            title: 'Review DAA Graph Algorithms',
            category: 'study',
            priority: TaskPriority.medium,
            dueToday: true,
          ),
          _TaskItem(
            title: 'Build Personal OS Foundation',
            category: 'engineering',
            priority: TaskPriority.urgent,
            dueToday: false,
          ),
        ],
      ),
    );
  }
}

class _TaskItem extends StatelessWidget {
  final String title;
  final String category;
  final TaskPriority priority;
  final bool dueToday;

  const _TaskItem({
    required this.title,
    required this.category,
    required this.priority,
    required this.dueToday,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    
    Color priorityColor;
    switch (priority) {
      case TaskPriority.urgent:
        priorityColor = colors.error;
        break;
      case TaskPriority.high:
        priorityColor = colors.warning;
        break;
      case TaskPriority.medium:
        priorityColor = colors.accent;
        break;
      case TaskPriority.low:
        priorityColor = colors.inkSubtle;
        break;
    }
    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: tokens.Spacing.xs),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: priorityColor,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: tokens.Spacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: tokens.AppTypography.bodyMedium.copyWith(color: colors.ink)),
                Text(category, style: tokens.AppTypography.caption.copyWith(color: colors.inkSubtle)),
              ],
            ),
          ),
          if (dueToday)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: tokens.Spacing.sm, vertical: tokens.Spacing.xs),
              decoration: BoxDecoration(
                color: colors.accentLight,
                borderRadius: BorderRadius.circular(tokens.Radius.full),
              ),
              child: Text('Today', style: tokens.AppTypography.monoXSmall.copyWith(color: colors.accent)),
            ),
        ],
      ),
    );
  }
}

class _QuickMetricsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    
    return Container(
      padding: const EdgeInsets.all(tokens.Spacing.cardPadding),
      decoration: BoxDecoration(
        color: colors.surface,
        border: Border.all(color: colors.border, width: 0.5),
        borderRadius: BorderRadius.circular(tokens.Radius.lg),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Active Metrics', style: tokens.AppTypography.headlineSmall.copyWith(color: colors.ink)),
              TextButton(
                onPressed: () {},
                child: Text('Log', style: tokens.AppTypography.labelMedium.copyWith(color: colors.accent)),
              ),
            ],
          ),
          const SizedBox(height: tokens.Spacing.md),
          Row(
            children: [
              Expanded(child: _MetricItem(name: 'Body Weight', value: '91.5', unit: 'kg', color: colors.accent)),
              Expanded(child: _MetricItem(name: 'Deep Work', value: '120', unit: 'min', color: colors.success)),
              Expanded(child: _MetricItem(name: 'Water', value: '5', unit: 'glasses', color: colors.warning)),
              Expanded(child: _MetricItem(name: 'Mental Clarity', value: '8', unit: '/10', color: colors.inkMuted)),
            ],
          ),
        ],
      ),
    );
  }
}

class _MetricItem extends StatelessWidget {
  final String name;
  final String value;
  final String unit;
  final Color color;

  const _MetricItem({
    required this.name,
    required this.value,
    required this.unit,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name, style: tokens.AppTypography.caption.copyWith(color: colors.inkSubtle)),
        const SizedBox(height: tokens.Spacing.xs),
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(value, style: tokens.AppTypography.monoMedium.copyWith(color: color)),
            const SizedBox(width: 2),
            Text(unit, style: tokens.AppTypography.caption.copyWith(color: colors.inkSubtle)),
          ],
        ),
      ],
    );
  }
}

class _CheckInPromptCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    
    return Container(
      padding: const EdgeInsets.all(tokens.Spacing.cardPadding),
      decoration: BoxDecoration(
        color: colors.accentLight,
        border: Border.all(color: colors.accentMuted, width: 0.5),
        borderRadius: BorderRadius.circular(tokens.Radius.lg),
      ),
      child: Row(
        children: [
          Icon(LucideIcons.activity, color: colors.accent, size: tokens.IconSizes.lg),
          const SizedBox(width: tokens.Spacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Daily Check-in', style: tokens.AppTypography.titleMedium.copyWith(color: colors.ink)),
                Text(
                  'How are you feeling? Mood, energy, stress, productivity, sleep.',
                  style: tokens.AppTypography.bodySmall.copyWith(color: colors.inkMuted),
                ),
              ],
            ),
          ),
          FilledButton(
            onPressed: () {},
            style: FilledButton.styleFrom(
              backgroundColor: colors.accent,
              foregroundColor: colors.canvas,
            ),
            child: const Text('Log Check-in'),
          ),
        ],
      ),
    );
  }
}
