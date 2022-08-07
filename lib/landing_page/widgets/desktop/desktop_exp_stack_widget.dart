import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:show_up_animation/show_up_animation.dart';
import '../../../core/models/experience.dart';
import '../../../core/strings.dart';
import '../../../theme/box_decoration.dart';
import '../../../theme/text_styles.dart';
import '../../responsive/responsive.dart';


class DesktopExpStackWidget extends StatelessWidget {
  final List<Experience> expList;
  const DesktopExpStackWidget({Key? key, required this.expList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 36.0, ),
          child: Text(
            myExp,
            style: GoogleFonts.anton(
                textStyle: AppTextStyles.nameDesktopTextStyle),
          ),
        ),
        Positioned(
          top: 100,
          right: 70,
          child: Image.asset(
            'assets/star_purple.png',
            width: 100,
            height: 100,
          ),
        ),
        Positioned(
          top: 250,
          right: 10,
          child: Image.asset(
            'assets/star_indigo.png',
            width: 100,
            height: 100,
          ),
        ),
        Positioned(
          bottom: 150,
          left: 100,
          child: Image.asset(
            'assets/lines_1.png',
            width: 150,
            height: 150,
          ),
        ),
        Positioned(
          bottom: 300,
          left: 100,
          child: Image.asset(
            'assets/lines_2.png',
            width: 200,
            height: 200,
          ),
        ),
        for (Experience element in expList)
          PostitionedWidget( count: expList.length, element: element,)
      ],
    );
  }
}

class PostitionedWidget extends StatelessWidget {
  final Experience element;
  final int count;
  const PostitionedWidget({Key? key, required this.element, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    const double containerWidth = 300;
    final double containerHeight =
        SectionHeightValues.desktopExperienceSectionHeight / (count + 1.8);

    final double topPositionedValue =
        (containerHeight * element.id!) + (element.id! * 14);
    final double leftPositionedValue = (containerWidth / 3) * element.id!;

    return Positioned(
      top: topPositionedValue,
      left: leftPositionedValue,
      child: ShowUpAnimation(
        delayStart: Duration(seconds: element.id!.toInt()),
        animationDuration: const Duration(seconds: 2),
        curve: Curves.easeInOut,
        direction: Direction.horizontal,
        offset: 0.2,
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
      ),
    );
  }
}