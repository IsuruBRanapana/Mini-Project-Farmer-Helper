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
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0)
              ),
              color: Colors.green[400],
              image: DecorationImage(
                image: AssetImage('images/Front.jpg'),
                fit: BoxFit.cover 
              ),
            ),
            child: Center(
              child:Column(
                children: <Widget>[
                  SizedBox(height: 100.0,),
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
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Divider(
                    thickness: 3.0, 
                    color: Colors.greenAccent,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    'Log In',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          signUpForm()
        ],
      )
    );
  }

  Widget signUpForm(){
    TextStyle textStyle=Theme.of(context).textTheme.title;
    return Container(
      
    );
  }
}
