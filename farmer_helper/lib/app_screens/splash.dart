import 'dart:async';
import 'package:farmer_helper/app_screens/login.dart';
import 'package:flutter/material.dart';
import 'package:farmer_helper/app_screens/home.dart';

class Splash extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SplashState();
  }

}
class _SplashState extends State<Splash> {
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 4),(){
      Navigator.pushAndRemoveUntil(context,
       MaterialPageRoute(builder: (context)=>Login()), 
       (Route<dynamic> route)=>false
       );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        child: SafeArea(
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  child: LinearProgressIndicator(),
                  width: 250.0,
                ),
                SizedBox(
                  height: 22.0,
                ),
                Text(
                  'Loading',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(
                  height: 60.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
