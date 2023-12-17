import 'package:flutter/material.dart';
import 'package:yo_chat/utils/theme/custom_themes/appbar_theme.dart';
import 'package:yo_chat/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:yo_chat/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:yo_chat/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:yo_chat/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:yo_chat/utils/theme/custom_themes/text_field_theme.dart';
import 'package:yo_chat/utils/theme/custom_themes/text_theme.dart';

class YoAppTheme {
  YoAppTheme._();

// Light theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    textTheme: YoAppTextTheme.lightTextTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: YoAppBarTheme.lightAppBarTheme,
    checkboxTheme: YoCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: YoBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: YoAppElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: YoOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: YoTextFormFieldTheme.lightInputDecorationTheme,
  );

// Dark theme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    textTheme: YoAppTextTheme.darkTextTheme,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: YoAppBarTheme.darkAppBarTheme,
    checkboxTheme: YoCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: YoBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: YoAppElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: YoOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: YoTextFormFieldTheme.darkInputDecorationTheme,
  );
}
