import 'package:flutter/material.dart';
import 'package:farmer_helper/app_screens/editprofile.dart';
import 'package:farmer_helper/app_screens/viewprofile.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeState();
  }
}

class _HomeState extends State<Home>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              //TODO: Add image
              accountEmail: Text(
                'abcd'
              ),
              accountName: Text(
                'Account Name'
              ),
              decoration: BoxDecoration(
                color: Colors.green[400]
              ),
            ),

            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.red,
              ),
              title: Text(
                'View Profile'
              ),
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(
                      builder: (context)=>ViewProfile()
                    ),
                );
              },
            ),

            ListTile(
              leading: Icon(
                Icons.edit,
                color: Colors.red,
              ),
              title: Text(
                'Edit Profile'
              ),
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(
                      builder: (context)=>EditProfile()
                    ),
                );
              },
            ),

          ],
        ),
      ),
    );
  }

}