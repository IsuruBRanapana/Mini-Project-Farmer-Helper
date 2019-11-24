import 'package:flutter/material.dart';

class SignOutUser extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Out'),
      ),
      body: RaisedButton(
        child: Text('Sign Out'),
        onPressed: (){},
      ),
    );
  }
}