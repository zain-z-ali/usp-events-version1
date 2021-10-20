import 'package:flutter/material.dart';
import 'package:version1_0/models/event_model.dart';
import 'package:version1_0/services/httpService_events.dart';
import 'package:version1_0/view/events.dart';
import 'package:version1_0/view/navBar.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'event_detail.dart';

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
            if (snapshot.hasData) {
              Event? events = snapshot.data;
              return SingleChildScrollView(
                child: Card(
                  color: Colors.lightBlue[50],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ListTile(
                        title: Text("Event Name"),
                        subtitle: Text(events!.eventName),
                      ),
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
                        child: FlutterSwitch(
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
                      ),
                      Text(
                        'Subscribe to event',
                        //style: TextStyle(color: Colors.black, fontSize: 20.0),
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