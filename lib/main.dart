import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components/SplashScreen.dart';
import 'components/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const double maximumDensity = 4.0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/':(context)=>SplashScreen(),
        '/home':(context)=>Home(),
      },
      title: 'Get-Fit',
    );
  }
}
