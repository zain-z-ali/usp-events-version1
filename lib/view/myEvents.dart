import 'package:flutter/material.dart';
import 'package:version1_0/main.dart';
import 'package:version1_0/services/httpService_subscribedEvent.dart';
import 'package:version1_0/view/event_detail.dart';
import 'package:version1_0/models/event_model.dart';
import 'package:version1_0/view/events.dart';

void _navigateToHomePage(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => MyHomePage()));
}

class MyEventsPage extends StatefulWidget {
  @override
  _MyEventsPageState createState() => _MyEventsPageState();
}

class _MyEventsPageState extends State<MyEventsPage> {
  final HttpServiceSubscribedEventSpecific httpService =
      HttpServiceSubscribedEventSpecific();
  String eventImage =
      'https://images.unsplash.com/photo-1528731708534-816fe59f90cb?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bWluaW1hbCUyMHdoaXRlJTIwYmFja2dyb3VuZHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("USP Events"),
      ),
      body: Scaffold(
        appBar: AppBar(
          title: Text("My Events"),
          //automaticallyImplyLeading: false,
          actions: [
            Container(
              child: ElevatedButton(
                child: Text('View All Events'),
                onPressed: () => {_navigateToHomePage(context)},
              ),
            ),
          ],

          automaticallyImplyLeading: false,
        ),
        body: FutureBuilder(
          future: httpService.getSubscribedEvents(),
          builder: (BuildContext context, AsyncSnapshot<List<Event>> snapshot) {
            if (snapshot.hasData) {
              List<Event>? events = snapshot.data;
              return ListView(
                children: events!
                    .map(
                      (Event event) => Card(
                        color: Colors.lightBlue[50],
                        elevation: 3,
                        child: Column(children: [
                          //list tiles with image as background of title and info
                          Container(
                            //height: 150,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(eventImage),
                                fit: BoxFit.fitWidth,
                                alignment: Alignment.topCenter,
                              ),
                            ),
                            child: ListTile(
                              title: Text(event.eventName,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                              subtitle: Text(
                                  '${event.eventTheme} \nStarts ${event.eventStartDate} - Ends ${event.eventEndDate}',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
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
                                  globalEvent = event;
                                });
                              },
                            ),
                          ),
                          //list tiles with image on top of title and info - uncomment 67 to 91 - comment container 36 to 66
                          /*Image.network(     
                            'https://www.maxpixel.net/static/photo/1x/Minimalist-Geometric-Abstract-Wallpaper-Background-6467846.png'),*/
                          /*Image.network(
                            'https://p0.piqsels.com/preview/790/154/433/building-sky-architecture-minimal.jpg'),
                        ListTile(
                          title: Text(event.eventName,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                          subtitle: Text(
                              '${event.eventTheme} \nStarts ${event.eventStartDate} - Ends ${event.eventEndDate}',
                              style: TextStyle(fontWeight: FontWeight.bold)),
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
                        ),*/
                        ]),
                      ),
                    )
                    .toList(),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
