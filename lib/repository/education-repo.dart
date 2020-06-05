import 'package:flutter/services.dart';
import 'dart:convert';

import 'package:resume/model/education-model.dart';

class EducationRepo {

  final String jsonFile = 'assets/json/education.json';

  Future<String> _loadFromAsset() async {
    return await rootBundle.loadString(jsonFile);
  }

  Future<EducationList> parseJson() async {
    var jsonData = await _loadFromAsset();
    var parsedJson = json.decode(jsonData);
    return EducationList().fromJson(parsedJson);
  }

}