/// Journal Page

library features.journal;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/design/design.dart' as tokens;

class JournalPage extends ConsumerWidget {
  const JournalPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;
    
    return Scaffold(
      backgroundColor: colors.canvas,
      appBar: AppBar(
        title: Text('Journal', style: tokens.AppTypography.headlineMedium.copyWith(color: colors.ink)),
      ),
      body: Center(
        child: Text(
          'Journal Page - Coming Soon',
          style: tokens.AppTypography.bodyLarge.copyWith(color: colors.inkMuted),
        ),
      ),
    );
  }
}