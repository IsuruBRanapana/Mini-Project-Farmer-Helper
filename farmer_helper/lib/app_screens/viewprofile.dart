import 'package:farmer_helper/app_screens/home_tabs/h_allproblems.dart';
import 'package:flutter/material.dart';
import 'package:farmer_helper/app_screens/editprofile.dart';


class ViewProfile extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ViewProfileState();
  }
}

class ViewProfileState extends State<ViewProfile>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'View Profile',
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

            //View profile
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.red,
              ),
              title: Text(
                'Home'
              ),
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(
                      builder: (context)=>AllProblem()
                    ),
                );
              },
            ),

            //edit profile
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
              title: Text(
                'Close'
              ),
              onTap: (){
                Navigator.of(context).pop();
              },
            ),

            //sign out
            ListTile(
              leading: Icon(
                Icons.clear,
                color: Colors.red,
              ),
              title: Text(
                'Log Out'
              ),
              onTap: (){
                //TODO: sign out
              },
            ),
          ],
        ),
      ),
      body: profileBody(),
    );
  }
  Widget profileBody(){
    return Column(
      
    );
  }
}