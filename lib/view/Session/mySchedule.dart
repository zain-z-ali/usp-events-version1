import 'package:flutter/material.dart';
import 'package:version1_0/view/Session/attendingSessions.dart';
import 'package:version1_0/view/Session/interestedSessions.dart';
import 'package:version1_0/view/events.dart';

class MySchedule extends StatefulWidget {
  const MySchedule({Key? key}) : super(key: key);

  @override
  _MySchedule createState() => _MySchedule();
}

class _MySchedule extends State<MySchedule> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    AttendingSession(),
    InterestedSessions(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(globalEvent.eventName),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        //iconSize: 25, //changes size of icon
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.done_all_outlined),
            label: 'Attending',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.thumb_up_alt_rounded),
            label: 'Interests',
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
