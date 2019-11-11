import 'package:flutter/material.dart';
import 'package:farmer_helper/app_screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:farmer_helper/app_screens/usermanagement.dart';

class SignUp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SignUpState();
  }
}

class _SignUpState extends State<SignUp>{

  UserManagement userObj=new UserManagement();

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

  var _formKey = GlobalKey<FormState>();
  double _minimumPadding = 5.0;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController conPasswordController = TextEditingController();

  String firstname;
  String lastname;
  String useremail;
  String phonenumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign Up'
        ),
      ),
      body: signUpForm(),
    );
  }

  
  Widget signUpForm() {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.all(_minimumPadding * 3),
        child: ListView(
          children: <Widget>[
            //First Name
            nameFieldSet(firstNameController, 'Enter the First Name',
                'First Name', 'John'),

            // Last Name
            nameFieldSet(lastNameController, 'Enter the Last Name', 'Last Name',
                'Perera'),
            //E mail
            Padding(
              padding: EdgeInsets.only(
                  top: _minimumPadding, bottom: _minimumPadding),
              child: TextFormField(
                controller: emailController,
                validator: (String value) {
                  if (value.isEmpty) {
                    return "Enter the E mail Address";
                  }
                  useremail=emailController.text;
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

            //Phone Number
            Padding(
              padding: EdgeInsets.only(
                  top: _minimumPadding, bottom: _minimumPadding),
              child: TextFormField(
                controller: phoneNumberController,
                validator: (String value) {
                  if (value.isEmpty) {
                    return "Enter Your Phone Number";
                  }
                  phonenumber=phoneNumberController.text;
                  return null;
                },
                keyboardType: TextInputType.phone,
                style: textStyle,
                decoration: InputDecoration(
                  labelText: "Phone Number",
                  prefixIcon: Icon(Icons.phone_iphone),
                  labelStyle: Theme.of(context).textTheme.body1,
                  errorStyle: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 15.0,
                  ),
                  hintText: "0123456789",
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

            //confirm Password
            Padding(
              padding: EdgeInsets.only(
                  top: _minimumPadding, bottom: _minimumPadding),
              child: TextFormField(
                controller: conPasswordController,
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
                    onPressed: _visibleCPw,
                    icon: _isHiddenCPw
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                  ),
                  labelText: "Confirm Password",
                  labelStyle: Theme.of(context).textTheme.body1,
                  errorStyle: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 15.0,
                  ),
                  hintText: "Confirm Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                obscureText: _isHiddenCPw,
              ),
            ),

            Container(
                height: 70.0,
                padding: EdgeInsets.only(left: 65.0,right: 65.0,top: 10.0, bottom: 10.0),
                child:RaisedButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                  onPressed: ()async{
                    if (_formKey.currentState.validate()) {
                      if(passwordController.text == conPasswordController.text){
                        await FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text
                        );
                        
                        Navigator.pop(context);
                        userObj.addData({
                          'firstname':this.firstname,
                          'lastname':this.lastname,
                          'email':this.useremail,
                          'phonenumber':this.phonenumber
                        });
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>Login(),
                          )
                        );
                      //todo: add wrong password
                      }else{
                        //Todo: add password not match
                      }

                    }
                    setState(() {
                      //TODO : import  
                    });
                  },
                  color: Colors.green[400],
                  child:Padding(
                    padding: EdgeInsets.only(left: 5.0),
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white
                      ),
                    ),
                  ),
                ),
              ),

              //TODO: Add drop down to select farmer or expert
              
          ],
        ),
      ),
    );
  }
  Widget nameFieldSet(
    TextEditingController txtController, String retEmpty, String lblText,
    [String hintTxt]) {
      TextStyle textStyle = Theme.of(context).textTheme.title;
      return Padding(
        padding: EdgeInsets.only(top: _minimumPadding, bottom: _minimumPadding),
        child: TextFormField(
          controller: txtController,
          validator: (String value) {
            if (value.isEmpty) {
              return retEmpty;
            }
            if(txtController==firstNameController){
              firstname=firstNameController.text;
            }else{
              lastname=lastNameController.text;
            }
            return null;
          },
          keyboardType: TextInputType.text,
          style: textStyle,
          decoration: InputDecoration(
            labelText: lblText,
            prefixIcon: Icon(Icons.account_circle),
            labelStyle: Theme.of(context).textTheme.body1,
            errorStyle: TextStyle(
              color: Colors.redAccent,
              fontSize: 15.0,
            ),
            hintText: hintTxt,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
      );
  }
}