import 'package:flutter/material.dart';

class AccessCamera extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Access Camera',
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){

            },
          ),
        ],
      ),
      body: Container(
        child: Text('Access camera'),
      ),
    );
  }

}