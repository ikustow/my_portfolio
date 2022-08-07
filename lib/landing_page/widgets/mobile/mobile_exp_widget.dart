import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/models/experience.dart';
import 'package:portfolio/core/strings.dart';
import 'package:portfolio/landing_page/responsive/responsive.dart';
import 'package:portfolio/theme/box_decoration.dart';
import 'package:portfolio/theme/text_styles.dart';

class MobileExpWidget extends StatelessWidget {
  final List<Experience> expList;
  const MobileExpWidget({Key? key, required this.expList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 2.0, ),
              child: Text(
                myExp,
                style: GoogleFonts.anton(
                    textStyle: AppTextStyles.nameDesktopTextStyle),
              ),
            ),
            for (Experience element in expList)
              ExpMobileWidget( count: expList.length, element: element,)
          ],
        ),
      ],
    );
  }
}

class ExpMobileWidget extends StatelessWidget {
  final Experience element;
  final int count;
  const ExpMobileWidget({Key? key, required this.element, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double containerWidth = 300;
    final double containerHeight =
        SectionHeightValues.desktopExperienceSectionHeight / (count + 1.8);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: containerWidth,
        height: containerHeight,
        decoration: AppBoxStyles.getBoxDecoration(element.id!),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                element.company.toString(),
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  fontStyle: FontStyle.normal,
                  // fontFamily:
                  letterSpacing: 1,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 4.0, left: 2.0),
              child: Text(
                element.position.toString(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                element.position.toString(),
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  fontStyle: FontStyle.normal,
                  // fontFamily:
                  letterSpacing: 1,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 4.0, left: 2.0),
              child: Text(
                element.location.toString(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                element.location.toString(),
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  fontStyle: FontStyle.normal,
                  // fontFamily:
                  letterSpacing: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}