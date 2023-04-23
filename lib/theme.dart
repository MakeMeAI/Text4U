import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

extension MyThemeExtension on ThemeData {
  Gradient get gradientBackground =>
      throw UnimplementedError('gradientBackground not implemented');
}

class AppTheme {

  AppTheme._();

  static ThemeData get lightThemeData {
    final Gradient gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Colors.purple,
        Colors.blue,
      ],
    );

    return ThemeData(
        primaryColor: Colors.purple.shade500,
        primarySwatch: Colors.deepPurple,

        canvasColor: Colors.transparent,
        brightness: Brightness.light,
        textTheme: TextTheme(
          displaySmall: GoogleFonts.lato(
            color: Colors.white,
            fontSize: 15,
          ),
          displayMedium: GoogleFonts.montserrat(
            color: Colors.white.withOpacity(0.8),
            fontSize: 10,
          ),
          bodyMedium: GoogleFonts.montserrat(
            color: Colors.white.withOpacity(0.8),
            fontSize: 20,
          ),
          displayLarge: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.deepPurpleAccent,
        textTheme: ButtonTextTheme.primary,
      )
    ).copyWith(
      gradientBackground: gradient,
    );
  }

    static ThemeData get darkThemeData {

      final Gradient gradient = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFF3D1062),
          Colors.purple.shade900,
        ],
      );

      return ThemeData(
        primarySwatch: Colors.deepPurple,
        primaryColor: Colors.blueAccent,
        canvasColor: Colors.transparent,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple)
            .copyWith(background: Colors.black38),
        textTheme: TextTheme(
          displaySmall: GoogleFonts.lato(
            color: Colors.white,
            fontSize: 15,
          ),
          displayMedium: GoogleFonts.montserrat(
            color: Colors.white.withOpacity(0.8),
            fontSize: 20,
          ),
          displayLarge: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        buttonTheme: ButtonThemeData(
        buttonColor: Colors.deepPurple,
        textTheme: ButtonTextTheme.primary,
      ),
      //gradientBackground: gradient,

    );
  }
}
