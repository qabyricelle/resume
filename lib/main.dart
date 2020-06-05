import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resume/ui/screens/home.dart';

void main() {
  runApp(Resume());
}

class Resume extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home()
    );
  }
}