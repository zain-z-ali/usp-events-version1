import 'package:flutter/material.dart';
import 'package:version1_0/view/events.dart';

class EventInfo extends StatelessWidget {
  const EventInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Info'),
      ),
      body: EventsPage(),
    );
  }
}
