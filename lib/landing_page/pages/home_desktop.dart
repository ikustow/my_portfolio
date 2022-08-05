import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/models/Profile.dart';
import 'package:portfolio/landing_page/responsive/responsive.dart';
import 'package:portfolio/theme/colors.dart';

import '../../theme/box_decoration.dart';
import '../../theme/text_styles.dart';

class HomeDesktop extends StatelessWidget {
  final Profile profileInfo;

  const HomeDesktop({Key? key, required this.profileInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: SectionHeightValues.desktopProfileSectionHeight,
              color: SectionColorValues.profileSectionColor,
              child: ProfileWidget(
                type: TypeOfResponsive.Desktop,
                profileInfo: profileInfo,
              ),
            ),
            Container(
              height: 600,
              color: Colors.white70,
            ),
            Container(
              height: 200,
              color: Colors.lightGreen,
            ),
            Container(
              height: 300,
              color: Colors.white70,
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileWidget extends StatelessWidget {
  final TypeOfResponsive type;
  final Profile profileInfo;

  const ProfileWidget({Key? key, required this.type, required this.profileInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (type == TypeOfResponsive.Desktop) {
      return ProfileRowWidget(
        profileInfo: profileInfo,
      );
    } else if (type == TypeOfResponsive.Mobile) {
      return Row();
    }
    return const SizedBox.shrink();
  }
}

class ProfileRowWidget extends StatelessWidget {
  final Profile profileInfo;

  const ProfileRowWidget({Key? key, required this.profileInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    final nameString = 'My name ${profileInfo.name} ${profileInfo.surname}';
    final positionString = profileInfo.position;
    final welcomeTextString = profileInfo.welcomeText;

    return Padding(
      padding: const EdgeInsets.only(left: 128.0, top: 96.0, right: 128.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 1,
            child: RichText(
              overflow: TextOverflow.ellipsis,
              maxLines: 20,
              textDirection: TextDirection.ltr,
              text: TextSpan(
                text: "Hi!",
                style: GoogleFonts.anton(textStyle:AppTextStyles.mainRichDesktopTextStyle),
                children: [
                  const TextSpan(text: "\n"),
                  TextSpan(text: nameString,style: GoogleFonts.anton(textStyle: AppTextStyles.nameDesktopTextStyle)),
                  const TextSpan(text: "\n"),
                  TextSpan(text: 'I am '),
                  TextSpan(text: positionString,style: GoogleFonts.teko(textStyle: AppTextStyles.positionDesktopTextStyle)),
                  const TextSpan(text: "\n"),
                  TextSpan(text: 'My Background'),
                  const TextSpan(text: "\n"),
                  const TextSpan(text: "\n"),
                  TextSpan(text: welcomeTextString,style: GoogleFonts.fjallaOne(textStyle: AppTextStyles.welcomeDesktopTextStyle),),
                ],
                //style:
              ),),
          ),
          Container(
            height: SectionHeightValues.desktopProfileSectionHeight/1.5,
            decoration: AppBoxStyles.mainAvatarDesktopBoxStyle,
            child: Image.network(profileInfo.avatarURL, fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }
}
