import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/models/experience.dart';
import '../../../core/strings.dart';
import '../../../theme/box_decoration.dart';
import '../../../theme/text_styles.dart';
import '../../responsive/responsive.dart';



class DesktopExperienceWidget extends StatelessWidget {
  final List<Experience> expList;

  const DesktopExperienceWidget({Key? key, required this.expList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    expList.sort((a, b) => a.id!.compareTo(b.id!));
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            myExp,
            style: GoogleFonts.anton(
                textStyle: AppTextStyles.nameDesktopTextStyle),
          ),
          for (Experience element in expList)
            ExpElementWidget( count: expList.length, element: element,)
        ],
      ),
    );
  }
}

class ExpElementWidget extends StatelessWidget {
  final Experience element;
  final int count;
  const ExpElementWidget({Key? key, required this.element, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double containerWidth = 400;
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
            const Padding(
              padding: EdgeInsets.only(top: 4.0, left: 2.0),
              child: Text(
                position,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                element.position.toString(),
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
            const Padding(
              padding: EdgeInsets.only(top: 4.0, left: 2.0),
              child: Text(
                location,
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

