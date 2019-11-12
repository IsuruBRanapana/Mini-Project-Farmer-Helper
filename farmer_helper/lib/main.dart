import 'package:flutter/material.dart';
import 'app_screens/login.dart';
import 'app_screens/splash.dart';
import 'package:farmer_helper/app_screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Home(),
      routes: <String, WidgetBuilder>{
        '/loginPage' : (BuildContext context) => Login()
      },
    );
  }
}