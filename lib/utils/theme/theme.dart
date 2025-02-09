import 'package:flutter/material.dart';
import 'package:coconut_disease_detection/utils/theme/custom themes/text_theme.dart';

import 'custom themes/appbar_theme.dart';
import 'custom themes/bottom_theme_sheet.dart';
import 'custom themes/checkbox_theme.dart';
import 'custom themes/elevated_button_theme.dart';
import 'custom themes/chip_theme.dart';
import 'custom themes/outlined_button_theme.dart';
import 'custom themes/text_field_theme.dart';

class CAppTheme {
  CAppTheme._();

  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: Colors.green,
      scaffoldBackgroundColor: Colors.white,
      textTheme: CTextTheme.lightTextTheme,
      chipTheme: CChipTheme.lightChipTheme,
      appBarTheme: CAppBarTheme.lightAppBarTheme,
      bottomSheetTheme: CBottomSheetTheme.lightBottomSheetTheme,
      elevatedButtonTheme: CElevatedButtonTheme.lightElevatedButtonTheme,
      outlinedButtonTheme: COutLinedButtonTheme.lightOutlinedButtonTheme,
      checkboxTheme: CCheckBoxTheme.lightCheckBoxTheme,
      inputDecorationTheme: CTextFormFieldTheme.lightInputDecorationTheme);

  // textButtonTheme: CTextButtonTheme.lightTextButtonTheme,

  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: Colors.green,
      scaffoldBackgroundColor: Colors.black,
      textTheme: CTextTheme.darkTextTheme,
      chipTheme: CChipTheme.darkChipTheme,
      appBarTheme: CAppBarTheme.darkAppBarTheme,
      bottomSheetTheme: CBottomSheetTheme.darkBottomSheetTheme,
      elevatedButtonTheme: CElevatedButtonTheme.darkElevatedButtonTheme,
      outlinedButtonTheme: COutLinedButtonTheme.darkOutlinedButtonTheme,
      checkboxTheme: CCheckBoxTheme.darkCheckBoxTheme,
      inputDecorationTheme: CTextFormFieldTheme.darkInputDecorationTheme);
}
