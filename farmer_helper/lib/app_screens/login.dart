import 'package:flutter/material.dart';
import 'package:farmer_helper/app_screens/auth.dart';
import 'package:farmer_helper/app_screens/home_tabs/h_allproblems.dart';
import 'package:farmer_helper/app_screens/signup.dart';

class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login>{

  var _formKey=GlobalKey<FormState>();
  double _minimumPadding = 5.0;

  bool _isHiddenPw = true;
  bool _isHiddenCPw = true;

  void _visiblePw() {
    setState(() {
      _isHiddenPw = !_isHiddenPw;
      _isHiddenCPw = _isHiddenCPw;
    });
  }

  void _visibleCPw() {
    setState(() {
      _isHiddenPw = _isHiddenPw;
      _isHiddenCPw = !_isHiddenCPw;
    });
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: <Widget>[
            Container(
              height: 260.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0)
                ),
                color: Colors.green[400],
                image: DecorationImage(
                  image: AssetImage('images/Front.jpg'),
                  fit: BoxFit.cover 
                ),
              ),
              child: Center(
                child:Column(
                  children: <Widget>[
                    SizedBox(height: 100.0,),
                    Text(
                      'Farmer Helper',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Welcome to Farmer Helper',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Divider(
                      thickness: 3.0, 
                      color: Colors.greenAccent,
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Text(
                      'Log In',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            signUpForm()
          ],
      )
    );
  }

  Widget _signInButton() {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () async{
        bool res=await AuthService().signInWithGoogle();
        if(!res){
          print('Error Log in with google');
        }else{
          Navigator.push(context,
            MaterialPageRoute(builder: (context)=>AllProblem())
          );
        }
        setState(() {
         //todo : set state 
        });
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("images/google_logo.png"), height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget signUpForm(){
    TextStyle textStyle=Theme.of(context).textTheme.title;
    return Container(
      alignment: Alignment.center,
      child: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.only(
            right: _minimumPadding*3,
            left: _minimumPadding * 3,
            top: _minimumPadding * 3,
          ),
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 260.0,
              ),
              //E mail
              Padding(
                padding: EdgeInsets.only(bottom: _minimumPadding),
                child: TextFormField(
                  controller: emailController,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Enter the E mail Address";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  style: textStyle,
                  decoration: InputDecoration(
                    labelText: "Email",
                    prefixIcon: Icon(Icons.email),
                    labelStyle: Theme.of(context).textTheme.body1,
                    errorStyle: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 15.0,
                    ),
                    hintText: "Johnperera@gmail.com",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              ),

              //Password
              Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: TextFormField(
                  controller: passwordController,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Enter the Password";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  style: textStyle,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      onPressed: _visiblePw,
                      icon: _isHiddenPw
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility),
                    ),
                    labelText: "Password",
                    labelStyle: Theme.of(context).textTheme.body1,
                    errorStyle: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 15.0,
                    ),
                    hintText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  obscureText: _isHiddenPw,
                ),
              ),

              //login
              Container(
                height: 70.0,
                padding: EdgeInsets.only(left: 65.0,right: 65.0,top: 10.0, bottom: 10.0),
                child: OutlineButton(
                  splashColor: Colors.green[400],
                  onPressed: () async{
                    if(emailController.text.isEmpty||passwordController.text.isEmpty){
                      print('Enter these');
                      return;
                    }else{
                      bool res = await AuthService().signInWithEmail(emailController.text, passwordController.text);
                      if(res==true){
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>AllProblem(
                            value: emailController.text,
                            ),
                          )
                        );
                      }
                      //TODO: Set State
                    }
                  },
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                  highlightElevation: 0,
                  borderSide: BorderSide(color: Colors.green[400]),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            'Log in',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),

              //Text
              Center(
                child: Text(
                  'OR',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w600
                    ),
                ),
              ),
              //sign up with google
              Container(
                padding: EdgeInsets.only(top: 10.0),
                color: Colors.white,
                child: Center(
                 child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _signInButton(),
                    ],
                  ),
                ),
              ),

              //sign in with facebook
              Container(
                height: 70.0,
                padding: EdgeInsets.only(left: 65.0,right: 65.0,top: 10.0, bottom: 10.0),
                child:RaisedButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                  onPressed: (){
                    //TODO : import
                  },
                  color: Colors.lightBlue[900],
                  child:Row(
                    children: <Widget>[
                      Image(
                        image: AssetImage(
                          "images/facebook_logo.png"
                        ), 
                        height: 35.0,
                        width: 35.0,
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Text(
                            'Sign in with Facabook',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white
                            ),
                          ),
                        ),
                      )
                    ],
                  ), 
                ),
              ),

              //sign up
              Center(
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 80.0,
                    ),
                    Text(
                      "Don't Have Account ? ",
                      style: TextStyle(
                        color: Colors.green[400],
                        fontSize: 16.0,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUp()),
                        );
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.green[400],
                          fontSize: 16.0,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700
                        ),
                      ),
                    )
                  ],
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
