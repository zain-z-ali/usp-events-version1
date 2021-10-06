import 'package:flutter/material.dart';
import 'package:version1_0/models/event_model.dart';
import 'package:version1_0/services/httpService_events.dart';
import 'package:version1_0/view/events.dart';
import 'package:version1_0/view/navBar.dart';

class EventInfo extends StatelessWidget {
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