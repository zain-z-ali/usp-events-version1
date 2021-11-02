import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:version1_0/view/SIgnUp.dart';

class ForgotPassword extends StatefulWidget {
  //LoginPage({Key? key}) : super(key: key);

  @override
  _ForgotPassword createState() => _ForgotPassword();
}

class _ForgotPassword extends State<ForgotPassword> {
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
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.email, color: Color(0xff31aecb)),
                hintText: 'Email/Username',
                hintStyle: TextStyle(color: Colors.black38)),
            //validator: (String? value) {
            //if (value!.isEmpty) {
            // return 'Please enter an email';
            //}
            //if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
            //.hasMatch(value)) {
            //return 'Please enter a valid Email';
            //}
            //return null;
            //},
          ),
        )
      ],
    );
  }

  Widget buildResetPasswordBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      // ignore: deprecated_member_use
      child: RaisedButton(
          elevation: 5,
          onPressed: () => {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => SignUp()))
              },
          padding: EdgeInsets.all(15),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          color: Colors.white,
          child: Text(
            'REQUEST PASSWORD RESET',
            style: TextStyle(
                color: Color(0xff484542),
                fontSize: 15,
                fontWeight: FontWeight.bold),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
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
                          'Forgot your Password?',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 50),
                        buildEmail(),
                        SizedBox(height: 40),
                        buildResetPasswordBtn(),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
