import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:resume/model/skills-model.dart';
import 'package:resume/repository/profile-repo.dart';
import 'package:resume/repository/skills-repo.dart';
import 'package:resume/ui/constant.dart' as constant;
import 'package:resume/model/profile-model.dart' as model;
import 'package:resume/model/skills-model.dart' as model;

class ContactAndSkills extends StatefulWidget {

  @override
  _ContactAndSkillsState createState() => _ContactAndSkillsState();
}

class _ContactAndSkillsState extends State<ContactAndSkills> {
  final contact = model.Profile();
  final skills = model.Skills();
  final profileRepo = ProfileRepo();
  final skillsRepo = SkillsRepo();

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: FutureBuilder<model.Profile>(
              future: profileRepo.parseJson(),
              builder: (context, snapshot) {
                if(!snapshot.hasData) return CircularProgressIndicator();
                return Column(
                  children: <Widget>[
                    contactInfo(context, 'phone.svg', snapshot.data.contact),
                    SizedBox(height: 5.0),
                    contactInfo(context, 'email.svg', snapshot.data.email),
                    SizedBox(height: 5.0),
                    contactInfo(context, 'linkedin.svg', snapshot.data.linkedin),
                    SizedBox(height: 5.0),
                    contactInfo(context, 'github.svg', snapshot.data.github),
                  ],
                );
              }
            ),
          ),
          SizedBox(width: 30.0),
          Expanded(
            child: FutureBuilder<SkillsList>(
              future: skillsRepo.parseJson(),
              builder: (context, snapshot) {
                if(!snapshot.hasData) return CircularProgressIndicator();
                return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text('Skills', 
                              style: constant.textStyle.copyWith(
                                fontSize: height * 0.014,
                                fontWeight: FontWeight.w600
                              )),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.0
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  skillsDialog(context, snapshot.data.skills);
                                },
                                child: Icon(Icons.keyboard_arrow_down,
                                  size: height * 0.015,
                                  color: Colors.pink.shade500),
                              )),
                          ],
                        ),
                        SizedBox(height: 5.0),
                        Container(
                              height: height * 0.1,
                              child: MediaQuery.removePadding(
                                context: context,
                                removeTop: true,
                                removeBottom: true,
                                child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: 5,
                                  itemBuilder: (context, index) {
                                    return skillsInfo(context, snapshot.data.skills[index].skill, snapshot.data.skills[index].rate);
                                  }),
                              ),
                        )
                      ],
                );
              }
            )
          )
        ]
      )
    );
  }

  skillsDialog(BuildContext context, List<Skills> skills) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)
          ),
          content: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0),
            height: height * 0.2,
            width: width * 0.8,
            child: Column(
              children: <Widget>[
                Text('Skills', 
                  style: constant.textStyle.copyWith(
                    fontSize: height * 0.014,
                    fontWeight: FontWeight.w600
                  )),
                SizedBox(height: 10.0),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: skills.length,
                  itemBuilder: (context, index){
                    return skillsInfo(context, skills[index].skill, skills[index].rate);
                  }),
              ],
            ),
          ),
        );
      }
    );
  }

  Widget contactInfo(BuildContext context, String asset, String text) {

    double height = MediaQuery.of(context).size.height;

    return Row(
      children: <Widget>[
        CircleAvatar(
          radius: 10.0,
          backgroundColor: Colors.black54,
          child: SvgPicture.asset('assets/images/$asset',
            height: height * 0.012,
            color: Colors.white)),
        SizedBox(width: 20.0),
        Text(text,
          style: constant.textStyle.copyWith(
            fontSize: height * 0.014
          ))
      ],
    );
  }

  Widget skillsInfo(BuildContext context, String text, int star) {

    double height = MediaQuery.of(context).size.height;
    Color color = Colors.black87;

    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            height: height * 0.012,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                if(star <= index) color = Colors.black12;
                return Icon(Icons.star,
                  size: height * 0.012,
                  color: color);
              }),
          ),
        ),
        SizedBox(width: 10.0),
        Expanded(
          flex: 2,
          child: Container(
            child: Text(text,
              style: constant.textStyle.copyWith(
              fontSize: height * 0.013
              )),
          ))
      ],
    );
  }
}