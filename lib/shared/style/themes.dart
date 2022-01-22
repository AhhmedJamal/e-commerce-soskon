import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soskon/shared/style/colors.dart';

ThemeData darkTheme = ThemeData.dark().copyWith(
  primaryColor: kprimreColor,
  // scaffoldBackgroundColor: const Color(0xff3F4040),
  scaffoldBackgroundColor: kBlack,
  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(
      color: kWhite,
    ),
    titleSpacing: 20.0,
    backgroundColor: Color(0xff3F4040),
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Color(0xff3F4040),
      statusBarIconBrightness: Brightness.light,
    ),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 20.0,
    ),
    actionsIconTheme: IconThemeData(
      color: kWhite,
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: kprimreColor,
    foregroundColor: kWhite,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: kBlack,
    selectedItemColor: kWhite,
    unselectedItemColor: kGreyText.withOpacity(0.6),
  ),
  textTheme: const TextTheme(),
);
ThemeData lightTheme = ThemeData.light().copyWith(
  primaryColor: kprimreColor,
  brightness: Brightness.light,
  scaffoldBackgroundColor: const Color(0xffFFFFFF),
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(
      color: kBlack,
    ),
    titleSpacing: 20.0,
    backgroundColor: Color(0xffFFFFFF),
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: kWhite,
      statusBarIconBrightness: Brightness.dark,
    ),
    titleTextStyle: TextStyle(
      color: kBlack,
      fontWeight: FontWeight.bold,
      fontSize: 20.0,
    ),
    actionsIconTheme: IconThemeData(
      color: kBlack,
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: kprimreColor,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: kWhite,
    selectedItemColor: kBlack,
    unselectedItemColor: kGreyText.withOpacity(0.6),
  ),
  textTheme: const TextTheme(),
);
