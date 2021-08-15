import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class WorldTime{
  String city;
  String time;
  String continent;

  WorldTime({this.city,this.continent});
  Future<void> getTime() async{
    try {
      Response response = await http.get('http://worldtimeapi.org/api/timezone/$continent/$city');
      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];
      String offsetHour = data['utc_offset'].substring(1, 3);
      String offsetMin = data['utc_offset'].substring(4, 6);
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(
          hours: int.parse(offsetHour), minutes: int.parse(offsetMin)));

      this.time = DateFormat.jm().format(now);
    }
    catch(e){
      time='Wrong Information';
    }
  }
  Widget build(BuildContext context) {
    return Container();
  }
}