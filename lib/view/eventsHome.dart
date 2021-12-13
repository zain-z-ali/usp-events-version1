import 'package:flutter/material.dart';
import 'package:version1_0/view/events.dart';
import 'package:version1_0/view/myEvents.dart';
import 'package:version1_0/view/navBar.dart';

class EventsHome extends StatefulWidget {
  const EventsHome({Key? key}) : super(key: key);

  @override
  _EventsHomeState createState() => _EventsHomeState();
}

class _EventsHomeState extends State<EventsHome> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          title: Text("Event Schedule"),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Upcoming Events', icon: Icon(Icons.schedule_rounded)),
              Tab(text: 'My Events', icon: Icon(Icons.alarm_on_rounded)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            EventsPage(),
            MyEventsPage(),
          ],
        ),
      ),
    );
  }
}
