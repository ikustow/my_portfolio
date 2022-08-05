
import 'package:flutter/material.dart';

abstract class AppBoxStyles {
  // Profile section desktop
  static final BoxDecoration mainAvatarDesktopBoxStyle = BoxDecoration(

    borderRadius: BorderRadius.circular(0),
    border: new Border.all(
        color: Colors.black,
        width: 2.0,
        style: BorderStyle.solid
    ),
    boxShadow: [
      BoxShadow(
        color:  Colors.orange.shade400,
        spreadRadius: 5,
        //blurRadius: 5,
          offset: new Offset(15.0, 15.0),
      ),
    ],
    color: Colors.orange.shade400,


  );


// Experience section

// Projects section

//Contacts section
}