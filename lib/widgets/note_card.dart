import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../data/models/note.dart';
import '../core/constants/note_colors.dart';
import '../core/theme/app_theme.dart';

class NoteCard extends StatelessWidget {
  final Note note;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  const NoteCard({
    super.key,
    required this.note,
    required this.onTap,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: NoteColors.getColor(note.colorIndex),
          border: Border.all(
            color: AppTheme.foregroundColor,
            width: AppTheme.borderWidth,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (note.title.isNotEmpty)
              Text(
                note.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            if (note.title.isNotEmpty) const SizedBox(height: 8),
            Expanded(
              child: Text(
                note.content,
                style: const TextStyle(fontSize: 14),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              DateFormat('MMM d, yyyy').format(note.createdAt),
              style: TextStyle(
                fontSize: 10,
                color: AppTheme.foregroundColor.withValues(alpha: 0.8),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
