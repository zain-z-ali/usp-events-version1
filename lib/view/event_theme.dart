import 'package:flutter/material.dart';
import 'package:version1_0/view/navBar.dart';
import 'package:version1_0/view/theme_details.dart';

void _navigateToThemeDetails(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => ThemeDetails()));
}

class EventsThemePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text("Event Themes"),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          ListTile(
            /// first tile
            //leading: Icon(Icons.home),
            title: Text('Theme 1 | Theme Name'),
            onTap: () => {_navigateToThemeDetails(context)},
          ),
          Divider(height: 0.1, thickness: 0.5, indent: 20, endIndent: 20),
          ListTile(
            //leading: Icon(Icons.info),
            title: Text('Theme 2 | Theme Name'),
            //onTap: () => {_navigateToEventInfo(context)},
          ),
          Divider(height: 0.1, thickness: 0.5, indent: 20, endIndent: 20),
          ListTile(
            //leading: Icon(Icons.info),
            title: Text('Theme 3 | Theme Name'),
            //onTap: () => {_navigateToEventInfo(context)},
          ),
          Divider(height: 0.1, thickness: 0.5, indent: 20, endIndent: 20),
          ListTile(
            //leading: Icon(Icons.info),
            title: Text('Theme 4 | Theme Name'),
            //onTap: () => {_navigateToEventInfo(context)},
          ),
        ],
      ),
    );
  }
}
