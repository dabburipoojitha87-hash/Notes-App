import 'package:flutter/material.dart';
import '../core/constants/note_colors.dart';
import '../core/theme/app_theme.dart';

class ColorPicker extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onColorSelected;

  const ColorPicker({
    super.key,
    required this.selectedIndex,
    required this.onColorSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: NoteColors.palette.length,
        itemBuilder: (context, index) {
          final isSelected = index == selectedIndex;
          
          return GestureDetector(
            onTap: () => onColorSelected(index),
            child: Container(
              width: 44,
              height: 44,
              margin: const EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                color: NoteColors.getColor(index),
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppTheme.foregroundColor,
                  width: isSelected ? 4.0 : 2.0,
                ),
              ),
              child: isSelected
                  ? const Icon(
                      Icons.check,
                      color: AppTheme.foregroundColor,
                      size: 20,
                    )
                  : null,
            ),
          );
        },
      ),
    );
  }
}
