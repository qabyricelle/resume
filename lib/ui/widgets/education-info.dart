import 'package:flutter/material.dart';
import 'package:resume/model/certification-model.dart';
import 'package:resume/model/education-model.dart';
import 'package:resume/repository/certification-repo.dart';
import 'package:resume/repository/education-repo.dart';
import 'package:resume/ui/constant.dart' as constant;

class EducationInfo extends StatelessWidget {

  final certificateRepo = CertificateRepo();
  final educationRepo = EducationRepo();

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            width: double.infinity,
            child: FutureBuilder<EducationList>(
              future: educationRepo.parseJson(),
              builder: (context, snapshot) {
                if(!snapshot.hasData) return CircularProgressIndicator();
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text('Education', 
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
                              educationDialog(context, snapshot.data.education);
                            },
                            child: Icon(Icons.keyboard_arrow_down,
                              size: height * 0.015,
                              color: Colors.pink.shade500),
                          )),
                      ],
                    ),
                    educationInfo(context, snapshot.data.education[0]),
                  ],
                );
              }
            ),
          )),
        
        Expanded(
         child: Container(
           padding: EdgeInsets.symmetric(horizontal: 20.0),
           width: double.infinity,
           child: FutureBuilder<CertificateList>(
             future: certificateRepo.parseJson(),
             builder: (context, snapshot) {
               if(!snapshot.hasData) return CircularProgressIndicator();
               return Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                   Row(
                     children: <Widget>[
                       Text('Certification', 
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
                              certificateDialog(context, snapshot.data.certifications);
                            },
                            child: Icon(Icons.keyboard_arrow_down,
                              size: height * 0.015,
                              color: Colors.pink.shade500),
                          )),
                     ],
                   ),
                   certificationInfo(context, snapshot.data.certifications[0]),
                 ],
               );
             }
           ),
         ))
      ],
    );
  }

  educationDialog(BuildContext context, List<Education> education) {

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
              horizontal: 10.0),
            height: height * 0.2,
            width: width * 0.8,
            child: Column(
              children: <Widget>[
                Text('Education', 
                  style: constant.textStyle.copyWith(
                    fontSize: height * 0.014,
                    fontWeight: FontWeight.w600
                  )),
                SizedBox(height: 10.0),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: education.length,
                  itemBuilder: (context, index){
                    return Column(
                      children: <Widget>[
                        educationInfo(context, education[index]),
                        SizedBox(height: 5.0)
                      ],
                    );
                  }),
              ],
            ),
          ),
        );
      }
    );
  }

  certificateDialog(BuildContext context, List<Certification> certificate) {

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
              horizontal: 10.0),
            height: height * 0.2,
            width: width * 0.8,
            child: Column(
              children: <Widget>[
                Text('Certification', 
                  style: constant.textStyle.copyWith(
                    fontSize: height * 0.014,
                    fontWeight: FontWeight.w600
                  )),
                SizedBox(height: 10.0),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: certificate.length,
                  itemBuilder: (context, index){
                    return Column(
                      children: <Widget>[
                        certificationInfo(context, certificate[index]),
                        SizedBox(height: 5.0)
                      ],
                    );
                  }),
              ],
            ),
          ),
        );
      }
    );
  }

  Widget educationInfo(BuildContext context, Education education) {

    double height = MediaQuery.of(context).size.height;

    return RichText(
      text: TextSpan(
        text: education.school,
        style: constant.textStyle.copyWith(
          fontSize: height * 0.014,
          fontWeight: FontWeight.w500,
          color: Colors.black87
          ),
      children: [
        TextSpan(
          text: ', ${education.start} - ${education.end}\n',
          style: constant.textStyle.copyWith(
            fontSize: height * 0.012,
            fontWeight: FontWeight.normal,
            fontStyle: FontStyle.italic
          )
        ),
        TextSpan(
          text: education.course,
          style: constant.textStyle.copyWith(
            fontSize: height * 0.012,
            fontWeight: FontWeight.w500
          )
        )
      ]
    ));
  }

  Widget certificationInfo(BuildContext context, Certification certification) {

    double height = MediaQuery.of(context).size.height;

    return RichText(
      text: TextSpan(
        text: certification.certificate,
        style: constant.textStyle.copyWith(
          fontSize: height * 0.014,
          fontWeight: FontWeight.w500,
          color: Colors.black87),
        children: [
        TextSpan(
          text: ', ${certification.score}\n',
          style: constant.textStyle.copyWith(
            fontSize: height * 0.012,
            fontWeight: FontWeight.normal,
            fontStyle: FontStyle.italic
          )
        ),
        TextSpan(
          text: certification.issuer,
          style: constant.textStyle.copyWith(
            fontSize: height * 0.012,
            fontWeight: FontWeight.w500
          )),
        TextSpan(
          text: ', Issued ${certification.issued}',
          style: constant.textStyle.copyWith(
            fontSize: height * 0.012,
            fontWeight: FontWeight.normal,
            fontStyle: FontStyle.italic
          ))]
      ),
    );
  }

}