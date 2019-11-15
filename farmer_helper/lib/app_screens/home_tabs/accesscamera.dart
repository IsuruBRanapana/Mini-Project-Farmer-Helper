import 'package:flutter/material.dart';
//todo: must remove back button that navigate login page
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