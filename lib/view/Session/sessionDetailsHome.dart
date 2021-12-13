import 'package:flutter/material.dart';
import 'package:version1_0/models/session_model.dart';
import 'package:version1_0/view/Session/sessionDetails.dart';
import 'package:version1_0/view/Session/sessionForum.dart';
import 'package:version1_0/view/Session/sessionLiveStream.dart';

class SessionInfo extends StatefulWidget {
  final Session session;

  const SessionInfo({Key? key, required this.session}) : super(key: key);

  @override
  _SessionInfo createState() => _SessionInfo();
}

class _SessionInfo extends State<SessionInfo> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      SessionDetail(session: widget.session),
      SessionLive(session: widget.session),
      SessionForum(
        session: widget.session,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Session Information"),
        //automaticallyImplyLeading: false,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        //iconSize: 25, //changes size of icon
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.info_rounded),
            label: 'Session Details',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.live_tv_rounded),
            label: 'Livestream',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.forum_rounded),
            label: 'Session Forum',
            backgroundColor: Colors.green,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedIconTheme: IconThemeData(size: 27),
        selectedItemColor: Colors.blue[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
