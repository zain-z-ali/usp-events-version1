import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:version1_0/models/session_subscriptionModel.dart';
import 'package:version1_0/models/session_model.dart';
import 'package:version1_0/services/httpService_session.dart';
import 'package:version1_0/view/events.dart';
import 'package:fluttertoast/fluttertoast.dart';

bool isAttending = false;
bool isInterested = false;

///get session theme and display
/////create http request for themes of session.id ->save and display in list tile
class SessionDetail extends StatefulWidget {
  final Session session;

  SessionDetail({required this.session});

  @override
  _SessionDetailState createState() => _SessionDetailState();
}

class _SessionDetailState extends State<SessionDetail> {
  final HttpServiceAttendingSessionPost httpAddAttendance =
      HttpServiceAttendingSessionPost();
  final HttpServiceRemoveAttendance httpRemoveAttendace =
      HttpServiceRemoveAttendance();
  final HttpServiceInterestedSessionPost httpAddInterest =
      HttpServiceInterestedSessionPost();
  final HttpServiceRemoveInterest httpRemoveInterest =
      HttpServiceRemoveInterest();

  int userID = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(globalEvent.eventName),
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Column(
              children: <Widget>[
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://images.unsplash.com/photo-1528731708534-816fe59f90cb?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bWluaW1hbCUyMHdoaXRlJTIwYmFja2dyb3VuZHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80'),
                              fit: BoxFit.fitWidth,
                              alignment: Alignment.topCenter,
                            ),
                            //shape: BoxShape.circle,
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(widget.session.sessionName,
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold)),
                          )),
                      ListTile(
                        title: Text("Session ID"),
                        subtitle: Text("${widget.session.sessionID}"),
                      ),
                      ListTile(
                        title: Text("Session Venue"),
                        subtitle: Text("${widget.session.sessionVenue}"),
                      ),
                      ListTile(
                        title: Text("Session Date"),
                        subtitle: Text(widget.session.sessionDate),
                      ),
                      ListTile(
                        title: Text("Session Time"),
                        subtitle: Text(
                            "Start time: ${widget.session.sessionStartTime} \nEnd time:   ${widget.session.sessionEndTime}"),
                      ),
                      ListTile(
                        title: Text("Session Information"),
                        subtitle: Text("${widget.session.sessionDescription}"),
                      ),
                      Container(
                        //
                        child: Row(children: [
                          Container(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Attend this session',
                              //style: TextStyle(color: Colors.black, fontSize: 20.0),
                            ),
                          ),
                          FlutterSwitch(
                            width: 35.0,
                            height: 18.0,
                            valueFontSize: 12.0,
                            toggleSize: 16.0,
                            value: isAttending,
                            borderRadius: 20.0,
                            padding: 2.0,
                            showOnOff: false,
                            activeColor: Colors.lightGreen,
                            onToggle: (val) {
                              setState(() {
                                isAttending = val;
                              });

                              if (isAttending == true) {
                                SessionSubscription newAttend =
                                    new SessionSubscription(
                                  user_id:
                                      userID, ///////////////////change user ID to dynamic with authentication
                                  session_id: widget.session.sessionID,
                                  //attend: 1,
                                );
                                //if (messageGlobalKey.currentState!.validate()) {
                                httpAddAttendance.createAttendingSessionPost(
                                    body: newAttend.toMap());
                                Fluttertoast.showToast(
                                    msg: "Attendance successfully added",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity
                                        .BOTTOM); // Also possible "TOP" and "CENTER"
                              } //end of if
                              else {
                                httpRemoveAttendace.removeAttendance(
                                    userID, widget.session.sessionID);
                                Fluttertoast.showToast(
                                    msg: "Your attendance has been removed",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM);
                              }
                            },
                          ),
                        ]),
                      ),
                      Container(
                        //
                        child: Row(children: [
                          Container(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Interested in this session',
                              //style: TextStyle(color: Colors.black, fontSize: 20.0),
                            ),
                          ),
                          FlutterSwitch(
                            width: 35.0,
                            height: 18.0,
                            valueFontSize: 12.0,
                            toggleSize: 16.0,
                            value: isInterested,
                            borderRadius: 20.0,
                            padding: 2.0,
                            showOnOff: false,
                            activeColor: Colors.lightGreen,
                            onToggle: (val2) {
                              setState(() {
                                isInterested = val2;
                              });

                              if (isInterested == true) {
                                SessionSubscription newInterest =
                                    new SessionSubscription(
                                  user_id:
                                      userID, ///////////////////change user ID to dynamic with authentication
                                  session_id: widget.session.sessionID,
                                  //attend: 1,
                                );
                                //if (messageGlobalKey.currentState!.validate()) {
                                httpAddInterest.createInterestedSessionPost(
                                    body: newInterest.toMap());
                                Fluttertoast.showToast(
                                    msg: "Your interest has been added",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM);
                              } //end of if
                              else {
                                httpRemoveInterest.removeInterest(
                                    userID, widget.session.sessionID);
                                Fluttertoast.showToast(
                                    msg: "Your interest has been removed",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM);
                              }
                            },
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
