import 'package:farmer_helper/app_screens/auth.dart';
import 'package:flutter/material.dart';
import 'package:farmer_helper/app_screens/home_tabs/h_allproblems.dart' as AllProblems;
import 'package:farmer_helper/app_screens/home_tabs/h_latestproblems.dart' as LatestProblems;
import 'package:farmer_helper/app_screens/home_tabs/accesscamera.dart' as AccessCamera;
import 'package:farmer_helper/app_screens/home_tabs/h_filteredproblems.dart' as FilterProblems;
import 'package:farmer_helper/app_screens/home_tabs/h_aboutapp.dart' as AboutApp;

class MyTabs extends StatefulWidget{
  MyTabs({this.auth,this.onSignedOut});
  final BaseAuth auth;
  final VoidCallback onSignedOut;
  void _signOut() async{
    try{
      await auth.signOut();
      onSignedOut();
    }catch (e){
      print(e);
    }
  }


  @override
  State<StatefulWidget> createState() {
    return _MyTabsState();
  }
}

class _MyTabsState extends State<MyTabs> with SingleTickerProviderStateMixin{

  TabController controller;
  @override
  void initState(){
    super.initState();
    controller=TabController(vsync: this,length: 5);
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
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
      bottomNavigationBar: Material(
        color: Colors.green[400],
        child: TabBar(
          controller: controller,
          tabs: <Tab>[
            Tab(
              icon: Icon(Icons.home),
            ),
            Tab(
              icon: Icon(Icons.star),
            ),
            Tab(
              icon: Icon(Icons.camera),
            ),
            Tab(
              icon: Icon(Icons.filter_list),
            ),
            Tab(
              icon: Icon(Icons.person),
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          AllProblems.AllProblem(),
          LatestProblems.LatestProblem(),
          AccessCamera.AccessCamera(),
          FilterProblems.FilterProblem(),
          AboutApp.FilterProblem(),
        ],
      ),
    );
  }
}

