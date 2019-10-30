import 'package:flutter/material.dart';

class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: <Widget>[
          Container(
            height: 260.0,
            decoration: BoxDecoration(
              color: Colors.green[400],
              image: DecorationImage(
                image: AssetImage('images/Front.jpg'),
                fit: BoxFit.cover 
              ),
            ),
            child: Center(
              child:Column(
                children: <Widget>[
                  SizedBox()
                  Text(
                    'Farmer Helper',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'Welcome to Farmer Helper',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}
