import 'package:flutter/material.dart';
import 'package:portfolio/core/models/Profile.dart';
import 'package:portfolio/landing_page/responsive/responsive.dart';
import 'package:portfolio/theme/colors.dart';

class HomeDesktop extends StatelessWidget {
  final Profile profileInfo;
  const HomeDesktop({Key? key, required this.profileInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(profileInfo.name),
            Container(
              height: SectionHeightValues.desktopProfileSectionHeight,
              color: SectionColorValues.profileSectionColor,
              child: ProfileRow(),
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

class ProfileRow extends StatelessWidget {
  const ProfileRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row();
  }
}
