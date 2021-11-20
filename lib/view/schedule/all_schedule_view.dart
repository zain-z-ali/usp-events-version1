import 'package:flutter/material.dart';
import 'package:version1_0/models/schedule_model.dart';
import 'package:version1_0/widgets/schedule_container_widget.dart';

class AllScheduleView extends StatefulWidget {
  const AllScheduleView({
    Key? key,
  }) : super(key: key);

  @override
  _AllScheduleViewState createState() => _AllScheduleViewState();
}

class _AllScheduleViewState extends State<AllScheduleView> {
  late List<Schedule> _scheduleList =
      new ScheduleList(scheduleList: []).scheduleList;

  @override
  void initState() {
    super.initState();

    _scheduleList.add(new Schedule(
        name: "Schedule 0",
        description:
        "Optimizing DNN architectures for high speed autonomous navigation in GPS denied Environments on edge devices Optimizing DNN architectures for high speed autonomous navigation in GPS denied Environments on edge devicesOptimizing DNN architectures for high speed autonomous navigation in GPS denied Environments on edge devices",
        theme: "Session 1 - Traffic and Vehicular Automation",
        time: "11:00 am to 11:15 am",
        date: "27/08/21",
        room: "Ratumakutu 1"));
    _scheduleList.add(new Schedule(
        name: "Schedule 1",
        description:
        "(SHORT) A Light-weight Context-Aware Self-Attention model for Skin Lesion Segmentation",
        theme: "Session 2 - Biometrics and Bioformatics",
        time: "11:00 am to 11:15 am",
        date: "27/08/21",
        room: "Ratumakutu 3"));
    _scheduleList.add(new Schedule(
        name: "Schedule 2",
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

    _scheduleList.add(new Schedule(
        name: "Schedule 5",
        description:
        "AI (Artificial Intelligence) The Saving Grace and the downfall of the Human Species",
        theme: "Session 6 AI",
        time: "11:00 am to 11:15 am",
        date: "27/08/21",
        room: "Ratumakutu 7"));
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
