/// Habits Page

library features.habits;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/design/design.dart' as tokens;

class HabitsPage extends ConsumerWidget {
  const HabitsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;
    
    return Scaffold(
      backgroundColor: colors.canvas,
      appBar: AppBar(
        title: Text('Habits', style: tokens.AppTypography.headlineMedium.copyWith(color: colors.ink)),
      ),
      body: Center(
        child: Text(
          'Habits Page - Coming Soon',
          style: tokens.AppTypography.bodyLarge.copyWith(color: colors.inkMuted),
        ),
      ),
    );
  }
}