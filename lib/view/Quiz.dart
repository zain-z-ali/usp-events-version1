import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
//import package file manually

class SubmitQuiz extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
     return SubmitQuizState();
  }
}

class SubmitQuizState extends State<SubmitQuiz>{

  TextEditingController response1ctl = TextEditingController();
  TextEditingController response2ctl = TextEditingController();
  TextEditingController response3ctl = TextEditingController();
  TextEditingController response4ctl = TextEditingController();
  //text controller for TextField

  late bool error, sending, success;
  late String msg;

  String phpurl = "http://192.168.8.134/eventsmanager%20-%20portal/public/insertquiz.php";
  // do not use http://localhost/ for your local
  // machine, Android emulation do not recognize localhost
  // insted use your local ip address or your live URL
  // hit "ipconfig" on Windows or  "ip a" on Linux to get IP Address

  @override
  void initState() {
      error = false;
      sending = false;
      success = false;
      msg = "";
      super.initState();
  }

  Future<void> sendData() async {

     var res = await http.post(Uri.parse(phpurl), body: { 
          "response_one": response1ctl.text,
          "response_two": response2ctl.text,
          "response_three": response3ctl.text,
          "response_four": response4ctl.text,
      }); //sending post request with header data

     if (res.statusCode == 200) {
       print(res.body); //print raw response on console
       var data = json.decode(res.body); //decoding json to array
       if(data["error"]){
          setState(() { //refresh the UI when error is recieved from server
             sending = false;
             error = true;
             msg = data["message"]; //error message from server
          });
       }else{
         
         response1ctl.text = "";
         response2ctl.text = "";
         response3ctl.text = "";
         response4ctl.text = "";
         //after write success, make fields empty

          setState(() {
             sending = false;
             success = true; //mark success and refresh UI with setState
          });
       }
       
    }else{
       //there is error
        setState(() {
            error = true;
            msg = "Error during sending data.";
            sending = false;
            //mark error and refresh UI with setState
        });
    }
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
        appBar: AppBar(
           title:Text("Quiz"),
           backgroundColor:Colors.blueGrey
        ), //appbar

        body: SingleChildScrollView( //enable scrolling, when keyboard appears,
                                   // hight becomes small, so prevent overflow
           child:Container( 
              padding: EdgeInsets.all(20),
              child: Column(children: <Widget>[
                
                Container( 
                  child:Text(error?msg:"Please fill in the quiz questions"), 
                  //if there is error then sho msg, other wise show text message
                ),

                Container( 
                   child:Text(success?"Submitted Successfullty":"send data"),
                   //is there is success then show "Write Success" else show "send data"
                ),

                Container( 
                  child: TextField( 
                     controller: response1ctl,
                     decoration: InputDecoration(
                        labelText:"Who is USP's VC?",
                        hintText:"Enter name of Vice Chancellor",
                     ),
                  )
                ), //text input for name

                Container( 
                  child: TextField( 
                     controller: response2ctl,
                     decoration: InputDecoration(
                        labelText:"Where is his/hers office located?",
                        hintText:"Enter location:",
                     ),
                  )
                ), //text input for address

                Container( 
                  child: TextField(
                     controller: response3ctl,
                     decoration: InputDecoration(
                        labelText:"What was the theme of the event you attended?",
                        hintText:"Enter theme:",
                     ),
                  )
                ), //text input for class

                Container( 
                  child: TextField( 
                     controller: response4ctl,
                     decoration: InputDecoration(
                        labelText:"Student ID:",
                        hintText:"Enter Student ID",
                     ),
                  )
                ), //text input for roll no

                Container( 
                   margin: EdgeInsets.only(top:20),
                   child:SizedBox( 
                     width: double.infinity,
                     child:ElevatedButton(
                        onPressed:(){ //if button is pressed, setstate sending = true, so that we can show "sending..."
                          setState(() {
                             sending = true;
                          });
                          sendData();
                        },
                        child: Text(
                          sending?"Submitting...":"SUBMIT QUIZ",
                          //if sending == true then show "Sending" else show "SEND DATA";
                        ), 
                        style: ElevatedButton.styleFrom(
                        primary: Colors.blueGrey,
                        shadowColor: Colors.black
                        // colorBrightness: Brightness.dark,
                        )
                      ),
                        //background of button is darker color, so set brightness to dark
                     )
                   )
              ],)
           )
        ),
     );
  }
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<bool>('error', error));
  }
}