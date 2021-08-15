import 'package:flutter/material.dart';
import 'dart:async';
import 'home.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashState();
  }
}

class SplashState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }
  startTime() async {
    var duration = new Duration(seconds:2);
    return Timer(duration, route);
  }
  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => Home()
    )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[600],
      body:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.public,
                size: 100.0,
                color: Colors.white,
              ),
              SizedBox(height: 7.0,),
              Text('World-Time', style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20.0,
                  color:Colors.white
              ),),
            ],
          ),
      ),
    );
  }


}
