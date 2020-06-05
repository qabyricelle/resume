import 'package:flutter/services.dart';
import 'dart:convert';

import 'package:resume/model/certification-model.dart';

class CertificateRepo {

  final String jsonFile = 'assets/json/certification.json';

  Future<String> _loadFromAsset() async {
    return await rootBundle.loadString(jsonFile);
  }

  Future<CertificateList> parseJson() async {
    var jsonData = await _loadFromAsset();
    var parsedJson = json.decode(jsonData);
    return CertificateList().fromJson(parsedJson);
  }

}