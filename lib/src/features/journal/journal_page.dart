/// Journal Page

library features.journal;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../core/design/design.dart' as tokens;
import '../../data/providers/repository_providers.dart';
import '../../data/supabase/supabase.dart';
import '../../domain/models/models.dart';

final _journalProvider = StreamProvider.family<List<JournalEntry>, String>((ref, userId) =>
    ref.read(journalRepositoryProvider).watchUserJournals(userId));

class JournalPage extends ConsumerWidget {
  const JournalPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;

    return Scaffold(
      backgroundColor: colors.canvas,
      appBar: AppBar(
        title: Text('Journal', style: tokens.AppTypography.headlineMedium.copyWith(color: colors.ink)),
        actions: [
          IconButton(
            icon: Icon(LucideIcons.search, color: colors.ink, size: tokens.IconSizes.md),
            onPressed: () {},
          ),
        ],
      ),
      body: _JournalBody(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colors.accent,
        foregroundColor: colors.canvas,
        onPressed: () => _openEditorSheet(context, ref, null),
        child: Icon(LucideIcons.plus, size: tokens.IconSizes.md),
      ),
    );
  }

  void _openEditorSheet(BuildContext context, WidgetRef ref, JournalEntry? entry) {
    final userId = ref.read(currentUserIdProvider);
    if (userId == null) return;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: colors.canvas,
      builder: (ctx) => _JournalEditorSheet(entry: entry, userId: userId),
    );
  }
}

class _JournalBody extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;
    final userId = ref.watch(currentUserIdProvider);

    if (userId == null) {
      return Center(
        child: Text('Sign in to journal', style: tokens.AppTypography.bodyLarge.copyWith(color: colors.inkMuted)),
      );
    }

    final journalAsync = ref.watch(_journalProvider(userId));

    return journalAsync.when(
      data: (entries) {
        final sorted = [...entries]..sort((a, b) => b.entryDate.compareTo(a.entryDate));
        if (sorted.isEmpty) {
          return Center(
            child: Text('No entries yet', style: tokens.AppTypography.bodyLarge.copyWith(color: colors.inkMuted)),
          );
        }
        return ListView.separated(
          padding: EdgeInsets.all(tokens.Spacing.md),
          itemCount: sorted.length,
          separatorBuilder: (_, __) => SizedBox(height: tokens.Spacing.sm),
          itemBuilder: (_, index) => _JournalEntryTile(entry: sorted[index], onTap: () {
            _openEditorSheet(context, ref, sorted[index]);
          }),
        );
      },
      loading: () => Center(child: CircularProgressIndicator(color: colors.accent)),
      error: (_, __) => Center(child: Text('Failed to load journal', style: tokens.AppTypography.bodyLarge.copyWith(color: colors.error))),
    );
  }

  void _openEditorSheet(BuildContext context, WidgetRef ref, JournalEntry entry) {
    final userId = ref.read(currentUserIdProvider);
    if (userId == null) return;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: context.colors.canvas,
      builder: (ctx) => _JournalEditorSheet(entry: entry, userId: userId),
    );
  }
}

class _JournalEntryTile extends StatelessWidget {
  final JournalEntry entry;
  final VoidCallback onTap;

