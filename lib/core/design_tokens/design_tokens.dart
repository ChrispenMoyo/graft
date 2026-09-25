// GRAFT Design Tokens
// Centralized design system for consistent styling across the application

import 'package:flutter/material.dart';

/// ============================================================
/// COLOR TOKENS
/// ============================================================

/// GRAFT Brand Colors
class GraftColors {
  // Primary Brand Colors
  static const Color primaryGreen = Color(0xFF319400); // Zimbabwe flag green
  static const Color zimbabweRed = Color(0xFFD40000);  // Zimbabwe flag red
  static const Color zimbabweYellow = Color(0xFFFFD200); // Zimbabwe flag yellow
  static const Color black = Color(0xFF000000);        // Zimbabwe flag black
  static const Color white = Color(0xFFFFFFFF);          // Pure white

  // Brand color variants
  static const Color primary = primaryGreen;
  static const Color primaryDark = Color(0xFF2E7D32);
  static const Color primaryLight = Color(0xFF4CAF50);

  // Accent colors
  static const Color secondary = zimbabweYellow; // Used for highlights/CTA
  static const Color accent = zimbabweRed;       // Used for warnings/danger

  // Neutral colors
  static const Color background = Color(0xFFF5F5F5);
  static const Color surface = white;
  static const Color surfaceVariant = Color(0xFFEEEEEE);
  static const Color surfaceDark = Color(0xFF424242);

  // Text colors
  static const Color textPrimary = black;
  static const Color textSecondary = Color(0xFF757575);
  static const Color textMuted = Color(0xFF9E9E9E);
  static const Color textOnSurface = Color(0xFF212121);

  // Status colors
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = zimbabweYellow;
  static const Color error = zimbabweRed;
  static const Color info = Color(0xFF2196F3);

  // Material 3 onSurface colors
  static const Color onSurface = white;
  static const Color onSurfaceVariant = Color(0xFF757575);
}

/// ============================================================
/// TYPOGRAPHY TOKENS
/// ============================================================

class GraftTypography {
  // Font families - Young Serif is primary brand font
  static const String brandFont = 'YoungSerif';
  static const String systemFontFallback = 'Poppins, Roboto, sans-serif';

  // Display/Brand Headings (Young Serif)
  static const TextStyle displayLarge = TextStyle(
    fontFamily: brandFont,
    fontWeight: FontWeight.w700,
    fontSize: 36,
    height: 1.0,
  );

  static const TextStyle displayMedium = TextStyle(
    fontFamily: brandFont,
    fontWeight: FontWeight.w700,
    fontSize: 28,
    height: 1.0,
  );

  static const TextStyle displaySmall = TextStyle(
    fontFamily: brandFont,
    fontWeight: FontWeight.w700,
    fontSize: 24,
    height: 1.0,
  );

  // Headings
  static const TextStyle headlineLarge = TextStyle(
    fontFamily: brandFont,
    fontWeight: FontWeight.w700,
    fontSize: 24,
    height: 1.0,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontFamily: brandFont,
    fontWeight: FontWeight.w600,
    fontSize: 20,
    height: 1.0,
  );

  static const TextStyle headlineSmall = TextStyle(
    fontFamily: brandFont,
    fontWeight: FontWeight.w600,
    fontSize: 18,
    height: 1.0,
  );

  // Body text (system font for readability)
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: systemFontFallback,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: systemFontFallback,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: systemFontFallback,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  // Labels/Captions
  static const TextStyle labelLarge = TextStyle(
    fontFamily: systemFontFallback,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.4,
  );

  static const TextStyle labelMedium = TextStyle(
    fontFamily: systemFontFallback,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.4,
  );

  static const TextStyle labelSmall = TextStyle(
    fontFamily: systemFontFallback,
    fontSize: 10,
    fontWeight: FontWeight.w400,
    height: 1.4,
  );
}

/// ============================================================
/// SPACING TOKENS
/// ============================================================

class GraftSpacing {
  // Standard spacing scale
  static const double xs = 4;   // Extra small
  static const double sm = 8;   // Small
  static const double md = 12;  // Medium
  static const double lg = 16;  // Large
  static const double xl = 20;  // Extra large
  static const double xxl = 24; // Double extra large
  static const double xxxl = 32; // Triple extra large
  static const double xxxxl = 40; // Four times extra large
  static const double xxxxlNeg = 48; // Negative space

