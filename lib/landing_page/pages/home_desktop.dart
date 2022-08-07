import 'package:flutter/material.dart';
import 'package:portfolio/core/models/contacts.dart';
import 'package:portfolio/core/models/profile.dart';
import 'package:portfolio/core/models/experience.dart';
import 'package:portfolio/core/models/project.dart';
import 'package:portfolio/landing_page/responsive/responsive.dart';
import 'package:portfolio/theme/colors.dart';
import '../../core/models/cv.dart';
import '../widgets/profile_widget.dart';
import '../widgets/sections.dart';

class HomeDesktop extends StatelessWidget {
  final List<Experience> expList;
  final Profile profileInfo;
  final List<Project> projects;
  final List<CV> cvList;
  final List<Contacts> contacts;

  const HomeDesktop({
    Key? key,
    required this.profileInfo,
    required this.expList,
    required this.projects,
    required this.cvList,
    required this.contacts,
  }) : super(key: key);

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
              height: SectionHeightValues.desktopExperienceSectionHeight,
              width: MediaQuery.of(context).size.width / 1.5,
              // color: Colors.white70,
              child: ExperienceSection(
                type: TypeOfResponsive.Desktop,
                expList: expList,
              ),
            ),
            Container(
              height: SectionHeightValues.desktopProjectSectionHeight,
              color: Colors.blue.shade200,
              child: ProjectsSection(projects: projects),
            ),
            Container(
              height: SectionHeightValues.desktopCVSectionHeight,
              color: Colors.white,
              child: CVSection(
                cvList: cvList,
                type: TypeOfResponsive.Desktop,
              ),
            ),
            Container(
              height: SectionHeightValues.desktopContactsSectionHeight,
              color: Colors.white,
              child: ContactSection(
                contacts: contacts,
                type: TypeOfResponsive.Desktop,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