  const _JournalEntryTile({required this.entry, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final date = entry.entryDate;
    final day = date.day.toString().padLeft(2, '0');
    final month = _monthAbbr(date.month);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(tokens.Radius.md),
      child: Container(
        padding: EdgeInsets.all(tokens.Spacing.md),
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: BorderRadius.circular(tokens.Radius.md),
          border: Border.all(color: colors.border, width: 0.5),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Date column
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(day, style: tokens.AppTypography.monoMedium.copyWith(color: colors.ink)),
                Text(month, style: tokens.AppTypography.caption.copyWith(color: colors.inkMuted)),
              ],
            ),
            SizedBox(width: tokens.Spacing.md),
            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (entry.title != null && entry.title!.isNotEmpty)
                    Text(entry.title!, style: tokens.AppTypography.bodyMedium.copyWith(color: colors.ink), maxLines: 1, overflow: TextOverflow.ellipsis)
                  else
                    Text(entry.content, style: tokens.AppTypography.bodySmall.copyWith(color: colors.inkMuted), maxLines: 2, overflow: TextOverflow.ellipsis),
                  if (entry.tags.isNotEmpty) ...[
                    SizedBox(height: tokens.Spacing.xs),
                    Wrap(
                      spacing: tokens.Spacing.xs,
                      runSpacing: tokens.Spacing.xs,
                      children: entry.tags.map((tag) => Chip(
                        label: Text(tag, style: tokens.AppTypography.labelSmall.copyWith(color: colors.inkMuted)),
                        backgroundColor: colors.surfaceElevated,
                        side: BorderSide(color: colors.border, width: 0.5),
                        padding: EdgeInsets.zero,
                        labelPadding: EdgeInsets.symmetric(horizontal: tokens.Spacing.sm, vertical: 0),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        visualDensity: VisualDensity.compact,
                      )).toList(),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _monthAbbr(int month) {
    const months = ['JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN', 'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC'];
    return months[month - 1];
  }
}

class _JournalEditorSheet extends ConsumerStatefulWidget {
  final JournalEntry? entry;
  final String userId;

  const _JournalEditorSheet({required this.entry, required this.userId});

  @override
  ConsumerState<_JournalEditorSheet> createState() => _JournalEditorSheetState();
}

class _JournalEditorSheetState extends ConsumerState<_JournalEditorSheet> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final _tagController = TextEditingController();
  final Set<String> _tags = {};
  bool _isSaving = false;
  bool _isDeleting = false;

  @override
  void initState() {
    super.initState();
    if (widget.entry != null) {
      _titleController.text = widget.entry!.title ?? '';
      _contentController.text = widget.entry!.content;
      _tags.addAll(widget.entry!.tags);
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    _tagController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final colors = context.colors;
    setState(() => _isSaving = true);
    try {
      final now = DateTime.now();
      final title = _titleController.text.trim();
      final content = _contentController.text.trim();
      final entry = JournalEntry(
        id: widget.entry?.id ?? '',
        userId: widget.userId,
        entryDate: widget.entry?.entryDate ?? DateTime.now(),
        title: title.isEmpty ? null : title,
        content: content,
        tags: _tags.toList(),
        createdAt: widget.entry?.createdAt ?? now,
        updatedAt: now,
      );
      final repo = ref.read(journalRepositoryProvider);
      if (widget.entry == null) {
        await repo.create(entry);
      } else {
        await repo.update(entry);
      }
      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Saved')));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to save'), backgroundColor: colors.error));
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  Future<void> _delete() async {
    final colors = context.colors;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Delete Entry', style: tokens.AppTypography.headlineSmall.copyWith(color: colors.ink)),
        content: Text('This cannot be undone.', style: tokens.AppTypography.bodyMedium.copyWith(color: colors.inkMuted)),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: Text('Cancel')),
          TextButton(onPressed: () => Navigator.pop(ctx, true), child: Text('Delete', style: TextStyle(color: colors.error))),
        ],
      ),
    );
    if (confirmed != true || widget.entry == null) return;

    setState(() => _isDeleting = true);
    try {
      await ref.read(journalRepositoryProvider).delete(widget.entry!.id);
      if (mounted) {
        Navigator.pop(context); // Close editor
        Navigator.pop(context); // Close bottom sheet if nested
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Deleted')));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to delete'), backgroundColor: colors.error));
      }
    } finally {
      if (mounted) setState(() => _isDeleting = false);
    }
  }

  void _addTag(String tag) {
    final trimmed = tag.trim();
    if (trimmed.isNotEmpty && !_tags.contains(trimmed)) {
      setState(() => _tags.add(trimmed));
      _tagController.clear();
    }
  }

  void _removeTag(String tag) => setState(() => _tags.remove(tag));

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final isNew = widget.entry == null;

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: tokens.Spacing.md,
        right: tokens.Spacing.md,
        top: tokens.Spacing.md,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title field
            TextField(
              controller: _titleController,
              style: tokens.AppTypography.bodyLarge.copyWith(color: colors.ink),
              decoration: InputDecoration(
                hintText: 'Untitled',
                hintStyle: tokens.AppTypography.bodyLarge.copyWith(color: colors.inkSubtle),
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
              maxLines: 1,
            ),
            SizedBox(height: tokens.Spacing.md),
            // Content field
            TextField(
              controller: _contentController,
              style: tokens.AppTypography.bodyMedium.copyWith(color: colors.ink),
              decoration: InputDecoration(
                hintText: 'Write your thoughts...',
                hintStyle: tokens.AppTypography.bodyMedium.copyWith(color: colors.inkSubtle),
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(tokens.Spacing.cardPadding),
                alignLabelWithHint: true,
              ),
              maxLines: null,
              keyboardType: TextInputType.multiline,
              textAlignVertical: TextAlignVertical.top,
            ),
            SizedBox(height: tokens.Spacing.md),
            // Tags
            if (_tags.isNotEmpty) ...[
              Wrap(
                spacing: tokens.Spacing.xs,
                runSpacing: tokens.Spacing.xs,
                children: _tags.map((tag) => InputChip(
                  label: Text(tag, style: tokens.AppTypography.labelSmall.copyWith(color: colors.inkMuted)),
                  onDeleted: () => _removeTag(tag),
                  deleteIcon: Icon(LucideIcons.x, size: tokens.IconSizes.xs, color: colors.inkMuted),
                  backgroundColor: colors.surfaceElevated,
                  side: BorderSide(color: colors.border, width: 0.5),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  visualDensity: VisualDensity.compact,
                )).toList(),
              ),
              SizedBox(height: tokens.Spacing.sm),
            ],
            // Add tag field
            TextField(
              controller: _tagController,
              style: tokens.AppTypography.bodyMedium.copyWith(color: colors.ink),
              decoration: InputDecoration(
                hintText: 'Add tag (press Enter)',
                hintStyle: tokens.AppTypography.bodyMedium.copyWith(color: colors.inkSubtle),
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
              onSubmitted: _addTag,
            ),
            SizedBox(height: tokens.Spacing.lg),
            // Bottom actions
            Row(
              children: [
                if (!isNew) ...[
                  IconButton(
                    icon: Icon(LucideIcons.trash2, color: colors.error, size: tokens.IconSizes.md),
                    onPressed: _isDeleting ? null : _delete,
                  ),
                  const Spacer(),
                ],
                FilledButton(
                  onPressed: (_isSaving || _isDeleting) ? null : _save,
                  style: FilledButton.styleFrom(
                    backgroundColor: colors.accent,
                    foregroundColor: colors.canvas,
                    padding: EdgeInsets.symmetric(horizontal: tokens.Spacing.lg, vertical: tokens.Spacing.sm),
                  ),
                  child: _isSaving
                      ? SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, color: colors.canvas))
                      : Text(isNew ? 'Create' : 'Save', style: tokens.AppTypography.labelLarge),
                ),
              ],
            ),
            SizedBox(height: tokens.Spacing.md),
          ],
        ),
      ),
    );
  }
}