  // Padding shortcuts
  static const EdgeInsets allXs = EdgeInsets.all(xs);
  static const EdgeInsets allSm = EdgeInsets.all(sm);
  static const EdgeInsets allMd = EdgeInsets.all(md);
  static const EdgeInsets allLg = EdgeInsets.all(lg);
  static const EdgeInsets allXl = EdgeInsets.all(xl);

  // Horizontal/vertical padding
  static const EdgeInsets horizontalMd = EdgeInsets.symmetric(horizontal: md);
  static const EdgeInsets horizontalLg = EdgeInsets.symmetric(horizontal: lg);
  static const EdgeInsets verticalMd = EdgeInsets.symmetric(vertical: md);
  static const EdgeInsets verticalLg = EdgeInsets.symmetric(vertical: lg);
}

/// ============================================================
/// BORDER RADIUS TOKENS
/// ============================================================

class GraftBorderRadius {
  // Consistent radius values
  static const double xs = 2;   // Small radius for compact elements
  static const double sm = 4;   // Medium-small for chips/tags
  static const double md = 8;   // Medium for inputs/cards
  static const double lg = 12;  // Large for modals
  static const double xl = 16;  // Extra large for hero sections
  static const double circle = 50; // Circular elements

  // RoundedRectangleBorder shortcuts
  static final smRounded = BorderRadius.circular(sm);
  static final mdRounded = BorderRadius.circular(md);
  static final lgRounded = BorderRadius.circular(lg);
  static final xlRounded = BorderRadius.circular(xl);

  // BorderSide shortcuts
  static const double defaultRadius = 8;
}

/// ============================================================
/// ELEVATION / SHADOW TOKENS
/// ============================================================

class GraftElevation {
  // Subtle elevation system
  static const double level0 = 0;    // No elevation
  static const double level1 = 1;    // Low elevation (inputs, cards)
  static const double level2 = 2;    // Medium elevation (modals)
  static const double level3 = 4;    // High elevation (dialogs)

  // BoxShadow presets
  static final List<BoxShadow> elevation0 = [];
  static final List<BoxShadow> elevation1 = [
    BoxShadow(
      color: Color(0x1A000000),
      blurRadius: 2,
      offset: Offset(0, 1),
    ),
  ];
  static final List<BoxShadow> elevation2 = [
    BoxShadow(
      color: Color(0x1A000000),
      blurRadius: 4,
      offset: Offset(0, 2),
    ),
  ];
  static final List<BoxShadow> elevation3 = [
    BoxShadow(
      color: Color(0x1A000000),
      blurRadius: 6,
      offset: Offset(0, 3),
    ),
  ];
}

/// ============================================================
/// ICON TOKENS
/// ============================================================

class GraftIcon {
  // Icon sizes
  static const double xs = 16;
  static const double sm = 18;
  static const double md = 24;
  static const double lg = 28;
  static const double xl = 32;
  static const double xxl = 40;

  // Default icon theme
  static const IconThemeData small = IconThemeData(
    size: sm,
    color: GraftColors.textPrimary,
  );

  static const IconThemeData medium = IconThemeData(
    size: md,
    color: GraftColors.textPrimary,
  );

  static const IconThemeData large = IconThemeData(
    size: lg,
    color: GraftColors.textPrimary,
  );
}

/// ============================================================
/// TOUCH TARGET TOKENS
/// ============================================================

class GraftTouchTarget {
  // Minimum touch target sizes for accessibility
  static const double minimum = 48; // Recommended minimum
  static const double minimumLarge = 56; // For important actions

  // Button heights
  static const double buttonHeight = 48;
  static const double buttonHeightLarge = 56;

  // Input heights
  static const double inputHeight = 56;
  static const double inputHeightSmall = 48;
}

/// ============================================================
/// ANIMATION TOKENS
/// ============================================================

class GraftAnimation {
  // Duration values for consistent animations
  static const Duration fast = Duration(milliseconds: 150);
  static const Duration normal = Duration(milliseconds: 300);
  static const Duration slow = Duration(milliseconds: 500);

  // Curve values
  static const Curve standard = Curves.easeInOut;
  static const Curve decelerate = Curves.decelerate;
  static const Curve bounceOut = Curves.bounceOut;
}

/// ============================================================
/// GITHUB BRAND COLORS FOR REFERENCE
/// ============================================================

/// Legacy colors - kept for reference during migration
@Deprecated('Use GraftColors instead')
class LegacyColors {
  static const Color primary = Color(0xFF2E7D32);
  static const Color secondary = Color(0xFFF57C00);
  static const Color background = Color(0xFFF5F5F5);
  static const Color surface = Color(0xFFFFFFFF);
}