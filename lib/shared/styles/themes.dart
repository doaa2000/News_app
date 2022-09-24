import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/shared/styles/colors.dart';

ThemeData darktheme= ThemeData(
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor:  Colors.white,
    selectedItemColor: Colors.deepOrange,
    unselectedItemColor: Colors.grey,

  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      color: Colors.black,
      fontSize: 15.0,
      fontWeight: FontWeight.w600,
    ),

  ),
  primarySwatch:defaultColor,

  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    titleTextStyle:TextStyle(
      color: Colors.black,
    ),
    backgroundColor: Colors.white,
    elevation: 0.0,
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,

    ),
  ),
);
ThemeData lighttheme= ThemeData(
  textTheme: TextTheme(
    bodyText1: TextStyle(
      color: Colors.white,
      fontSize: 15.0,
      fontWeight: FontWeight.w600,
    ),
  ),
  primarySwatch: defaultColor,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor:  HexColor('333739'),
    selectedItemColor: defaultColor,
    unselectedItemColor: Colors.grey,

  ),
  scaffoldBackgroundColor: HexColor('333739'),
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    titleTextStyle:TextStyle(
      color: Colors.white,
    ),
    backgroundColor: HexColor('333739'),
    elevation: 0.0,
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: HexColor('333739'),
      statusBarIconBrightness: Brightness.light,

    ),
  ),

);
