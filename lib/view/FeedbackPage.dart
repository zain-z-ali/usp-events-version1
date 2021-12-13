import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
//import package file manually

class SubmitFeedback extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
     return SubmitFeedbackState();
  }
}

class SubmitFeedbackState extends State<SubmitFeedback>{

  TextEditingController eventnamectl = TextEditingController();
  TextEditingController sessionnamectl = TextEditingController();
  TextEditingController feedbackctl = TextEditingController();
  TextEditingController suggestionsctl = TextEditingController();
  //text controller for TextField

  late bool error, sending, success;
  late String msg;

  String phpurl = "http://192.168.8.134/eventsmanager%20-%20portal/public/insertfeedback.php";
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
          "event_name": eventnamectl.text,
          "session_name": sessionnamectl.text,
          "feedback": feedbackctl.text,
          "suggestions": suggestionsctl.text,
      }); //sending post request with header data

     if (res.statusCode == 200) {
       print(res.body); //print raw response on console
       var data = await json.decode(res.body); //decoding json to array
       if(data["error"]){
          setState(() { //refresh the UI when error is recieved from server
             sending = false;
             error = true;
             msg = data["message"]; //error message from server
          });
       }else{
         
         eventnamectl.text = "";
         sessionnamectl.text = "";
         feedbackctl.text = "";
         suggestionsctl.text = "";
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
           title:Text("Feedback"),
           backgroundColor:Colors.blueGrey
        ), //appbar

        body: SingleChildScrollView( //enable scrolling, when keyboard appears,
                                   // hight becomes small, so prevent overflow
           child:Container( 
              padding: EdgeInsets.all(20),
              child: Column(children: <Widget>[
                
                Container( 
                  child:Text(error?msg:"Please fill in your feedback below."), 
                  //if there is error then sho msg, other wise show text message
                ),

                Container( 
                   child:Text(success?"Submitted Successfullty":"Pending submission."),
                   //is there is success then show "Write Success" else show "send data"
                ),

                Container( 
                  child: TextField( 
                     controller: eventnamectl,
                     decoration: InputDecoration(
                        labelText:"What was the event you attended?",
                        hintText:"Enter event name:",
                     ),
                  )
                ), //text input for name

                Container( 
                  child: TextField( 
                     controller: sessionnamectl,
                     decoration: InputDecoration(
                        labelText:"Which session did you join",
                        hintText:"Enter session:",
                     ),
                  )
                ), //text input for address

                Container( 
                  child: TextField(
                     controller: feedbackctl,
                     decoration: InputDecoration(
                        labelText:"What did you like about the event/session?",
                        hintText:"",
                     ),
                  )
                ), //text input for class

                Container( 
                  child: TextField( 
                     controller: suggestionsctl,
                     decoration: InputDecoration(
                        labelText:"Suggestions:",
                        hintText:"What can be improved?",
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
                          sending?"Submitting...":"SUBMIT FEEDBACK",
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