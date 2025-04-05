import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      visualDensity: VisualDensity.compact,

      // Culori de bază
      primaryColor: const Color(0xff36618e),
      canvasColor: const Color(0xfff8f9ff),
      scaffoldBackgroundColor: const Color(0xfff8f9ff),
      cardColor: const Color(0xfff8f9ff),
      dialogBackgroundColor: const Color(0xfff8f9ff),

      // Color Scheme
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xff36618e),
        onPrimary: Color(0xffffffff),
        primaryContainer: Color(0xffd1e4ff),
        onPrimaryContainer: Color(0xff001d36),
        secondary: Color(0xff535f70),
        onSecondary: Color(0xffffffff),
        secondaryContainer: Color(0xffd7e3f7),
        onSecondaryContainer: Color(0xff101c2b),
        tertiary: Color(0xff6b5778),
        onTertiary: Color(0xffffffff),
        tertiaryContainer: Color(0xfff2daff),
        onTertiaryContainer: Color(0xff251431),
        error: Color(0xffba1a1a),
        onError: Color(0xffffffff),
        errorContainer: Color(0xffffdad6),
        onErrorContainer: Color(0xff410002),
        surfaceContainer: Color(0xfff8f9ff),
        onSurface: Color(0xff191c20),
        surface: Color(0xfff8f9ff),
        surfaceContainerHighest: Color(0xff43474e),
        onSurfaceVariant: Color(0xff43474e),
        outline: Color(0xff73777f),
        outlineVariant: Color(0xffc3c7cf),
        shadow: Color(0xff000000),
        scrim: Color(0xff000000),
        inverseSurface: Color(0xff2e3135),
        onInverseSurface: Color(0xffeff0f7),
        inversePrimary: Color(0xffa0cafd),
        surfaceTint: Color(0xff36618e),
      ),

      // Text Theme
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontFamily: 'Segoe UI',
          fontSize: 96,
          fontWeight: FontWeight.w300,
          letterSpacing: -1.5,
          color: Color(0xff191c20),
        ),
        displayMedium: TextStyle(
          fontFamily: 'Segoe UI',
          fontSize: 60,
          fontWeight: FontWeight.w300,
          letterSpacing: -0.5,
          color: Color(0xff191c20),
        ),
        displaySmall: TextStyle(
          fontFamily: 'Segoe UI',
          fontSize: 48,
          fontWeight: FontWeight.w400,
          letterSpacing: 0,
          color: Color(0xff191c20),
        ),
        headlineLarge: TextStyle(
          fontFamily: 'Segoe UI',
          fontSize: 40,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
          color: Color(0xff191c20),
        ),
        headlineMedium: TextStyle(
          fontFamily: 'Segoe UI',
          fontSize: 34,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
          color: Color(0xff191c20),
        ),
        headlineSmall: TextStyle(
          fontFamily: 'Segoe UI',
          fontSize: 24,
          fontWeight: FontWeight.w400,
          letterSpacing: 0,
          color: Color(0xff191c20),
        ),
        titleLarge: TextStyle(
          fontFamily: 'Segoe UI',
          fontSize: 20,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
          color: Color(0xff191c20),
        ),
        titleMedium: TextStyle(
          fontFamily: 'Segoe UI',
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.15,
          color: Color(0xff191c20),
        ),
        titleSmall: TextStyle(
          fontFamily: 'Segoe UI',
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
          color: Color(0xff191c20),
        ),
        bodyLarge: TextStyle(
          fontFamily: 'Segoe UI',
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
          color: Color(0xff191c20),
        ),
        bodyMedium: TextStyle(
          fontFamily: 'Segoe UI',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
          color: Color(0xff191c20),
        ),
        bodySmall: TextStyle(
          fontFamily: 'Segoe UI',
          fontSize: 12,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
          color: Color(0xff191c20),
        ),
        labelLarge: TextStyle(
          fontFamily: 'Segoe UI',
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.25,
          color: Color(0xff191c20),
        ),
        labelMedium: TextStyle(
          fontFamily: 'Segoe UI',
          fontSize: 11,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.5,
          color: Color(0xff191c20),
        ),
        labelSmall: TextStyle(
          fontFamily: 'Segoe UI',
          fontSize: 10,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.5,
          color: Color(0xff191c20),
        ),
      ),

      // Alte proprietăți
      disabledColor: const Color(0x61000000),
      dividerColor: const Color(0x1f191c20),
      focusColor: const Color(0x1f000000),
      highlightColor: const Color(0x66bcbcbc),
      hintColor: const Color(0x99000000),
      hoverColor: const Color(0x0a000000),
      indicatorColor: const Color(0xffffffff),
      primaryColorLight: const Color(0xffbbdefb),
      primaryColorDark: const Color(0xff1976d2),
      secondaryHeaderColor: const Color(0xffe3f2fd),
      splashColor: const Color(0x66c8c8c8),
      unselectedWidgetColor: const Color(0x8a000000),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      visualDensity: VisualDensity.compact,

      // Culori de bază
      primaryColor: const Color(0xff111418),
      canvasColor: const Color(0xff111418),
      scaffoldBackgroundColor: const Color(0xff111418),
      cardColor: const Color(0xff111418),
      dialogBackgroundColor: const Color(0xff111418),

      // Color Scheme
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: Color(0xffa0cafd),
        onPrimary: Color(0xff003258),
        primaryContainer: Color(0xff194975),
        onPrimaryContainer: Color(0xffd1e4ff),
        secondary: Color(0xffbbc7db),
        onSecondary: Color(0xff253140),
        secondaryContainer: Color(0xff3b4858),
        onSecondaryContainer: Color(0xffd7e3f7),
        tertiary: Color(0xffd6bee4),
        onTertiary: Color(0xff3b2948),
        tertiaryContainer: Color(0xff523f5f),
        onTertiaryContainer: Color(0xfff2daff),
        error: Color(0xffffb4ab),
        onError: Color(0xff690005),
        errorContainer: Color(0xff93000a),
        onErrorContainer: Color(0xffffdad6),
        surfaceContainer: Color(0xff111418),
        onSurface: Color(0xffe1e2e8),
        surface: Color(0xff111418),
        surfaceContainerHighest: Color(0xff43474e),
        onSurfaceVariant: Color(0xffc3c7cf),
        outline: Color(0xff8d9199),
        outlineVariant: Color(0xff43474e),
        shadow: Color(0xff000000),
        scrim: Color(0xff000000),
        inverseSurface: Color(0xffe1e2e8),
        onInverseSurface: Color(0xff2e3135),
        inversePrimary: Color(0xff36618e),
        surfaceTint: Color(0xffa0cafd),
      ),

      // Text Theme
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontFamily: 'Segoe UI',
          fontSize: 96,
          fontWeight: FontWeight.w300,
          letterSpacing: -1.5,
          color: Color(0xffe1e2e8),
        ),
        displayMedium: TextStyle(
          fontFamily: 'Segoe UI',
          fontSize: 60,
          fontWeight: FontWeight.w300,
          letterSpacing: -0.5,
          color: Color(0xffe1e2e8),
        ),
        displaySmall: TextStyle(
          fontFamily: 'Segoe UI',
          fontSize: 48,
          fontWeight: FontWeight.w400,
          letterSpacing: 0,
          color: Color(0xffe1e2e8),
        ),
        headlineLarge: TextStyle(
          fontFamily: 'Segoe UI',
          fontSize: 40,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
          color: Color(0xffe1e2e8),
        ),
        headlineMedium: TextStyle(
          fontFamily: 'Segoe UI',
          fontSize: 34,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
          color: Color(0xffe1e2e8),
        ),
        headlineSmall: TextStyle(
          fontFamily: 'Segoe UI',
          fontSize: 24,
          fontWeight: FontWeight.w400,
          letterSpacing: 0,
          color: Color(0xffe1e2e8),
        ),
        titleLarge: TextStyle(
          fontFamily: 'Segoe UI',
          fontSize: 20,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
          color: Color(0xffe1e2e8),
        ),
        titleMedium: TextStyle(
          fontFamily: 'Segoe UI',
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.15,
          color: Color(0xffe1e2e8),
        ),
        titleSmall: TextStyle(
          fontFamily: 'Segoe UI',
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
          color: Color(0xffe1e2e8),
        ),
        bodyLarge: TextStyle(
          fontFamily: 'Segoe UI',
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
          color: Color(0xffe1e2e8),
        ),
        bodyMedium: TextStyle(
          fontFamily: 'Segoe UI',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
          color: Color(0xffe1e2e8),
        ),
        bodySmall: TextStyle(
          fontFamily: 'Segoe UI',
          fontSize: 12,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
          color: Color(0xffe1e2e8),
        ),
        labelLarge: TextStyle(
          fontFamily: 'Segoe UI',
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.25,
          color: Color(0xffe1e2e8),
        ),
        labelMedium: TextStyle(
          fontFamily: 'Segoe UI',
          fontSize: 11,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.5,
          color: Color(0xffe1e2e8),
        ),
        labelSmall: TextStyle(
          fontFamily: 'Segoe UI',
          fontSize: 10,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.5,
          color: Color(0xffe1e2e8),
        ),
      ),

      // Alte proprietăți
      disabledColor: const Color(0x62ffffff),
      dividerColor: const Color(0x1fe1e2e8),
      focusColor: const Color(0x1fffffff),
      highlightColor: const Color(0x40cccccc),
      hintColor: const Color(0x99ffffff),
      hoverColor: const Color(0x0affffff),
      indicatorColor: const Color(0xffe1e2e8),
      secondaryHeaderColor: const Color(0xff616161),
      splashColor: const Color(0x40cccccc),
      unselectedWidgetColor: const Color(0xb3ffffff),
    );
  }
}
