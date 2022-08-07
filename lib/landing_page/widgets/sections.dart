
import 'package:flutter/material.dart';
import 'package:portfolio/core/models/experience.dart';
import 'package:portfolio/landing_page/responsive/responsive.dart';
import 'package:portfolio/landing_page/widgets/mobile/mobile_exp_widget.dart';
import '../../core/models/contacts.dart';
import '../../core/models/cv.dart';
import '../../core/models/project.dart';
import 'desktop/cv_section_desktop.dart';
import 'desktop/desktop_contact_section.dart';
import 'desktop/desktop_exp_stack_widget.dart';
import 'desktop/desktop_project_section.dart';

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
    if (widget.type == TypeOfResponsive.Desktop){
      return DesktopExpStackWidget(
        expList: widget.expList,
      );
    }
    else if (widget.type == TypeOfResponsive.Mobile){
      return MobileExpWidget(
        expList: widget.expList,
      );
    }
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



