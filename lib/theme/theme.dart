import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorPack {
  final Color primary;
  final Color secondary;
  final Color background;
  final Color titleColor;
  final Color tileColor;

  const ColorPack({
    required this.primary,
    required this.secondary,
    required this.background,
    required this.titleColor,
    required this.tileColor,
  });
}

const ColorPack lightColor = ColorPack(
  primary: Colors.blueAccent,
  secondary: Colors.black87,
  background: Colors.white,
  titleColor: Colors.cyanAccent,
  tileColor: Colors.indigo,
);

const ColorPack darkColor = ColorPack(
  primary: Colors.cyan,
  secondary: Colors.white,
  background: Colors.deepPurple,
  titleColor: Colors.blue,
  tileColor: Colors.purple,
);

ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: lightColor.primary),
  appBarTheme: AppBarTheme(
    backgroundColor: lightColor.secondary,
    titleTextStyle: GoogleFonts.robotoMono(
      color: lightColor.titleColor,
      fontWeight: FontWeight.bold,
      letterSpacing: 2.0,
    ),
    toolbarHeight: 70,
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStatePropertyAll(
        EdgeInsets.all(10.0),
      ),
    ),
  ),
  textTheme: TextTheme(
    titleLarge: GoogleFonts.poppins(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      decorationThickness: 35,
      color: darkColor.primary,
    ),
  ),
  expansionTileTheme: ExpansionTileThemeData(
    backgroundColor: lightColor.background,
    textColor: lightColor.secondary,
    collapsedBackgroundColor: lightColor.tileColor,
    collapsedTextColor: lightColor.titleColor,
    shape: RoundedRectangleBorder(
        side: BorderSide(
          color: lightColor.titleColor,
          width: 2.0,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(10)),
  ),
  listTileTheme: ListTileThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    contentPadding: const EdgeInsets.all(10.0),
    tileColor: lightColor.background,
    titleTextStyle: GoogleFonts.robotoMono(
      color: lightColor.secondary,
      fontWeight: FontWeight.w600,
      fontSize: 18,
      wordSpacing: 3.0,
      letterSpacing: 2.0,
    ),
    subtitleTextStyle: GoogleFonts.robotoMono(
      color: lightColor.secondary,
      fontWeight: FontWeight.normal,
      fontSize: 14,
    ),
  ),
  cardTheme: CardTheme(
    color: lightColor.background,
    surfaceTintColor: lightColor.background,
    shadowColor: lightColor.secondary,
    elevation: 6.0,
  ),
  scaffoldBackgroundColor: lightColor.background,
);

ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: lightColor.primary),
  appBarTheme: AppBarTheme(
    backgroundColor: darkColor.secondary,
    titleTextStyle: GoogleFonts.robotoMono(
      color: darkColor.titleColor,
      fontWeight: FontWeight.bold,
      decorationThickness: 15,
      letterSpacing: 5.0,
    ),
    toolbarHeight: 70,
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStatePropertyAll(
        GoogleFonts.robotoMono(
          color: lightColor.titleColor,
          fontWeight: FontWeight.w700,
          letterSpacing: 2.0,
        ),
      ),
      padding: MaterialStatePropertyAll(
        EdgeInsets.all(10.0),
      ),
      enableFeedback: true,
    ),
  ),
  textTheme: TextTheme(
    titleLarge: GoogleFonts.poppins(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      decorationThickness: 35,
      color: darkColor.primary,
    ),
  ),
  scaffoldBackgroundColor: darkColor.background,
);
