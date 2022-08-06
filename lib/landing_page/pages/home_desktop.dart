import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/models/contacts.dart';
import 'package:portfolio/core/models/profile.dart';
import 'package:portfolio/core/models/experience.dart';
import 'package:portfolio/core/models/project.dart';
import 'package:portfolio/landing_page/responsive/responsive.dart';
import 'package:portfolio/theme/colors.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/models/cv.dart';
import '../../theme/text_styles.dart';
import '../widgets/desktop_exp_stack_widget.dart';
import '../widgets/desktop_project_section.dart';
import '../widgets/profile_widget.dart';

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
              height: 800,
              color: Colors.blue.shade200,
              child: ProjectsSection(projects: projects),
            ),
            Container(
              height: 150,
              color: Colors.white,
              child: CVSection(
                cvList: cvList,
                type: TypeOfResponsive.Desktop,
              ),
            ),
            Container(
              height: 200,
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

class ExperienceSection extends StatefulWidget {
  final TypeOfResponsive type;
  final List<Experience> expList;

  const ExperienceSection({Key? key, required this.type, required this.expList})
      : super(key: key);

  @override
  State<ExperienceSection> createState() => _ExperienceSectionState();
}

class _ExperienceSectionState extends State<ExperienceSection> {
  @override
  Widget build(BuildContext context) {
    return DesktopExpStackWidget(
      expList: widget.expList,
    );
  }
}

class ProjectsSection extends StatelessWidget {
  final List<Project> projects;

  const ProjectsSection({Key? key, required this.projects}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DesktopProjectSection(
      projects: projects,
    );
  }
}

class ContactSection extends StatelessWidget {

  final List<Contacts> contacts;
  final TypeOfResponsive type;

  const ContactSection(
      {Key? key,
      required this.type,

      required this.contacts})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DesktopContactsColumn(

      contacts: contacts,
    );
  }
}

class CVSection extends StatelessWidget {
  final List<CV> cvList;
  final TypeOfResponsive type;

  const CVSection(
      {Key? key,
        required this.type,
        required this.cvList,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RowCV(
        cvList: cvList,
      ),
    );
  }
}


class RowCV extends StatelessWidget {
  final List<CV> cvList;
  const RowCV({Key? key, required this.cvList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Load My CV",
            style: GoogleFonts.anton(
                textStyle: AppTextStyles.nameDesktopTextStyle),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
        //  crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            for (CV cvElement in cvList)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RowElementWidget(
                  cvElement: cvElement,
                ),
              )
          ],
        ),
      ],
    );
  }
}

class RowElementWidget extends StatelessWidget {
  final CV cvElement;

  const RowElementWidget({Key? key, required this.cvElement}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Link(
      uri: Uri.parse(cvElement.attachments!.first.url.toString()),
      target: LinkTarget.blank,
      builder: (BuildContext ctx, FollowLink? openLink) {
        return TextButton.icon(
          onPressed: openLink,
          label:  Text(
            "CV ${cvElement.name.toString()}",
            style: TextStyle(color: Colors.indigo),
          ),
          icon: const Icon(
            Icons.download,
            color: Colors.indigo,
          ),
        );
      },
    );
  }
}


class DesktopContactsColumn extends StatelessWidget {

  final List<Contacts> contacts;

  const DesktopContactsColumn({
    Key? key,

    required this.contacts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.greenAccent.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          for (Contacts element in contacts)
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ColumnContactWidget(
                  element: element,
                ),
              ),
            )
        ],
      ),
    );
  }
}


class ColumnContactWidget extends StatelessWidget {
  final Contacts element;

  const ColumnContactWidget({Key? key, required this.element})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "${element.name.toString()}: ${element.link.toString()}",
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}
