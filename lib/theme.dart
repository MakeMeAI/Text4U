import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme{

  static ThemeData lightTheme = ThemeData(
    primaryColor: Colors.purple.shade500,
    primarySwatch: Colors.deepPurple,
      // TODO: build this gradient into the theme
      // decoration: BoxDecoration(
      //     border: Border.all( width: 1, color: Colors.transparent),
      //     borderRadius: const BorderRadius.all(const Radius.circular(40)),
      //     gradient: LinearGradient(
      //       begin: Alignment.topLeft,
      //       end: Alignment.bottomRight,
      //       colors: [
      //         Colors.purple.shade500,
      //         Colors.deepPurpleAccent.shade100,
      //       ],
      //     )
      // ),
    canvasColor: Colors.transparent,
    brightness: Brightness.light,
    textTheme: TextTheme(
      displaySmall: GoogleFonts.lato(
        color: Colors.white,
        fontSize: 15,
      ),
      displayMedium: GoogleFonts.montserrat(
        color: Colors.white,
        fontSize: 20,
      ),
      displayLarge: GoogleFonts.montserrat(
        color: Colors.white,
        fontSize: 40,
        fontWeight: FontWeight.bold,
      ),

    )
  );
  static ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.deepPurple,
    canvasColor: Colors.transparent,
    brightness: Brightness.dark,
  );
}
