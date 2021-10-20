import 'package:flutter/material.dart';
import 'package:version1_0/models/schedule_model.dart';

class ScheduleInfo extends StatelessWidget {
  const ScheduleInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Event Schedules', // top of app
      theme: ThemeData(
        primarySwatch: Colors.blueGrey, // edit color here
        dividerTheme: DividerThemeData(
          thickness: 2,
          indent: 20,
          endIndent: 20,
          color: Colors.grey,
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<Schedule> _scheduleList =
      new ScheduleList(scheduleList: []).scheduleList;

  @override
  void initState() {
    // use this to populate events list
    super.initState();

    _scheduleList.add(new Schedule(
        description:
            "Optimizing DNN architectures for high speed autonomous navigation in GPS denied Environments on edge devices Optimizing DNN architectures for high speed autonomous navigation in GPS denied Environments on edge devicesOptimizing DNN architectures for high speed autonomous navigation in GPS denied Environments on edge devices",
        theme: "autonomous navigation in GPS denied",
        time: "11:00 am to 11:15 am",
        room: "Ratumakutu 2"));
    _scheduleList.add(new Schedule(
        description:
            "Optimizing DNN architectures for high speed autonomous navigation in GPS denied Environments on edge devices",
        theme: "autonomous navigation in GPS denied",
        time: "11:00 am to 11:15 am",
        room: "Ratumakutu 3"));
    _scheduleList.add(new Schedule(
        description:
            "Optimizing DNN architectures for high speed autonomous navigation in GPS denied Environments on edge devices",
        theme: "autonomous navigation in GPS denied",
        time: "11:00 am to 11:15 am",
        room: "Ratumakutu 4"));

    _scheduleList.add(new Schedule(
        description:
            "Optimizing DNN architectures for high speed autonomous navigation in GPS denied Environments on edge devices",
        theme: "autonomous navigation in GPS denied",
        time: "11:00 am to 11:15 am",
        room: "Ratumakutu 5"));

    _scheduleList.add(new Schedule(
        description:
            "Optimizing DNN architectures for high speed autonomous navigation in GPS denied Environments on edge devices",
        theme: "autonomous navigation in GPS denied",
        time: "11:00 am to 11:15 am",
        room: "Ratumakutu 6"));

    _scheduleList.add(new Schedule(
        description:
            "Optimizing DNN architectures for high speed autonomous navigation in GPS denied Environments on edge devices",
        theme:
            "autonomous navigation in GPS denied autonomous navigation in GPS denied adwdawda",
        time: "11:00 am to 11:15 am",
        room: "Ratumakutu 7"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  drawer: NavBar(),
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
                            child: Text("Schedule",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 25)))),
                    Text("Monday 3rd August 2020", //"Monday 3rd August 2020"
                        style: TextStyle(color: Colors.white, fontSize: 15)),
                  ])),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            for (var schedule in _scheduleList)
              buildScheduleContainer(schedule),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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

  Widget buildScheduleContainer(Schedule schedule) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black, blurRadius: 10, offset: Offset(-4, 5))
          ],
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      // event details here
      padding: EdgeInsets.fromLTRB(20.0, 20.0, 10.0, 10.0),
      margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      height: 150.0,
      width: double.maxFinite,
      // color: Colors.transparent,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            new Text(
              "${schedule.description}",
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.start,
            ),
            new Text(
              "Time: " + "${schedule.time}",
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontSize: 14,
              ),
              textAlign: TextAlign.start,
            ),
            new Text(
              "Room: " + "${schedule.room}",
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontSize: 14,
              ),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 10),
            new Text(
              "Theme: " + "${schedule.theme}",
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontSize: 14,
              ),
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    );
  }
}
