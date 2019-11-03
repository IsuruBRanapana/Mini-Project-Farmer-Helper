import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
