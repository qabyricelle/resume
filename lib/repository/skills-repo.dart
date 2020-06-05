import 'package:flutter/services.dart';
import 'dart:convert';

import 'package:resume/model/skills-model.dart';

class SkillsRepo {

  final String jsonFile = 'assets/json/skills.json';

  Future<String> _loadFromAsset() async {
    return await rootBundle.loadString(jsonFile);
  }

  Future<SkillsList> parseJson() async {
    var jsonData = await _loadFromAsset();
    var parsedJson = json.decode(jsonData);
    return SkillsList().fromJson(parsedJson);
  }

}