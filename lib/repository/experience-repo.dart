import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:resume/model/experience-model.dart';

class ExperienceRepo {

  final String jsonFile = 'assets/json/experience.json';

  Future<String> _loadFromAsset() async {
    return await rootBundle.loadString(jsonFile);
  }

  Future<ExperienceList> parseJson() async {
    var jsonData = await _loadFromAsset();
    var parsedJson = json.decode(jsonData);
    return ExperienceList().fromJson(parsedJson);
  }

}