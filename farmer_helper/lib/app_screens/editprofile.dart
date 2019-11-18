import 'package:farmer_helper/app_screens/home.dart';
import 'package:flutter/material.dart';
import 'package:farmer_helper/app_screens/viewprofile.dart';
class EditProfile extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return EditProfileState();
  }
}

class EditProfileState extends State<EditProfile>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile',
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
                      builder: (context)=>MyTabs()
                    ),
                );
              },
            ),

            //edit profile
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
                logOutAlert(context);
                //TODO: Import dialog box want to sign out
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
   Future<bool> logOutAlert(BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Log Out', style: TextStyle(fontSize: 15.0)),
            content: Text('Are You Sure ?'),
            actions: <Widget>[
              FlatButton(
                child: Text('Yes'),
                textColor: Colors.green[400],
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushReplacementNamed('/loginPage');
                },
              ),
              FlatButton(
                child: Text('No'),
                textColor: Colors.green[400],
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        }
      );
  }

}