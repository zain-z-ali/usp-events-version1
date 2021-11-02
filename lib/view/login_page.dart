import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:fluttertoast/fluttertoast.dart';
//import 'package:version1_0/main.dart';
import 'package:version1_0/view/SIgnUp.dart';
// import 'package:version1_0/main.dart';
// import 'package:version1_0/view/events.da5rt';

class LoginPage extends StatefulWidget {
  //LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // form key
  final formkey = GlobalKey<FormState>();

  //editing controller
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  //firebase
  final _auth = FirebaseAuth.instance;

  bool isRememberMe = false;

  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email/Username',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 5, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(
                  top: 15,
                  left: 25,
                  bottom: 15,
                ),
                prefixIcon: Icon(Icons.email, color: Color(0xff31aecb)),
                hintText: 'Email/Username',
                hintStyle: TextStyle(color: Colors.black38)),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter an email';
              }
              if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                  .hasMatch(value)) {
                return 'Please enter a valid Email';
              }
              return null;
            },
            onSaved: (value) {
              emailController.text = value!;
            },
            textInputAction: TextInputAction.next,
          ),
        )
      ],
    );
  }

  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 5, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextFormField(
            obscureText: true,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(
                  top: 15,
                  left: 25,
                  bottom: 15,
                ),
                prefixIcon: Icon(Icons.lock, color: Color(0xff31aecb)),
                hintText: 'Password',
                hintStyle: TextStyle(color: Colors.black38)),
            validator: (value) {
              RegExp regex = new RegExp(r'^.{6,}$');
              if (value!.isEmpty) {
                return 'Password is required for login';
              }
              if (!regex.hasMatch(value)) {
                return 'Please Enter a Valid Password';
              }
            },
            onSaved: (value) {
              passwordController.text = value!;
            },
            textInputAction: TextInputAction.done,
          ),
        )
      ],
    );
  }

  Widget buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 35),
      width: double.infinity,
      child: RaisedButton(
          elevation: 5,
          onPressed: () async {
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
                email: emailController.text, password: passwordController.text);
            setState(() {});
          },
          padding: EdgeInsets.all(15),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          color: Colors.white,
          child: Text(
            'LOGIN',
            style: TextStyle(
                color: Color(0xff484542),
                fontSize: 20,
                fontWeight: FontWeight.bold),
          )),
    );
  }

  Widget buildSignUpBtn() {
    return GestureDetector(
      onTap: () => {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SignUp()))
      },
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
              text: 'Don\'t have an Account? ',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.white)),
          TextSpan(
              text: 'Sign Up',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold))
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Form(
          key: formkey,
          child: GestureDetector(
            child: Stack(
              children: <Widget>[
                Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                          Color(0x6631aecb),
                          Color(0xff31aecb),
                          Color(0xff31aecb),
                          Color(0x6631aecb),
                        ])),
                    child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 120),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Sign In',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 50),
                          buildEmail(),
                          SizedBox(height: 40),
                          buildPassword(),
                          buildLoginBtn(),
                          buildSignUpBtn()
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
