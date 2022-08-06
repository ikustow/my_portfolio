import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/models/Profile.dart';
import 'package:portfolio/core/models/experience.dart';
import 'package:portfolio/core/models/project.dart';
import 'package:portfolio/landing_page/responsive/responsive.dart';
import 'package:portfolio/theme/colors.dart';
import 'package:show_up_animation/show_up_animation.dart';
import '../../theme/box_decoration.dart';
import '../../theme/text_styles.dart';
import '../widgets/desktop_exp_stack_widget.dart';
import '../widgets/profile_widget.dart';

class HomeDesktop extends StatelessWidget {
  final List<Experience> expList;
  final Profile profileInfo;
  final List<Project> projects;

  const HomeDesktop(
      {Key? key, required this.profileInfo, required this.expList, required this.projects})
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
              child: ProjectsSection(projects:projects),
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
    return DesktopProjectSection(projects: projects,);
  }
}

class DesktopProjectSection extends StatelessWidget {
  final List<Project> projects;
   DesktopProjectSection({Key? key, required this.projects}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "My Projects",
            style: GoogleFonts.anton(
                textStyle: AppTextStyles.nameDesktopTextStyle),
          ),
          for (Project element in projects)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ColumnChildWidget(element: element,),
            )
        ],
      ),
    );
  }
}

class ColumnChildWidget extends StatelessWidget {
  final Project element;

  const ColumnChildWidget({Key? key, required this.element}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: projectDesktopBoxStyle,
      width: 500,
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(element.name.toString()),
            Text(element.desc.toString()),
            Text(element.link.toString()),
          ],

      ),
    );
  }
}

final BoxDecoration projectDesktopBoxStyle = BoxDecoration(

  borderRadius: BorderRadius.circular(0),
  border: new Border.all(
      color: Colors.black,
      width: 2.0,
      style: BorderStyle.solid
  ),
  boxShadow: [
    BoxShadow(
      color:  Colors.orange.shade400,
      spreadRadius: 5,
      //blurRadius: 5,
      offset: new Offset(15.0, 15.0),
    ),
  ],
  color: Colors.orange.shade400,


);
