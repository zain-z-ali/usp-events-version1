import 'package:flutter/material.dart';
import 'package:version1_0/models/event_model.dart';
import 'package:version1_0/services/httpService_events.dart';
import 'package:version1_0/view/events.dart';
import 'package:version1_0/view/messages.dart';
import 'package:version1_0/view/navBar.dart';
import 'package:flutter_switch/flutter_switch.dart';

//import 'event_detail.dart';

bool status = false;
/*class EventInfo extends StatefulWidget {
  @override
  _EventInfoState createState() => _EventInfoState();
}*/

class EventInfo extends StatefulWidget {
  @override
  _EventInfoState createState() => _EventInfoState();
}

class _EventInfoState extends State<EventInfo> {
  //bool status = false;
  final HttpService_eventSpecific httpService = HttpService_eventSpecific();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          title: Text('Event Info'),
        ),
        body: FutureBuilder<Event>(
          future: httpService.getSpecificEvents(),
          builder: (BuildContext context, AsyncSnapshot<Event> snapshot) {
            if (globalEventId == 0) {
              return NoEventSelected();
            } else if (snapshot.hasData) {
              Event? events = snapshot.data;
              return SingleChildScrollView(
                child: Card(
                  //color: Colors.lightBlue[50],
                  elevation: 3,
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
                            child: Text(events!.eventName,
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold)),
                          )),
                      /* ListTile(
                        title: Text("Event Name"),
                        subtitle: Text(events.eventName),
                      ),*/
                      ListTile(
                        title: Text("Details"),
                        subtitle: Text(
                            "Time: ${events.eventTime} \nVenue: ${events.eventVenue} \nStart Date: ${events.eventStartDate} \nEnd Date: ${events.eventEndDate}"),
                      ),
                      ListTile(
                        title: Text("About Event"),
                        subtitle: Text(events.eventInformation),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        child: Row(children: [
                          Container(
                            padding: const EdgeInsets.all(8.0),
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
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}

//body: new ElevatedButton(
 //       onPressed: () => httpService.getSpecificEvents(),
 //       child: new Text('Press Button'),
 //     ),
 //   );
//  }
//}