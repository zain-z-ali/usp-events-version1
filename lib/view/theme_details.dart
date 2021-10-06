import 'package:flutter/material.dart';
import 'package:version1_0/view/event_detail.dart';
import 'package:version1_0/models/event_model.dart';
import 'package:version1_0/view/theme_forum.dart';
import '../services/httpService_events.dart';

void _navigateToThemeForum(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => ThemeForum()));
}

class ThemeDetails extends StatelessWidget {
  final HttpService_event httpService = HttpService_event();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Theme Details"),
      ),
      body: SingleChildScrollView(
        child: Card(
          color: Colors.lightBlue[50],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ListTile(
                title: Text(
                  "Theme",
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                subtitle: Text(
                  "Theme Name",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  "Session 1",
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                subtitle: Text(
                  "Session Start Time: startTime \nSession End Time: endTime\nVenue: events.eventVenue \nSession Date: Date \nSession Chair: chairName",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                  child: ElevatedButton(
                child: Text('View Forum'),
                onPressed: () => {_navigateToThemeForum(context)},
              )),
            ],
          ),
        ),
      ),
    );
  }
}
