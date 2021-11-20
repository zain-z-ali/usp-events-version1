import 'package:flutter/material.dart';
import 'package:version1_0/models/schedule_model.dart';
import 'package:version1_0/widgets/schedule_container_widget.dart';

class MyScheduleView extends StatefulWidget {
  const MyScheduleView({
    Key? key,
  }) : super(key: key);

  @override
  _MyScheduleViewState createState() => _MyScheduleViewState();
}

class _MyScheduleViewState extends State<MyScheduleView> {
  late List<Schedule> _scheduleList =
      new ScheduleList(scheduleList: []).scheduleList;

  @override
  void initState() {
    super.initState();

    _scheduleList.add(new Schedule(
        name: "Schedule 22",
        description:
            "Explaining Black-box Machine Learning Models Using Interpretable Surrogates",
        theme: "Session 3 Learning",
        time: "11:00 am to 11:15 am",
        date: "27/08/21",
        room: "Ratumakutu 4"));

    _scheduleList.add(new Schedule(
        name: "Schedule 3",
        description:
            "The development of Hypersonic - Sub Orbital Weaponry and the Future of Space Warfare",
        theme: "Session 4 Space Force",
        time: "11:00 am to 11:15 am",
        date: "27/08/21",
        room: "Ratumakutu 5"));

    _scheduleList.add(new Schedule(
        name: "Schedule 4",
        description:
            " The Global Silicon Chip Shortage and the Unforseen Impact on National Security ",
        theme: "Session 5 National Defense",
        time: "11:00 am to 11:15 am",
        date: "27/08/21",
        room: "Ratumakutu 6"));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var schedule in _scheduleList)
          ScheduleContainerWidget(
            schedule: schedule,
            context: context,
          ),
      ],
    );
  }
}
