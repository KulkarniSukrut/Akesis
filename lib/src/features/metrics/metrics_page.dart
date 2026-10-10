/// Metrics Page

library features.metrics;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/design/design.dart' as tokens;

class MetricsPage extends ConsumerWidget {
  const MetricsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;
    
    return Scaffold(
      backgroundColor: colors.canvas,
      appBar: AppBar(
        title: Text('Metrics', style: tokens.AppTypography.headlineMedium.copyWith(color: colors.ink)),
      ),
      body: Center(
        child: Text(
          'Metrics Page - Coming Soon',
          style: tokens.AppTypography.bodyLarge.copyWith(color: colors.inkMuted),
        ),
      ),
    );
  }
}