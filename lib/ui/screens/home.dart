import 'package:flutter/material.dart';
import 'package:resume/ui/widgets/contact-info.dart';
import 'package:resume/ui/widgets/education-info.dart';
import 'package:resume/ui/widgets/experience-info.dart';
import 'package:resume/ui/widgets/profile.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Profile()),
          Expanded(
            child: ContactAndSkills()),
          Expanded(
            child: EducationInfo()),
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              child: ExperienceInfo())),
        ],
      )
    );
  }
}