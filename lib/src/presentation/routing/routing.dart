/// Navigation and Routing Configuration
/// Uses go_router for declarative routing

library presentation.routing;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../core/design/design.dart' as tokens;
import '../../features/dashboard/dashboard_page.dart';
import '../../features/habits/habits_page.dart';
import '../../features/tasks/tasks_page.dart';
import '../../features/goals/goals_page.dart';
import '../../features/metrics/metrics_page.dart';
import '../../features/checkin/checkin_page.dart';
import '../../features/journal/journal_page.dart';
import '../../features/settings/settings_page.dart';

/// Route names
class Routes {
  static const String dashboard = '/';
  static const String habits = '/habits';
  static const String tasks = '/tasks';
  static const String goals = '/goals';
  static const String metrics = '/metrics';
  static const String checkin = '/checkin';
  static const String journal = '/journal';
  static const String settings = '/settings';
}

/// Navigation shell for bottom navigation bar
class NavigationShell extends ConsumerStatefulWidget {
  final Widget child;

  const NavigationShell({required this.child, super.key});

  @override
  ConsumerState<NavigationShell> createState() => _NavigationShellState();
}

class _NavigationShellState extends ConsumerState<NavigationShell> {
  int _currentIndex = 0;

  static const List<_NavItem> _navItems = [
    _NavItem(
      route: Routes.dashboard,
      label: 'Today',
      icon: LucideIcons.home,
      activeIcon: LucideIcons.home,
    ),
    _NavItem(
      route: Routes.habits,
      label: 'Habits',
      icon: LucideIcons.repeat,
      activeIcon: LucideIcons.repeat,
    ),
    _NavItem(
      route: Routes.tasks,
      label: 'Tasks',
      icon: LucideIcons.checkSquare,
      activeIcon: LucideIcons.checkSquare,
    ),
    _NavItem(
      route: Routes.goals,
      label: 'Goals',
      icon: LucideIcons.target,
      activeIcon: LucideIcons.target,
    ),
    _NavItem(
      route: Routes.checkin,
      label: 'Check-in',
      icon: LucideIcons.activity,
      activeIcon: LucideIcons.activity,
    ),
  ];

  void _onNavTap(int index) {
    setState(() => _currentIndex = index);
    context.go(_navItems[index].route);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: colors.surface,
          border: Border(
            top: BorderSide(color: colors.border, width: 0.5),
          ),
        ),
        child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(_navItems.length, (index) {
              final item = _navItems[index];
              final isActive = _currentIndex == index;
              return _NavButton(
                item: item,
                isActive: isActive,
                onTap: () => _onNavTap(index),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class _NavItem {
  final String route;
  final String label;
  final IconData icon;
  final IconData activeIcon;

  const _NavItem({
    required this.route,
    required this.label,
    required this.icon,
    required this.activeIcon,
  });
}

class _NavButton extends StatelessWidget {
  final _NavItem item;
  final bool isActive;
  final VoidCallback onTap;

  const _NavButton({
    required this.item,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(tokens.Radius.md),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: tokens.Spacing.md,
          vertical: tokens.Spacing.sm,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isActive ? item.activeIcon : item.icon,
              size: tokens.IconSizes.md,
              color: isActive ? colors.accent : colors.inkMuted,
            ),
            const SizedBox(height: tokens.Spacing.xs),
            Text(
              item.label,
              style: tokens.AppTypography.labelSmall.copyWith(
                color: isActive ? colors.accent : colors.inkMuted,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// App Router Provider
final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: Routes.dashboard,
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return NavigationShell(child: child);
        },
        routes: [
          GoRoute(
            path: Routes.dashboard,
            builder: (context, state) => const DashboardPage(),
          ),
          GoRoute(
            path: Routes.habits,
            builder: (context, state) => const HabitsPage(),
          ),
          GoRoute(
            path: Routes.tasks,
            builder: (context, state) => const TasksPage(),
          ),
          GoRoute(
            path: Routes.goals,
            builder: (context, state) => const GoalsPage(),
          ),
          GoRoute(
            path: Routes.metrics,
            builder: (context, state) => const MetricsPage(),
          ),
          GoRoute(
            path: Routes.checkin,
            builder: (context, state) => const CheckInPage(),
          ),
          GoRoute(
            path: Routes.journal,
            builder: (context, state) => const JournalPage(),
          ),
          GoRoute(
            path: Routes.settings,
            builder: (context, state) => const SettingsPage(),
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => _ErrorPage(error: state.error.toString()),
  );
});

class _ErrorPage extends StatelessWidget {
  final String error;

  const _ErrorPage({required this.error});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(tokens.Spacing.lg),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(LucideIcons.alertTriangle, size: 48, color: colors.error),
              const SizedBox(height: tokens.Spacing.md),
              Text(
                'Navigation Error',
                style: tokens.AppTypography.headlineMedium.copyWith(color: colors.ink),
              ),
              const SizedBox(height: tokens.Spacing.sm),
              Text(
                error,
                style: tokens.AppTypography.bodyMedium.copyWith(color: colors.inkMuted),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: tokens.Spacing.lg),
              ElevatedButton(
                onPressed: () => context.go(Routes.dashboard),
                child: const Text('Go Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
