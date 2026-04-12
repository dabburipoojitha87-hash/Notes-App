import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Common theme values
  static const Color backgroundColor = Color(0xFFF5F5F0);
  static const Color foregroundColor = Color(0xFF1E1E1E);
  static const double borderWidth = 3.0;

  static ThemeData get pixelTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: backgroundColor,
      colorScheme: const ColorScheme.light(
        surface: backgroundColor,
        onSurface: foregroundColor,
        primary: foregroundColor,
        secondary: Color(0xFFC8F7C5), // Default note color
      ),
      
      // Text Theme
      textTheme: TextTheme(
        // Headings use Silkscreen for pixel look
        displayLarge: GoogleFonts.silkscreen(color: foregroundColor, fontWeight: FontWeight.bold),
        displayMedium: GoogleFonts.silkscreen(color: foregroundColor, fontWeight: FontWeight.bold),
        displaySmall: GoogleFonts.silkscreen(color: foregroundColor, fontWeight: FontWeight.bold),
        headlineLarge: GoogleFonts.silkscreen(color: foregroundColor, fontWeight: FontWeight.bold),
        headlineMedium: GoogleFonts.silkscreen(color: foregroundColor, fontWeight: FontWeight.bold),
        headlineSmall: GoogleFonts.silkscreen(color: foregroundColor, fontWeight: FontWeight.bold),
        titleLarge: GoogleFonts.silkscreen(color: foregroundColor, fontWeight: FontWeight.bold),
        titleMedium: GoogleFonts.silkscreen(color: foregroundColor, fontWeight: FontWeight.bold),
        titleSmall: GoogleFonts.silkscreen(color: foregroundColor, fontWeight: FontWeight.bold),
        labelLarge: GoogleFonts.silkscreen(color: foregroundColor, fontWeight: FontWeight.bold),
        
        // Body text uses monospace for readability while keeping the retro vibe
        bodyLarge: const TextStyle(fontFamily: 'Courier', color: foregroundColor, fontSize: 16),
        bodyMedium: const TextStyle(fontFamily: 'Courier', color: foregroundColor, fontSize: 14),
        bodySmall: const TextStyle(fontFamily: 'Courier', color: foregroundColor, fontSize: 12),
      ),

      // App Bar Theme
      appBarTheme: AppBarTheme(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.silkscreen(
          color: foregroundColor,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: const IconThemeData(color: foregroundColor, size: 28),
      ),

      // Floating Action Button
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xFFC8F7C5),
        foregroundColor: foregroundColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: foregroundColor, width: borderWidth),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),

      // Input Decoration (Text Fields)
      inputDecorationTheme: const InputDecorationTheme(
        contentPadding: EdgeInsets.all(16),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: foregroundColor, width: borderWidth),
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: foregroundColor, width: borderWidth),
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: foregroundColor, width: borderWidth + 1),
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
      ),

      // Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: foregroundColor,
          backgroundColor: Colors.white,
          elevation: 0,
          shape: const RoundedRectangleBorder(
            side: BorderSide(color: foregroundColor, width: borderWidth),
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          textStyle: GoogleFonts.silkscreen(fontWeight: FontWeight.bold),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        ),
      ),
      
      // Dialog properties
      dialogTheme: const DialogThemeData(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: foregroundColor, width: borderWidth),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    );
  }
}
