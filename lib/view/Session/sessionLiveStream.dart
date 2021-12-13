import 'package:flutter/material.dart';
import 'package:version1_0/models/session_model.dart';
import 'package:version1_0/view/events.dart';

class SessionLive extends StatefulWidget {
  final Session session;
  const SessionLive({Key? key, required this.session}) : super(key: key);

  @override
  _SessionLiveState createState() => _SessionLiveState();
}

class _SessionLiveState extends State<SessionLive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(globalEvent.eventName),
        automaticallyImplyLeading: false,
      ),
      body: Text("Live Stream Tab"),
    );
  }
}
