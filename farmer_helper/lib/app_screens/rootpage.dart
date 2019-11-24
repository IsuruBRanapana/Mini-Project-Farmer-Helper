import 'package:flutter/material.dart';
import 'package:farmer_helper/app_screens/auth.dart';
import 'package:farmer_helper/app_screens/login.dart';
import 'package:farmer_helper/app_screens/home.dart';

class RootPage extends StatefulWidget {
  RootPage({this.auth});
  final BaseAuth auth;
  @override
  State<StatefulWidget> createState() {
    return _RootPageStatus();
  }
}

enum AuthStatus { notSignedIn, signedIn }

class _RootPageStatus extends State<RootPage> {
  AuthStatus authStatus = AuthStatus.notSignedIn;
  @override
  void initState() {
    super.initState();
    widget.auth.currentUser().then((userId) {
      setState(() {
        authStatus =
            userId == null ? AuthStatus.notSignedIn : AuthStatus.signedIn;
      });
    });
  }

  void _signedIn() {
    setState(() {
      authStatus = AuthStatus.signedIn;
    });
  }

  void _signedOut() {
    setState(() {
      authStatus = AuthStatus.notSignedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (authStatus) {
      case AuthStatus.notSignedIn:
        return Login(
          auth: widget.auth,
          onSignedIn: _signedIn,
        );
      case AuthStatus.signedIn:
        return MyTabs(
          auth: widget.auth,
          onSignedOut: _signedOut,
        );
    }
  }
}
