import 'package:flutter/material.dart';
import 'package:resume/model/profile-model.dart' as model;
import 'package:resume/repository/profile-repo.dart';
import 'package:resume/ui/constant.dart' as constant;

class Profile extends StatefulWidget {

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final profile = model.Profile();
  final repo = ProfileRepo();

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/profile-picture.jpg')
          ),
          SizedBox(width: 20.0),
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(
                width * 0.02, 
                height * 0.06, 
                width * 0.02, 
                0.0),
              child: FutureBuilder<model.Profile>(
                future: repo.parseJson(),
                builder: (context, snapshot) {
                  if(!snapshot.hasData) return CircularProgressIndicator();
                  return Column(
                    children: <Widget>[
                      Text(snapshot.data.name,
                        style: constant.nameStyle.copyWith(
                          fontSize: height * 0.03
                        )),
                      Text(snapshot.data.title,
                        style: constant.textStyle),
                      SizedBox(height: 15.0),
                      Text(snapshot.data.introduction,
                        style: constant.textStyle.copyWith(
                          fontSize: height * 0.012
                        ))
                    ],
                  );
                }
              ),
            ),
          )
        ],
      ),
    );
  }
}