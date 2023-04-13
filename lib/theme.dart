import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.purple,
    canvasColor: Colors.transparent,
    // Font Size
    textTheme: Theme.of(context).textTheme.apply(
      //headline2: GoogleFonts.lexend()
      //text: GoogleFonts.lexend(),
      //fontFamilyFallback: GoogleFonts.lexend(),
      fontSizeFactor: 1.0,
      // fontSizeFactor: 1.5,
      fontSizeDelta: 10.0,
    ),
    //Font type
    // textTheme: TextTheme(
    //   bodyLarge: GoogleFonts.lexend(),
    // ),
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
  );
}

