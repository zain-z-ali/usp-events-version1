import 'package:flutter/material.dart';
import 'package:version1_0/models/event_model.dart';
import 'package:version1_0/view/navBar.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:flutter_switch/flutter_switch.dart';

bool status = false;

class EventDetail extends StatefulWidget {
  final Event event;

  EventDetail({required this.event});

  @override
  _EventDetailState createState() => _EventDetailState();
}

class _EventDetailState extends State<EventDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          title: Text("Event Details"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Column(
              children: <Widget>[
                Card(
                  color: Colors.lightBlue[50],
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
                            child: Text(widget.event.eventName,
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold)),
                          )),
                      /*ListTile(
                        title: Text(widget.event.eventName),
                        subtitle: Text("Event Name"),
                      ),*/
                      ListTile(
                        title: Text("Details"),
                        subtitle: Text(
                            "Time: ${widget.event.eventTime} \nVenue: ${widget.event.eventVenue} \nStart Date: ${widget.event.eventStartDate} \nEnd Date: ${widget.event.eventEndDate}"),
                      ),
                      ListTile(
                        title: Text("About Event"),
                        subtitle: Text(widget.event.eventInformation),
                      ),
                      SizedBox(
                        height: 18.0,
                      ),
                      /*Container(
                        child: Switch(
                          value: status,
                          onChanged: (value) {
                            //print("Subscribe to event");
                            setState(() {
                              status = value;
                              print(status);
                            });
                          },
                          activeTrackColor: Colors.lightGreenAccent,
                          activeColor: Colors.green,
                        ),
                      ),*/
                      Container(
                        child: Row(children: [
                          Container(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Subscribe to event',
                              //style: TextStyle(color: Colors.black, fontSize: 20.0),
                            ),
                          ),
                          FlutterSwitch(
                            width: 35.0,
                            height: 18.0,
                            valueFontSize: 12.0,
                            toggleSize: 16.0,
                            value: status,
                            borderRadius: 20.0,
                            padding: 2.0,
                            showOnOff: false,
                            activeColor: Colors.lightGreen,
                            onToggle: (val) {
                              setState(() {
                                status = val;
                              });
                            },
                          ),
                        ]),
                      ),
                      SizedBox(
                        height: 15.0,
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
