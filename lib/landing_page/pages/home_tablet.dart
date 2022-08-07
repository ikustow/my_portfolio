import 'package:flutter/material.dart';

import '../../core/models/contacts.dart';
import '../../core/models/cv.dart';
import '../../core/models/experience.dart';
import '../../core/models/profile.dart';
import '../../core/models/project.dart';

class HomeTablet extends StatelessWidget {
  final List<Experience> expList;
  final Profile profileInfo;
  final List<Project> projects;
  final List<CV> cvList;
  final List<Contacts> contacts;

  const HomeTablet(
      {Key? key,
      required this.expList,
      required this.profileInfo,
      required this.projects,
      required this.cvList,
      required this.contacts})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
