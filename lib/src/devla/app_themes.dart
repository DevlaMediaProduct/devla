import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightThemeData(BuildContext context, Color kPrimaryColor,
    Color kSecondaryColor, Color kErrorColor, String kFontFamily) {
  return ThemeData.light().copyWith(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      color: kSecondaryColor,
      centerTitle: false,
      elevation: 0,
      iconTheme: IconThemeData(color: kPrimaryColor),
      textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
          .apply(fontFamily: kFontFamily, bodyColor: kPrimaryColor),
    ),
    textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
        .apply(fontFamily: kFontFamily),
    colorScheme: ColorScheme.light(
      primary: kPrimaryColor,
      secondary: kSecondaryColor,
      error: kErrorColor,
      onPrimary: Colors.white,
      onSurface: Colors.black,
    ),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: kPrimaryColor, width: 0.5),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 3,
      backgroundColor: Colors.white,
      selectedItemColor: kPrimaryColor,
      unselectedItemColor: Colors.black.withOpacity(0.5),
      selectedIconTheme: IconThemeData(color: kPrimaryColor),
      showUnselectedLabels: true,
    ),
  );
}
