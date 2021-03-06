import 'package:flutter/material.dart';
import 'package:farmer_helper/app_screens/editprofile.dart';
import 'package:farmer_helper/app_screens/viewprofile.dart';

class FilterProblem extends StatefulWidget {
  //Todo : Add shared preference
  final String value;
  FilterProblem({Key key, this.value}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _FilterProblemState();
  }
}

class _FilterProblemState extends State<FilterProblem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Filter',
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
              accountEmail: Text('${widget.value}'),
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
      //TODO: problem list in database
      body: filteredProblemList(),
    );
  }

  Widget filteredProblemList() {
    return ListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.green[300],
            ),
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.adjust),
                  title: Text(
                    'About paddy'
                  ),
                  subtitle: Text(
                    "Can't solve this"
                  ),
                  onTap: (){
                    print('object');
                  },
                ),
                Image(
                  width: 370.0,
                  height: 200.0,
                  image: AssetImage('images/Front.jpg'),
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  height: 10.0,
                )
              ],
            )
          ),
        ),
      ],
    );
  }
}
