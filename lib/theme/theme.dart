import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

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

Color errorColor = HexColor("#7B0828");

ColorPack lightColor = ColorPack(
  primary: HexColor("#1C2826"),
  secondary: HexColor("#6D3B47"),
  background: HexColor("#EBEBEB"),
  titleColor: HexColor("#52050A"),
  tileColor: HexColor("#ADA8BE"),
);
ColorScheme lightColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: lightColor.primary,
  onPrimary: lightColor.primary.withOpacity(0.8),
  secondary: lightColor.secondary,
  onSecondary: lightColor.secondary.withOpacity(0.8),
  error: errorColor,
  onError: errorColor.withOpacity(0.8),
  background: lightColor.background,
  onBackground: lightColor.background.withOpacity(0.8),
  surface: lightColor.tileColor,
  onSurface: lightColor.tileColor.withOpacity(0.8),
);

ColorPack darkColor = ColorPack(
  primary: HexColor("#FFFAFF"),
  secondary: HexColor("#FEFCFD"),
  background: HexColor("#04080F"),
  titleColor: HexColor("#7B0828"),
  tileColor: HexColor("#EBEBEB"),
);
ColorScheme darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: darkColor.primary,
  onPrimary: darkColor.primary.withOpacity(0.8),
  secondary: darkColor.secondary,
  onSecondary: darkColor.secondary.withOpacity(0.8),
  error: errorColor,
  onError: errorColor.withOpacity(0.8),
  background: darkColor.background,
  onBackground: darkColor.background.withOpacity(0.8),
  surface: darkColor.tileColor,
  onSurface: darkColor.tileColor.withOpacity(0.8),
);

ThemeData lightTheme = ThemeData(
  colorScheme: lightColorScheme,
  appBarTheme: AppBarTheme(
    backgroundColor: lightColor.secondary,
    titleTextStyle: GoogleFonts.robotoMono(
      color: lightColor.titleColor,
      fontWeight: FontWeight.bold,
      letterSpacing: 2.0,
    ),
    toolbarHeight: 70,
  ),
  textButtonTheme: const TextButtonThemeData(
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
  colorScheme: darkColorScheme,
  appBarTheme: AppBarTheme(
    backgroundColor: darkColor.primary,
    titleTextStyle: GoogleFonts.robotoMono(
      color: darkColor.titleColor,
      fontWeight: FontWeight.bold,
      decorationThickness: 20,
      letterSpacing: 8.0,
    ),
    toolbarHeight: 70,
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(darkColor.primary),
      foregroundColor: MaterialStatePropertyAll(darkColor.titleColor),
      side: MaterialStatePropertyAll(
          BorderSide(color: darkColor.background, width: 2)),
      textStyle: MaterialStatePropertyAll(
        GoogleFonts.robotoMono(
          color: darkColor.tileColor,
          fontWeight: FontWeight.w700,
          letterSpacing: 2.0,
        ),
      ),
      padding: const MaterialStatePropertyAll(
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
      color: darkColor.secondary,
    ),
  ),
  expansionTileTheme: ExpansionTileThemeData(
    backgroundColor: darkColor.background,
    textColor: darkColor.secondary,
    collapsedBackgroundColor: darkColor.background,
    collapsedTextColor: darkColor.tileColor,
    shape: RoundedRectangleBorder(
        side: BorderSide(
          color: darkColor.titleColor,
          width: 2.0,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(0)),
  ),
  listTileTheme: ListTileThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    contentPadding: const EdgeInsets.all(10.0),
    tileColor: darkColor.background,
    titleTextStyle: GoogleFonts.robotoMono(
      color: darkColor.secondary,
      fontWeight: FontWeight.w600,
      fontSize: 18,
      wordSpacing: 3.0,
      letterSpacing: 2.0,
    ),
    subtitleTextStyle: GoogleFonts.robotoMono(
      color: darkColor.secondary,
      fontWeight: FontWeight.normal,
      fontSize: 14,
    ),
  ),
  cardTheme: CardTheme(
    color: darkColor.background,
    surfaceTintColor: darkColor.tileColor,
    shadowColor: darkColor.titleColor,
    elevation: 6.0,
  ),
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: darkColor.background,
  ),
  scaffoldBackgroundColor: darkColor.background,
);
