import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopping_api_prof/layout/constants/const_colors.dart';

ThemeData ligthTheme  = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primarySwatch: Colors.teal,
  appBarTheme: AppBarTheme(
    color: Colors.white,
    elevation:0.0,
    titleSpacing: 20.0,
    titleTextStyle: TextStyle(color: Colors.black),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Colors.teal,
     unselectedItemColor: Colors.grey,
    elevation: 20.0,
    type: BottomNavigationBarType.fixed,
    selectedLabelStyle: TextStyle(color: Colors.teal,fontWeight: FontWeight.w700),
    unselectedLabelStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.w700)
  ),
  /// NAME         SIZE  WEIGHT  SPACING
  /// headline1    96.0  light   -1.5
  /// headline2    60.0  light   -0.5
  /// headline3    48.0  regular  0.0
  /// headline4    34.0  regular  0.25
  /// headline5    24.0  regular  0.0
  /// headline6    20.0  medium   0.15
  /// subtitle1    16.0  regular  0.15
  /// subtitle2    14.0  medium   0.1
  /// body1        16.0  regular  0.5   (bodyText1)
  /// body2        14.0  regular  0.25  (bodyText2)
  /// button       14.0  medium   1.25
  /// caption      12.0  regular  0.4
  /// overline     10.0  regular  1.5
  textTheme: TextTheme(

    subtitle2: TextStyle(color: Colors.black,fontSize: 16),
    subtitle1: TextStyle(color: Colors.black,fontSize: 14,decoration: TextDecoration.lineThrough,),
     headline6: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,letterSpacing: 1.0,fontSize: 18),
     caption:TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w500),
    headline4: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,letterSpacing: 1.0,fontSize: 34),


    bodyText1: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,letterSpacing: 1.0,fontSize: 18),
  ),
);


ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor:defaultColorsDarkTheme,
  primarySwatch: Colors.teal,

  appBarTheme: AppBarTheme(
    color: defaultColorsDarkTheme,
    elevation:0.0,
    titleSpacing: 20.0,
    titleTextStyle: TextStyle(color: Colors.white),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarIconBrightness: Brightness.light,
    ),
  ),

  textTheme:TextTheme(
    subtitle2: TextStyle(color: Colors.white,fontSize: 16),
    subtitle1: TextStyle(color: Colors.white,fontSize: 14,decoration: TextDecoration.lineThrough,),
    caption:TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w500),
    headline6: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,letterSpacing: 1.0,fontSize: 18),
    headline4: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,letterSpacing: 1.0,fontSize: 34),

    bodyText1: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,letterSpacing: 1.0,fontSize: 16),
  ),


  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: defaultColorsDarkTheme,
      selectedItemColor: Colors.teal,
      unselectedItemColor: Colors.white,
      elevation: 20.0,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(color: Colors.teal,fontWeight: FontWeight.w700),
      unselectedLabelStyle:TextStyle(color: Colors.white,fontWeight: FontWeight.w700),
  ),

);