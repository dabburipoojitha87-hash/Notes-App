import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'screens/home_screen.dart';

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minimal Notes',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.pixelTheme,
      home: const HomeScreen(),
    );
  }
}
