import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Custom theme extension for SwiftChat's Neubrutalist design system.
/// Contains tokens for physical elements like borders and shadows.
class SwiftThemeExtension extends ThemeExtension<SwiftThemeExtension> {
  final double borderWidth;
  final Offset shadowOffset;
  final double cardRadius;
  final double buttonRadius;
  final Color shadowColor;

  SwiftThemeExtension({
    this.borderWidth = 3.0,
    this.shadowOffset = const Offset(4.0, 4.0),
    this.cardRadius = 24.0,
    this.buttonRadius = 20.0,
    this.shadowColor = Colors.black,
  });

  @override
  SwiftThemeExtension copyWith({
    double? borderWidth,
    Offset? shadowOffset,
    double? cardRadius,
    double? buttonRadius,
    Color? shadowColor,
  }) {
    return SwiftThemeExtension(
      borderWidth: borderWidth ?? this.borderWidth,
      shadowOffset: shadowOffset ?? this.shadowOffset,
      cardRadius: cardRadius ?? this.cardRadius,
      buttonRadius: buttonRadius ?? this.buttonRadius,
      shadowColor: shadowColor ?? this.shadowColor,
    );
  }

  @override
  SwiftThemeExtension lerp(
      ThemeExtension<SwiftThemeExtension>? other, double t) {
    if (other is! SwiftThemeExtension) return this;
    return SwiftThemeExtension(
      borderWidth: lerpDouble(borderWidth, other.borderWidth, t) ?? 3.0,
      shadowOffset: Offset.lerp(shadowOffset, other.shadowOffset, t)!,
      cardRadius: lerpDouble(cardRadius, other.cardRadius, t) ?? 24.0,
      buttonRadius: lerpDouble(buttonRadius, other.buttonRadius, t) ?? 20.0,
      shadowColor: Color.lerp(shadowColor, other.shadowColor, t)!,
    );
  }

  static double? lerpDouble(num? a, num? b, double t) {
    if (a == null && b == null) return null;
    a ??= 0.0;
    b ??= 0.0;
    return a + (b - a) * t;
  }
}

class SwiftTheme {
  // Brand Colors
  static const Color vividEmerald = Color(0xFF00D26A);
  static const Color electricIndigo = Color(0xFF5856D6);
  static const Color pureBlack = Color(0xFF0B0E14);
  static const Color pureWhite = Color(0xFFFFFFFF);
  static const Color errorRed = Color(0xFFFF3B30);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: vividEmerald,
        primary: vividEmerald,
        onPrimary: Colors.white,
        surface: const Color(0xFFF5F5F5),
      ),
      textTheme: GoogleFonts.interTextTheme().copyWith(
        displayLarge: GoogleFonts.oswald(fontWeight: FontWeight.bold),
        displayMedium: GoogleFonts.oswald(fontWeight: FontWeight.bold),
        displaySmall: GoogleFonts.oswald(fontWeight: FontWeight.bold),
        headlineLarge: GoogleFonts.oswald(fontWeight: FontWeight.bold),
        titleLarge: GoogleFonts.inter(fontWeight: FontWeight.w900),
        bodyLarge: GoogleFonts.inter(fontWeight: FontWeight.w600),
      ),
      extensions: [
        SwiftThemeExtension(
          shadowColor: Colors.black,
        ),
      ],
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: vividEmerald,
        primary: vividEmerald,
        onPrimary: pureBlack,
        surface: const Color(0xFF1C1F26),
        brightness: Brightness.dark,
      ),
      textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme).copyWith(
        displayLarge: GoogleFonts.oswald(fontWeight: FontWeight.bold),
        displayMedium: GoogleFonts.oswald(fontWeight: FontWeight.bold),
        displaySmall: GoogleFonts.oswald(fontWeight: FontWeight.bold),
        headlineLarge: GoogleFonts.oswald(fontWeight: FontWeight.bold),
        titleLarge: GoogleFonts.inter(fontWeight: FontWeight.w900),
        bodyLarge: GoogleFonts.inter(fontWeight: FontWeight.w600),
      ),
      extensions: [
        SwiftThemeExtension(
          shadowColor: Colors.white.withOpacity(0.1), // Subtle for neubrutalist dark
        ),
      ],
    );
  }
}
