import 'package:flutter/material.dart';

class NoteColors {
  static const List<Color> palette = [
    Color(0xFFC8F7C5), // Mint Green
    Color(0xFFFFDAB9), // Peach
    Color(0xFFE6E6FA), // Lavender
    Color(0xFFFFFACD), // Lemon/Butter
    Color(0xFFFFD1DC), // Baby Pink
    Color(0xFFB0E0E6), // Powder Blue
    Color(0xFFFFE4E1), // Misty Rose
    Color(0xFFF5DEB3), // Wheat
  ];

  static Color getColor(int index) {
    if (index < 0 || index >= palette.length) {
      return palette[0];
    }
    return palette[index];
  }
}
