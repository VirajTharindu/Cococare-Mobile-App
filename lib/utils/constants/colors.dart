import 'package:flutter/material.dart';

class CColors {
  CColors._();

  //app basic colors
  static const Color primaryColor = Color.fromARGB(255, 6, 125, 2);
  static const Color secondaryColor = Color.fromARGB(255, 138, 138, 138);
  static const Color accentColor = Colors.greenAccent;

  //gradient color
  static const Gradient linearGradient = LinearGradient(
      begin: Alignment(0.0, 0.0),
      end: Alignment(0.707, -0.707),
      colors: [
        Color(0xFFFF9A9E),
        Color(0xFFFAD0C4),
        Color(0xFFFAD0C4),
      ]);

  //app text colors
  static const Color textPrimaryColor = Color.fromARGB(255, 0, 0, 0);
  static const Color textSecondaryColor = Color.fromARGB(255, 39, 39, 39);
  static const Color textWhite = Colors.white;

  //Background colors
  static const Color light = Color.fromARGB(255, 242, 242, 242);
  static const Color dark = Color.fromARGB(255, 20, 20, 20);
  static const Color primeBackground = Color.fromARGB(255, 242, 242, 242);

  //Background container colors
  static const Color lightContainer = Color.fromARGB(255, 242, 242, 242);
  static Color darkContainer = CColors.white.withOpacity(0.1);

  //button colors
  static const Color buttonPrimaryColor = Color.fromARGB(255, 6, 125, 2);
  static const Color buttonSecondaryColor = Color.fromARGB(255, 138, 138, 138);
  static const Color buttonDisabled = Color.fromARGB(255, 202, 202, 202);

  //border colors
  static const Color borderPrimaryColor = Color.fromARGB(255, 226, 225, 225);
  static const Color borderSecondaryColor = Color.fromARGB(255, 228, 226, 226);

  //error & validation colors
  static const Color errorColor = Color.fromARGB(255, 255, 0, 0);
  static const Color successColor = Color.fromARGB(255, 0, 255, 0);
  static const Color warningColor = Color.fromARGB(255, 255, 128, 0);
  static const Color infoColor = Color.fromARGB(255, 0, 0, 255);

  //neutral shades
  static const Color black = Color.fromARGB(255, 0, 0, 0);
  static const Color darkergrey = Color.fromARGB(255, 64, 64, 64);
  static const Color darkgrey = Color.fromARGB(255, 128, 128, 128);
  static const Color grey = Color.fromARGB(255, 192, 192, 192);
  static const Color softgrey = Color.fromARGB(255, 211, 211, 211);
  static const Color lightgrey = Color.fromARGB(255, 238, 238, 238);
  static const Color white = Color.fromARGB(255, 255, 255, 255);
}
