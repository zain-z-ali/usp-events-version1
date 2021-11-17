import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:version1_0/main.dart';
import 'package:version1_0/view/ForgotPassword.dart';
import 'package:version1_0/view/SignUp.dart';



class LoginPage extends StatefulWidget {
  //LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formkey = GlobalKey<FormState>();
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
              if (value!.length < 4) {
                return 'Password must be atleast 4 characters';
              }
            },
          ),
        )
      ],
    );
  }

  Widget buildRememberCb() {
    return Container(
      height: 25,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: isRememberMe,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  isRememberMe = value!;
                });
              },
            ),
          ),
          Text(
            'Remeber Me',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  Widget buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      // ignore: deprecated_member_use
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
            'LOGIN',
            style: TextStyle(
                color: Color(0xff484542),
                fontSize: 20,
                fontWeight: FontWeight.bold),
          )),
    );
  }

  Widget buildForgetPasswordBtn() {
    return GestureDetector(
        onTap: () {},
        child: Container(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () => {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => ForgotPassword()))
            },
            // padding: EdgeInsets.only(right: 0),
            child: Text(
              'Forgot Password?',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ));
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
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: Colors.white)),
          TextSpan(
              text: 'Sign Up',
              style: TextStyle(
                  color: Colors.white,
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
                          buildForgetPasswordBtn(),
                          buildRememberCb(),
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
