import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

Color mainColor=HexColor('667A73');
Color secondColor=HexColor('F16B31');

ThemeData lightTheme=ThemeData(
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    titleTextStyle: const TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.w800,
      fontFamily: 'myFont',
    ),
    elevation: 0,
    iconTheme:const IconThemeData(
        color: Colors.black
    ),
    backgroundColor: Colors.white,
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: secondColor,
        statusBarIconBrightness: Brightness.dark
    ),
  ),
  textTheme:const TextTheme(
    headline1: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.black,
        fontFamily: 'myFont'
    ),
    bodyText1: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.black,
        fontFamily: 'myFont'
    ),
    subtitle1: TextStyle(
        fontSize: 16,
        color: Colors.black,
        fontFamily: 'myFont'
    ),
    subtitle2: TextStyle(
        fontSize: 12,
        color: Colors.grey,
        fontFamily: 'myFont'
    ),

  ),
);

ThemeData darkTheme =ThemeData(
    scaffoldBackgroundColor: HexColor('333739'),
    appBarTheme: AppBarTheme(
    titleTextStyle:const TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w900,
      fontFamily: 'myFont',
    ),
    elevation: 0,
      iconTheme:const IconThemeData(
          color: Colors.white
      ),
    backgroundColor: HexColor('333739'),
    //backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: HexColor('333739'),
        statusBarIconBrightness: Brightness.light
    ),
  ),
    textTheme:const TextTheme(
      headline1: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.white,
          fontFamily: 'myFont'
      ),
      bodyText1: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.white,
          fontFamily: 'myFont'
      ),
      subtitle1: TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontFamily: 'myFont'
      ),
      subtitle2: TextStyle(
          fontSize: 12,
          color: Colors.grey,
          fontFamily: 'myFont'
      ),
    ),



);




