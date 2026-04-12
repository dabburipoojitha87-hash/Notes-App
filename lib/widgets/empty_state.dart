import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';

class EmptyState extends StatelessWidget {
  final bool isSearch;

  const EmptyState({super.key, this.isSearch = false});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: AppTheme.foregroundColor,
                  width: AppTheme.borderWidth,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(
                Icons.edit_document,
                size: 64,
                color: AppTheme.foregroundColor,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              isSearch
                  ? 'No notes found.\nDid you hallucinate them?'
                  : 'No notes yet.\nStart pretending to be productive.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
