import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class BaseAuth{
  Future signInAnon();
  Future<bool> signInWithEmail(String email, String password);
  Future<void> logOut();
  Future<bool> signInWithGoogle();
}

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  //sign in anon
  Future signInAnon() async{
    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user=result.user;
      return user;
    }catch (e){
      print(e.toString());
      return null;
    }
  }

  //sign in with email
  Future<bool> signInWithEmail(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      if (user != null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<void> logOut() async{
    try{
      await _auth.signOut();
    }catch (e){
      print('error logging out');
    }
  }

  //sign in with google
  Future<bool> signInWithGoogle() async{
    try{
      GoogleSignIn googleSignIn=GoogleSignIn();
      GoogleSignInAccount account=await googleSignIn.signIn();
      if(account==null){
        return false;
      }else{
        AuthResult res=await _auth.signInWithCredential(GoogleAuthProvider.getCredential(
          idToken: (await account.authentication).idToken,
          accessToken: (await account.authentication).accessToken
        )
        );
        if(res.user==null){
          return false;
        }else{
          return true;
        }
      }
    }catch (e){
      print('error logging with google');
      return false;
    }
  }
  
}