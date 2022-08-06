import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {

  final Widget mobileAppBody;
  final Widget desktopBody;
  final Widget tabletBody;

  ResponsiveLayout({
    required this.desktopBody,
    required this.tabletBody,
    required this.mobileAppBody,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return mobileAppBody;
        } else if (constraints.maxWidth < 900) {
          return tabletBody;
        } else {
          return desktopBody;
        }
      },
    );
  }
}

enum TypeOfResponsive {
  Mobile,
  Desktop,
  Tablet,
}

abstract class SectionHeightValues {
  // Profile section
  static const double desktopProfileSectionHeight = 500;
  static const double tabletProfileSectionHeight = 400;
  static const double mobileProfileSectionHeight = 200;

  // Experience section
  static const double desktopExperienceSectionHeight = 950;

// Projects section

//Contacts section
}