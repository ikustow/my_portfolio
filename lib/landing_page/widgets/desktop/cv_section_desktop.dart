import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/link.dart';
import '../../../core/models/cv.dart';
import '../../../core/strings.dart';
import '../../../theme/text_styles.dart';

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
            loadCV,
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
            "$cvString ${cvElement.name.toString()}",
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