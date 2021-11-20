import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:version1_0/models/schedule_model.dart';
import 'package:version1_0/view/schedule/schedule_info_view.dart';
import 'package:version1_0/widgets/schedule_container_widget.dart';

import 'all_schedule_view.dart';
import 'my_schedule_view.dart';

class ScheduleMainView extends StatefulWidget {
  ScheduleMainView({Key? key}) : super(key: key);

  @override
  _ScheduleMainViewState createState() => _ScheduleMainViewState();
}

class _ScheduleMainViewState extends State<ScheduleMainView> {
  late List<Schedule> _scheduleList =
      new ScheduleList(scheduleList: []).scheduleList;
  int _selectedIndex = 0;
  String _appBarTabTitle = "      Schedule";

  @override
  void initState() {
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 1) {
        _appBarTabTitle = "      My Schedule";
      } else {
        _appBarTabTitle = "      Schedule";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 100),
        child: AppBar(
          backgroundColor: Colors.blueGrey,
          flexibleSpace: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(_appBarTabTitle,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 25)))),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(Jiffy(DateTime.now()).format("do MMMM yyyy"),
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                    ),
                  ])),
        ),
      ),
      body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: _selectedIndex == 0 ? AllScheduleView() : MyScheduleView()),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule_sharp),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event_note),
            label: 'My Schedule',
          ),
        ],
        // selectedItemColor: Colors.amber[800],
      ),

      //add another bar below schedule to show date
    );
  }
}
