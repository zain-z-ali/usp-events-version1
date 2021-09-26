import 'package:flutter/material.dart';
import 'package:version1_0/models/event_model.dart';

class EventDetail extends StatelessWidget {
  final Event event;

  EventDetail({required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Event Details"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                Card(
                  color: Colors.lightBlue[50],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ListTile(
                        title: Text("Event Name"),
                        subtitle: Text(event.eventName),
                      ),
                      ListTile(
                        title: Text("Details"),
                        subtitle: Text(
                            "Time: ${event.eventTime} \nVenue: ${event.eventVenue} \nStart Date: ${event.eventStartDate} \nEnd Date: ${event.eventEndDate}"),
                      ),
                      ListTile(
                        title: Text("About Event"),
                        subtitle: Text(event.eventInformation),
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
