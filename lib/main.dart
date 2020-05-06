import 'package:flutter/material.dart';
import 'package:flutterappparctice/screens/onboarding.dart';
import 'package:flutterappparctice/utilities/app_theme.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      home: Onboarding(),
    );
  }
}