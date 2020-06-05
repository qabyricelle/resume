import 'package:flutter/services.dart';
import 'package:resume/model/profile-model.dart';
import 'dart:convert';

class ProfileRepo {

  final String jsonFile = 'assets/json/profile.json';

  Future<String> _loadFromAsset() async {
    return await rootBundle.loadString(jsonFile);
  }

  Future<Profile> parseJson() async {
    var jsonData = await _loadFromAsset();
    var parsedJson = json.decode(jsonData);
    return Profile().fromJson(parsedJson);
  }

}