/// Daily Check-in Page
/// Log today's mood, energy, stress, productivity, sleep, and notes.

library features.checkin;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../core/design/design.dart' as tokens;
import '../../data/providers/repository_providers.dart';
import '../../data/supabase/supabase.dart';
import '../../domain/models/models.dart';

/// Stream of today's check-in for a user.
final _checkInProvider = StreamProvider.family<DailyCheckIn?, String>((ref, userId) =>
    ref.read(dailyCheckInRepositoryProvider).watchUserCheckIn(userId, DateTime.now()));

/// Check-ins from the last 30 days for a user.
final _historyProvider = FutureProvider.family<List<DailyCheckIn>, String>((ref, userId) {
  final now = DateTime.now();
  return ref.read(dailyCheckInRepositoryProvider).getByUserAndDateRange(
        userId,
        now.subtract(const Duration(days: 30)),
        now,
      );
});

class CheckInPage extends ConsumerStatefulWidget {
  const CheckInPage({super.key});

  @override
  ConsumerState<CheckInPage> createState() => _CheckInPageState();
}

class _CheckInPageState extends ConsumerState<CheckInPage> {
  int _mood = 5;
  int _energy = 5;
  int _stress = 5;
  int _productivity = 5;
  double _sleepHours = 0;
  final notesController = TextEditingController();
  final sleepController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final userId = ref.read(currentUserIdProvider);
    if (userId != null) {
      final existing = ref.read(_checkInProvider(userId)).value;
      if (existing != null) {
        _mood = existing.mood;
        _energy = existing.energy;
        _stress = existing.stress;
        _productivity = existing.productivity;
        _sleepHours = existing.sleepHours;
        notesController.text = existing.notes ?? '';
        sleepController.text = _sleepHours.toString();
      }
    }
  }

  @override
  void dispose() {
    notesController.dispose();
    sleepController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final userId = ref.watch(currentUserIdProvider);

    if (userId == null) {
      return Scaffold(
        backgroundColor: colors.canvas,
        appBar: AppBar(
          title: Text(
            'Daily Check-in',
            style: tokens.AppTypography.headlineMedium.copyWith(color: colors.ink),
          ),
        ),
        body: Center(
          child: Text(
            'Sign in to check in',
            style: tokens.AppTypography.bodyLarge.copyWith(color: colors.inkMuted),
          ),
        ),
      );
    }

    final checkInAsync = ref.watch(_checkInProvider(userId));
    final historyAsync = ref.watch(_historyProvider(userId));
    final existing = checkInAsync.value;

    return Scaffold(
      backgroundColor: colors.canvas,
      appBar: AppBar(
        title: Text(
          'Daily Check-in',
          style: tokens.AppTypography.headlineMedium.copyWith(color: colors.ink),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: tokens.Spacing.screenMargin,
          vertical: tokens.Spacing.md,
        ),
        children: [
          // Today's date caption
          Text(
            _formatDate(DateTime.now()),
            style: tokens.AppTypography.headlineMedium.copyWith(color: colors.ink),
          ),
          const SizedBox(height: tokens.Spacing.lg),

          // 1-10 sliders
          _sliderRow(
            label: 'Mood',
            value: _mood,
            onChanged: (v) => setState(() => _mood = v),
          ),
          _sliderRow(
            label: 'Energy',
            value: _energy,
            onChanged: (v) => setState(() => _energy = v),
          ),
          _sliderRow(
            label: 'Stress',
            value: _stress,
            onChanged: (v) => setState(() => _stress = v),
          ),
          _sliderRow(
            label: 'Productivity',
            value: _productivity,
            onChanged: (v) => setState(() => _productivity = v),
          ),
          const SizedBox(height: tokens.Spacing.md),

          // Sleep hours
          TextField(
            controller: sleepController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              labelText: 'Sleep hours',
              prefixIcon: Icon(
                LucideIcons.moon,
                size: tokens.IconSizes.sm,
                color: colors.inkMuted,
              ),
            ),
            style: tokens.AppTypography.bodyMedium.copyWith(color: colors.ink),
          ),
          const SizedBox(height: tokens.Spacing.md),

          // Notes
          TextField(
            controller: notesController,
            minLines: 1,
            maxLines: 3,
            decoration: InputDecoration(
              labelText: 'Notes',
              prefixIcon: Icon(
                LucideIcons.penLine,
                size: tokens.IconSizes.sm,
                color: colors.inkMuted,
              ),
            ),
            style: tokens.AppTypography.bodyMedium.copyWith(color: colors.ink),
          ),
          const SizedBox(height: tokens.Spacing.lg),

          // Save
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () => _saveCheckIn(context, userId, existing),
              style: FilledButton.styleFrom(
                backgroundColor: colors.accent,
                foregroundColor: colors.canvas,
                padding: const EdgeInsets.symmetric(
                  horizontal: tokens.Spacing.md,
                  vertical: tokens.Spacing.sm,
                ),
                minimumSize: const Size(
                  tokens.TouchTargets.minSize,
                  tokens.TouchTargets.minSize,
                ),
              ),
              child: const Text('Save check-in'),
            ),
          ),
          const SizedBox(height: tokens.Spacing.sectionGap),

          // Recent history
          Row(
            children: [
              Icon(
                LucideIcons.history,
                size: tokens.IconSizes.sm,
                color: colors.inkMuted,
              ),
              const SizedBox(width: tokens.Spacing.xs),
              Text(
                'Recent history',
                style: tokens.AppTypography.headlineSmall.copyWith(color: colors.ink),
              ),
            ],
          ),
          const SizedBox(height: tokens.Spacing.sm),
          historyAsync.when(
            data: (list) => ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: list.map((c) => ListTile(
                    onTap: () => setState(() {
                      _mood = c.mood;
                      _energy = c.energy;
                      _stress = c.stress;
                      _productivity = c.productivity;
                      _sleepHours = c.sleepHours;
                      sleepController.text = _sleepHours.toString();
                      notesController.text = c.notes ?? '';
                    }),
                    leading: Text(
                      _formatDate(c.checkInDate),
                      style: tokens.AppTypography.monoXSmall.copyWith(color: colors.inkMuted),
                    ),
                    title: Text(
                      'Mood ${c.mood} · Energy ${c.energy} · Stress ${c.stress} · Prod ${c.productivity}',
                      style: tokens.AppTypography.bodySmall.copyWith(color: colors.ink),
                    ),
                    trailing: Text(
                      '${c.sleepHours}h',
                      style: tokens.AppTypography.monoXSmall.copyWith(color: colors.inkMuted),
                    ),
                  )).toList(),
            ),
            loading: () => const SizedBox(),
            error: (_, __) => const SizedBox(),
          ),
        ],
      ),
    );
  }

  /// Labeled 1-10 slider with a leading label and trailing mono value.
  Widget _sliderRow({
    required String label,
    required int value,
    required ValueChanged<int> onChanged,
  }) {
    final colors = context.colors;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: tokens.Spacing.xs),
      child: Row(
        children: [
          SizedBox(
            width: 110,
            child: Text(
              label,
              style: tokens.AppTypography.bodyMedium.copyWith(color: colors.ink),
            ),
          ),
          Expanded(
            child: Slider(
              value: value.toDouble(),
              min: 1,
              max: 10,
              divisions: 9,
              label: '$value',
              onChanged: (v) => onChanged(v.round()),
            ),
          ),
          Text(
            '$value',
            style: tokens.AppTypography.monoSmall.copyWith(color: colors.ink),
          ),
        ],
      ),
    );
  }

  Future<void> _saveCheckIn(
    BuildContext context,
    String userId,
    DailyCheckIn? existing,
  ) async {
    final now = DateTime.now();
    final checkIn = DailyCheckIn(
      id: existing?.id ?? '',
      userId: userId,
      checkInDate: now,
      mood: _mood,
      energy: _energy,
      stress: _stress,
      productivity: _productivity,
      sleepHours: double.tryParse(sleepController.text) ?? 0,
      notes: notesController.text,
      createdAt: existing?.createdAt ?? now,
      updatedAt: now,
    );
    try {
      await ref.read(dailyCheckInRepositoryProvider).upsert(checkIn);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Check-in saved')),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to save check-in: $e')),
        );
      }
    }
  }

  /// 'd Mon' date caption, e.g. '10 Oct'.
  String _formatDate(DateTime date) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
    ];
    return '${date.day} ${months[date.month - 1]}';
  }
}