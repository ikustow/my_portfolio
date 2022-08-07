
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTextStyles {
  // Profile section desktop
  static const TextStyle mainRichDesktopTextStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.normal,
    fontSize: 24,
    fontStyle: FontStyle.normal,
    letterSpacing: 3,
  );

  static const TextStyle mainRichMobileTextStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.normal,
    fontSize: 18,
    fontStyle: FontStyle.normal,
    letterSpacing: 3,
  );

  static const TextStyle nameDesktopTextStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.normal,
    fontSize: 48,
    fontStyle: FontStyle.normal ,
   // fontFamily:
    letterSpacing: 3,
  );

  static const TextStyle positionDesktopTextStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 40,
    fontStyle: FontStyle.italic,

  );

  static const TextStyle welcomeDesktopTextStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.normal,
    fontSize: 16,
    fontStyle: FontStyle.normal,
    height: 1.5,
  );



// Experience section

// Projects section

  static const projectDescDesktopTextStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.normal,
    fontSize: 20,
    fontStyle: FontStyle.normal,
    letterSpacing: 1,
  );

  static const projectTitleDesktopTextStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    fontStyle: FontStyle.normal,
    letterSpacing: 2,
  );

//Contacts section
}