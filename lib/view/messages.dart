import 'package:flutter/material.dart';
import 'package:version1_0/main.dart';
import '../services/httpService_theme.dart';
import 'package:version1_0/view/navBar.dart';

void _navigateToHomePage(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => MyHomePage()));
}

class NoEventSelected extends StatelessWidget {
  final HttpService_theme httpService = HttpService_theme();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.red[100],
      elevation: 3,
      child: ListTile(
        title: Text(
            "⚠️ No event selected. \nPlease select an event on the Home page to view details"),
        onTap: () => {_navigateToHomePage(context)},
      ),
    );
  }
}

class ThemesNotAdded extends StatelessWidget {
  final HttpService_theme httpService = HttpService_theme();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orange[100],
      elevation: 3,
      child: ListTile(
        leading: Icon(Icons.info_outline_rounded),
        title: Text("Sorry. No Theme information is available for this event."),
        onTap: () => {_navigateToHomePage(context)},
      ),
    );
  }
}

class SpeakersNotAdded extends StatelessWidget {
  final HttpService_theme httpService = HttpService_theme();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orange[100],
      elevation: 3,
      child: ListTile(
        leading: Icon(Icons.info_outline_rounded),
        title:
            Text("Sorry. No Speaker information is available for this event."),
        onTap: () => {_navigateToHomePage(context)},
      ),
    );
  }
}

class SessionsNotAdded extends StatelessWidget {
  final HttpService_theme httpService = HttpService_theme();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orange[100],
      elevation: 3,
      child: ListTile(
        leading: Icon(Icons.info_outline_rounded),
        title:
            Text("Sorry. No Session information is available for this event."),
        onTap: () => {_navigateToHomePage(context)},
      ),
    );
  }
}
