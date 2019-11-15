import 'package:flutter/material.dart';

import '../editprofile.dart';
import '../viewprofile.dart';

class FilterProblem extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About App',
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
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              //TODO: Add image
              accountEmail: Text(''),
              accountName: Text('Account Name'),
              decoration: BoxDecoration(color: Colors.green[400]),
            ),

            //View profile
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.red,
              ),
              title: Text('View Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewProfile()),
                );
              },
            ),

            //edit profile
            ListTile(
              leading: Icon(
                Icons.edit,
                color: Colors.red,
              ),
              title: Text('Edit Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfile()),
                );
              },
            ),

            //Change language
            ListTile(
              leading: Icon(
                Icons.language,
                color: Colors.red,
              ),
              title: Text('Change Language'),
              onTap: () {
                //Todo: create Change language page and set localization in app
              },
            ),


            Divider(
              height: 2.0,
              thickness: 2.0,
              color: Colors.green[400],
            ),

            //close
            ListTile(
              leading: Icon(
                Icons.close,
                color: Colors.red,
              ),
              title: Text('Close'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),

            //sign out
            ListTile(
              leading: Icon(
                Icons.clear,
                color: Colors.red,
              ),
              title: Text('Log Out'),
              onTap: () {
                //TODO: sign out
              },
            ),
          ],
        ),
      ),
      body: Container(
        child: Text('About App'),
      ),
    );
  }

}