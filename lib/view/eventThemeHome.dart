import 'package:flutter/material.dart';
import 'package:version1_0/view/event_theme.dart';
import 'package:version1_0/view/navBar.dart';

//import 'package:version1_0/view/theme_detail.dart';

class ThemeHome extends StatelessWidget {
  const ThemeHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text("Event Themes"),
      ),
      body: EventsThemePage(),
    );
  }
}
