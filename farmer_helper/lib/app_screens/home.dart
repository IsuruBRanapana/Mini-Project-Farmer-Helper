import 'package:flutter/material.dart';
import 'package:farmer_helper/app_screens/home_tabs/h_allproblems.dart' as AllProblems;
import 'package:farmer_helper/app_screens/home_tabs/h_latestproblems.dart' as LatestProblems;
import 'package:farmer_helper/app_screens/home_tabs/accesscamera.dart' as AccessCamera;
import 'package:farmer_helper/app_screens/home_tabs/h_filteredproblems.dart' as FilterProblems;
import 'package:farmer_helper/app_screens/home_tabs/h_aboutapp.dart' as AboutApp;

class MyTabs extends StatefulWidget{
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
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'Bottom Navigation'
        ),
      ),
      bottomNavigationBar: 
      Material(
        color: Colors.deepOrange,
        child: TabBar(
          controller: controller,
          tabs: <Tab>[
            Tab(
              icon: Icon(Icons.access_alarms),
            ),
            Tab(
              icon: Icon(Icons.backup),
            ),
            Tab(
              icon: Icon(Icons.cake),
            ),
            Tab(
              icon: Icon(Icons.dashboard),
            ),
            Tab(
              icon: Icon(Icons.edit),
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
          AboutApp.,
        ],
      ),
    );
  }
}

