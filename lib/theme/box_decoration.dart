
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


  static BoxDecoration getBoxDecoration (int index){

    final listOfColors = [
      Colors.orange.shade200,
      Colors.green.shade300,
      Colors.pink.shade200,
      Colors.indigo.shade200,
      Colors.blue.shade400,
      Colors.blue.shade400,
    ];


    BoxDecoration mainExpDesktopBoxStyle = BoxDecoration(
      borderRadius: BorderRadius.circular(0),
      border:
      new Border.all(color: Colors.black, width: 1.0, style: BorderStyle.solid),
      boxShadow: [
        BoxShadow(
          color:  Colors.black,
          spreadRadius: 1,
          //blurRadius: 5,
          offset: Offset(4.0, 4.0),
        ),
      ],
      color: listOfColors[index-1],
    );




    return mainExpDesktopBoxStyle;

  }
  // Projects section

  static final BoxDecoration projectDesktopBoxStyle = BoxDecoration(
    borderRadius: BorderRadius.circular(0),
    border:
    new Border.all(color: Colors.black, width: 2.0, style: BorderStyle.solid),
    boxShadow: [
      BoxShadow(
        color: Colors.black,
        spreadRadius: 0.5,
        //blurRadius: 5,
        offset: new Offset(4.0, 4.0),
      ),
    ],
    color: Colors.orange.shade200,
  );

//Contacts section
}