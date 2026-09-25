// GRAFT App Theme
// Defines the app's visual theme with Zimbabwe-inspired colors
// Uses Young Serif for brand typography and supports low-bandwidth devices

import 'package:flutter/material.dart';
import '../design_tokens/design_tokens.dart';

class AppTheme {
  // GRAFT brand colors (Zimbabwean flag inspired)
  static const Color primary = GraftColors.primary;
  static const Color primaryGreen = GraftColors.primaryGreen;
  static const Color zimbabweRed = GraftColors.zimbabweRed;
  static const Color zimbabweYellow = GraftColors.zimbabweYellow;

  /// Creates a light theme for GRAFT
  static ThemeData lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: GraftColors.primary,
      onPrimary: GraftColors.white,
      secondary: GraftColors.secondary,
      onSecondary: GraftColors.black,
      surface: GraftColors.surface,
      onSurface: GraftColors.textPrimary,
      surfaceContainer: Color(0xFFEEEEEE),
      surfaceContainerHigh: Color(0xFFE0E0E0),
      surfaceContainerHighest: GraftColors.surfaceVariant,
      onSurfaceVariant: GraftColors.textSecondary,
      error: GraftColors.error,
      onError: GraftColors.white,
    ),
    useMaterial3: true,
    fontFamily: GraftTypography.brandFont,
    scaffoldBackgroundColor: GraftColors.background,
    appBarTheme: const AppBarTheme(
      backgroundColor: GraftColors.primary,
      foregroundColor: GraftColors.white,
      elevation: 0,
      centerTitle: true,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: GraftColors.primary,
        foregroundColor: GraftColors.white,
        textStyle: const TextStyle(
          fontFamily: GraftTypography.systemFontFallback,
          fontWeight: FontWeight.w600,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(GraftBorderRadius.md),
        ),
        minimumSize: const Size.fromHeight(GraftTouchTarget.buttonHeight),
        elevation: GraftElevation.level1,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: GraftColors.primary,
        textStyle: const TextStyle(
          fontFamily: GraftTypography.systemFontFallback,
          fontWeight: FontWeight.w500,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(GraftBorderRadius.md),
        ),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(GraftBorderRadius.md)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(GraftBorderRadius.md)),
        borderSide: BorderSide(color: Color(0xFFE0E0E0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(GraftBorderRadius.md)),
        borderSide: BorderSide(color: GraftColors.primary, width: 2),
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: GraftSpacing.lg,
        vertical: GraftSpacing.md,
      ),
    ),
    iconTheme: GraftIcon.medium,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: GraftColors.primary,
      unselectedItemColor: GraftColors.textSecondary,
      elevation: GraftElevation.level1,
    ),
  );

  /// Creates a dark theme for GRAFT
  static ThemeData darkTheme = ThemeData(
    colorScheme: const ColorScheme.dark(
      primary: GraftColors.primary,
      onPrimary: GraftColors.white,
      secondary: GraftColors.secondary,
      onSecondary: GraftColors.black,
      surface: Color(0xFF424242),
      onSurface: GraftColors.white,
      surfaceContainerHighest: Color(0xFF383838),
      onSurfaceVariant: Color(0xFFB0B0B0),
      error: GraftColors.error,
      onError: GraftColors.white,
    ),
    useMaterial3: true,
    fontFamily: GraftTypography.brandFont,
    scaffoldBackgroundColor: const Color(0xFF181A1C),
    appBarTheme: const AppBarTheme(
      backgroundColor: GraftColors.primary,
      foregroundColor: GraftColors.white,
      elevation: 0,
      centerTitle: true,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: GraftColors.primary,
        foregroundColor: GraftColors.white,
        textStyle: const TextStyle(
          fontFamily: GraftTypography.systemFontFallback,
          fontWeight: FontWeight.w600,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(GraftBorderRadius.md),
        ),
        minimumSize: const Size.fromHeight(GraftTouchTarget.buttonHeight),
        elevation: GraftElevation.level1,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(GraftBorderRadius.md)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(GraftBorderRadius.md)),
        borderSide: BorderSide(color: Color(0xFF505050)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(GraftBorderRadius.md)),
        borderSide: BorderSide(color: GraftColors.primary, width: 2),
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: GraftSpacing.lg,
        vertical: GraftSpacing.md,
      ),
    ),
    iconTheme: const IconThemeData(
      size: GraftIcon.md,
      color: GraftColors.white,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: GraftColors.primary,
      unselectedItemColor: Color(0xFFB0B0B0),
      elevation: GraftElevation.level1,
      backgroundColor: Color(0xFF181A1C),
    ),
  );
}