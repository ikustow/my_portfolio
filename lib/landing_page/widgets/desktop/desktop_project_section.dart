
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/link.dart';

import '../../../core/models/project.dart';
import '../../../core/strings.dart';
import '../../../theme/box_decoration.dart';
import '../../../theme/text_styles.dart';

class DesktopProjectSection extends StatelessWidget {
  final List<Project> projects;

  const DesktopProjectSection({Key? key, required this.projects}) : super(key: key);

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
              child: ColumnChildWidget(
                element: element,
              ),
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
    return Container(
      decoration: AppBoxStyles.projectDesktopBoxStyle,
      width: 400,
      height: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 8),
            child: Text(
              element.name.toString(),
              style: AppTextStyles.projectTitleDesktopTextStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 8),
            child: Text(
              element.desc.toString(),
              style: AppTextStyles.projectDescDesktopTextStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 8),
            child: Link(
              uri: Uri.parse(
                  element.link.toString()),
              target: LinkTarget.blank,
              builder: (BuildContext ctx, FollowLink? openLink) {
                return TextButton.icon(

                  onPressed: openLink,
                  label:  const Text(sourceCode, style: TextStyle(color: Colors.indigo),),
                  icon: const Icon(Icons.read_more, color: Colors.indigo,),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
