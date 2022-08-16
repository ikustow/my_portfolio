import 'package:flutter/material.dart';
import '../../core/models/contacts.dart';
import '../../core/models/cv.dart';
import '../../core/models/experience.dart';
import '../../core/models/profile.dart';
import '../../core/models/project.dart';
import '../../theme/colors.dart';
import '../responsive/responsive.dart';
import '../widgets/profile_widget.dart';
import '../widgets/sections.dart';

class HomeMobile extends StatelessWidget {
  final List<Experience> expList;
  final Profile profileInfo;
  final List<Project> projects;
  final List<CV> cvList;
  final List<Contacts> contacts;

  const HomeMobile(
      {Key? key,
      required this.expList,
      required this.profileInfo,
      required this.projects,
      required this.cvList,
      required this.contacts})
      : super(key: key);

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
                type: TypeOfResponsive.Mobile,
                profileInfo: profileInfo,
              ),
            ),
            Container(
              height: SectionHeightValues.mobileExperienceSectionHeight,
              width: MediaQuery.of(context).size.width / 1.5,
              // color: Colors.white70,
              child: ExperienceSection(
                type: TypeOfResponsive.Mobile,
                expList: expList,
              ),
            ),
            Container(
              height: SectionHeightValues.desktopProjectSectionHeight,
              color: Colors.blue.shade200,
              child: ProjectsSection(projects: projects),
            ),
            Container(
              height: SectionHeightValues.mobileCVSectionHeight,
              color: Colors.white,
              child: CVSection(
                cvList: cvList,
                type: TypeOfResponsive.Mobile,
              ),
            ),
            Container(
              height: SectionHeightValues.desktopContactsSectionHeight,
              color: Colors.white,
              child: ContactSection(
                contacts: contacts,
                type: TypeOfResponsive.Mobile,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
