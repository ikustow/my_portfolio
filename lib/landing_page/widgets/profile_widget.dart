import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/models/profile.dart';

import '../../core/strings.dart';
import '../../theme/box_decoration.dart';
import '../../theme/text_styles.dart';
import '../responsive/responsive.dart';



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
      return ProfileColumnWidget(profileInfo: profileInfo,);
    }
    return const SizedBox.shrink();
  }
}

class ProfileColumnWidget extends StatelessWidget {
  final Profile profileInfo;
  const ProfileColumnWidget({Key? key, required this.profileInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(hiString, style: GoogleFonts.anton(textStyle:AppTextStyles.mainRichMobileTextStyle),),
            Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: SectionHeightValues.desktopProfileSectionHeight/3,
              decoration: AppBoxStyles.mainAvatarDesktopBoxStyle,
              child: Image.network(profileInfo.avatarURL, fit: BoxFit.cover),
            ),),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(myName, style: GoogleFonts.anton(textStyle:AppTextStyles.mainRichMobileTextStyle),),
            ),
            Text("${profileInfo.name} ${profileInfo.surname}", style: GoogleFonts.anton(textStyle:AppTextStyles.mainRichMobileTextStyle),),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(iamString , style: GoogleFonts.anton(textStyle:AppTextStyles.mainRichMobileTextStyle),),
            ),
            Text("${profileInfo.position}", style: GoogleFonts.anton(textStyle:AppTextStyles.mainRichMobileTextStyle),),
          ],
        ),
      ],
    );
  }
}


class ProfileRowWidget extends StatelessWidget {
  final Profile profileInfo;

  const ProfileRowWidget({Key? key, required this.profileInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    final nameString = '$myName${profileInfo.name} ${profileInfo.surname}';
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
              overflow: TextOverflow.fade,
              maxLines: 20,
              textDirection: TextDirection.ltr,
              text: TextSpan(
                text: hiString,
                style: GoogleFonts.anton(textStyle:AppTextStyles.mainRichDesktopTextStyle),
                children: [
                  const TextSpan(text: "\n"),
                  TextSpan(text: nameString,style: GoogleFonts.anton(textStyle: AppTextStyles.nameDesktopTextStyle)),
                  const TextSpan(text: "\n"),
                  const TextSpan(text: iamString),
                  TextSpan(text: positionString,style: GoogleFonts.teko(textStyle: AppTextStyles.positionDesktopTextStyle)),
                  const TextSpan(text: "\n"),
                  const TextSpan(text: myBackground),
                  const TextSpan(text: "\n"),
                  const TextSpan(text: ""),
                  TextSpan(text: welcomeTextString,style: GoogleFonts.anton(textStyle: AppTextStyles.welcomeDesktopTextStyle),),
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