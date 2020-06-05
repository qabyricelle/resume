import 'package:flutter/material.dart';
import 'package:resume/model/experience-model.dart';
import 'package:resume/repository/experience-repo.dart';
import 'package:resume/ui/constant.dart' as constant;

class ExperienceInfo extends StatelessWidget {

  final experienceRepo = ExperienceRepo();

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Experience', 
            style: constant.textStyle.copyWith(
              fontSize: height * 0.014,
              fontWeight: FontWeight.w600
            )),
          FutureBuilder<ExperienceList>(
            future: experienceRepo.parseJson(),
            builder: (context, snapshot) {
              if(!snapshot.hasData) return CircularProgressIndicator();
              return MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data.experiences.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      experienceInfo(context, snapshot.data.experiences[index]),
                      SizedBox(height: 5.0)
                    ],
                  );
                }),
              );
            }
          ),
        ],
      ),
    );
  }

  Widget experienceInfo(BuildContext context, Experience experience) {

    double height = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        RichText(
          text: TextSpan(
            text: experience.position,
            style: constant.textStyle.copyWith(
              fontSize: height * 0.014,
              fontWeight: FontWeight.w500,
              color: Colors.black87),
            children: [
            TextSpan(
              text: ', ${experience.start} - ${experience.end}\n',
              style: constant.textStyle.copyWith(
                fontSize: height * 0.012,
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.italic
              )
            ),
            TextSpan(
              text: experience.company,
              style: constant.textStyle.copyWith(
                fontSize: height * 0.012,
                fontWeight: FontWeight.w500
              )),
            ]
          ),
        ),
        SizedBox(height: 5.0),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: experience.tasks.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text('- ${experience.tasks[index]}',
                style: constant.textStyle.copyWith(
                fontSize: height * 0.012
              )),
            );
          })
      ],
    );
  }
}