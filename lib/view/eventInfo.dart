import 'package:flutter/material.dart';
import 'package:version1_0/view/events.dart';
import 'package:version1_0/view/navBar.dart';

class EventInfo extends StatelessWidget {
  const EventInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text('Event Info'),
      ),
      body: EventsPage(),
    );
  }
}
