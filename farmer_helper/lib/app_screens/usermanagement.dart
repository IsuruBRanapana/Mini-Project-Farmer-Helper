import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserManagement{
  bool isLoggedIn() {
    if (FirebaseAuth.instance.currentUser() != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> addData(userData) async{
    if(isLoggedIn()){
      Firestore.instance.collection('users').add(userData).catchError((e){
        print(e);
      });
    }else{
      print('You Need to log in');
    }
  }
}