import 'package:flutter/material.dart';
import 'package:version1_0/view/event_detail.dart';
import 'package:version1_0/models/event_model.dart';
import '../services/httpService_events.dart';

int globalEventId = 0;

class EventsPage extends StatefulWidget {
  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  final HttpService_event httpService = HttpService_event();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upcoming Events"),
        automaticallyImplyLeading: false, // removes back button
      ),
      body: FutureBuilder(
        future: httpService.getEvents(),
        builder: (BuildContext context, AsyncSnapshot<List<Event>> snapshot) {
          if (snapshot.hasData) {
            List<Event>? events = snapshot.data;
            return ListView(
              children: events!
                  .map(
                    (Event event) => Card(
                        color: Colors.lightBlue[50],
                        child: ListTile(
                          title: Text(event.eventName),
                          subtitle: Text(
                              '${event.eventTheme} \nStarts ${event.eventStartDate} - Ends ${event.eventEndDate}'),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => EventDetail(
                                  event: event,
                                ),
                              ),
                            );
                            setState(() {
                              globalEventId = event.eventID;
                            });
                          },
                        )),
                  )
                  .toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
