import 'package:flutter/material.dart';
import 'package:version1_0/view/Session/allSessions.dart';
import 'package:version1_0/view/Session/mySchedule.dart';
import 'package:version1_0/view/navBar.dart';

class Session extends StatefulWidget {
  const Session({Key? key}) : super(key: key);

  @override
  _SessionState createState() => _SessionState();
}

class _SessionState extends State<Session> {
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
              Tab(text: 'All Sessions', icon: Icon(Icons.schedule_rounded)),
              Tab(text: 'My Schedule', icon: Icon(Icons.alarm_on_rounded)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            AllSessions(),
            MySchedule(),
          ],
        ),
      ),
    );
  }
}
