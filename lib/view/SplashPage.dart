import 'package:flutter/material.dart';
// import 'package:version1_0/view/events.dart';

import 'login_page.dart';


class SplashPage extends  StatelessWidget {

@override
  Widget build(BuildContext context) {

    Future.delayed(const Duration(seconds: 2), (){
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context)=>LoginPage()));
    });

    return Container(
      //color: Colors.lightBlueAccent,
child: Stack(
  children: [
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
        ]
        )
      ),
    ),
  Align(
    alignment: Alignment.center,
     child: Image( image: new AssetImage("asset/images/usplogo.png"))
          )
        ],
      )
    );
 }
}