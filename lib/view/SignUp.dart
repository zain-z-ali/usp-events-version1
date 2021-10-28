import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:version1_0/main.dart';
import 'package:version1_0/view/login_page.dart';

class SignUp extends StatefulWidget {
  //LoginPage({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formkey = GlobalKey<FormState>();
  //TextController to read text entered in text field
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  Widget buildName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Name',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
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
            keyboardType: TextInputType.name,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(
                  top: 15,
                  left: 25,
                  bottom: 15,
                ),
                prefixIcon: Icon(Icons.person, color: Color(0xff31aecb)),
                hintText: 'Name',
                hintStyle: TextStyle(color: Colors.black38)),
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'Please enter your name';
              }
              if (value.length < 2) {
                return 'Username must be atleast 4 characters';
              }
            },
          ),
        ),
      ],
    );
  }

  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email Address',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
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
                hintText: 'Email Adress',
                hintStyle: TextStyle(color: Colors.black38)),
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'Please enter an email';
              }
              if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                  .hasMatch(value)) {
                return 'Please enter a valid Email';
              }
              return null;
            },
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
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'Please a Enter Password';
              }
              if (value.length < 4) {
                return 'Password must be atleast 4 characters';
              }
            },
          ),
        )
      ],
    );
    ;
  }

  Widget buildConfirmPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Confirm Password',
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
                hintText: 'Confirm Password',
                hintStyle: TextStyle(color: Colors.black38)),
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'Please re-enter password';
              }
              print(password.text);

              print(confirmpassword.text);

              if (password.text != confirmpassword.text) {
                return "Password does not match";
              }
            },
          ),
        )
      ],
    );
    ;
  }

  Widget buildLogInBtn() {
    return GestureDetector(
      onTap: () => {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage()))
      },
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
              text: 'Already have a Account? ',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: Colors.white)),
          TextSpan(
              text: 'Log In',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold))
        ]),
      ),
    );
  }

  Widget buildSignBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: RaisedButton(
          elevation: 5,
          onPressed: () {
            if (formkey.currentState!.validate()) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => MyHomePage()));

              return;
            } else {
              print("UnSuccessfull");
            }
          },
          padding: EdgeInsets.all(15),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          color: Colors.white,
          child: Text(
            'SIGN UP',
            style: TextStyle(
                color: Color(0xff484542),
                fontSize: 20,
                fontWeight: FontWeight.bold),
          )),
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
                        EdgeInsets.symmetric(horizontal: 25, vertical: 100),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Sign Up',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 30),
                        buildName(),
                        SizedBox(height: 30),
                        buildEmail(),
                        SizedBox(height: 30),
                        buildPassword(),
                        SizedBox(height: 30),
                        buildConfirmPassword(),
                        SizedBox(height: 20),
                        // buildRememberCb(),
                        buildLogInBtn(),
                        SizedBox(height: 30),
                        buildSignBtn(),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    ));
  }
}
