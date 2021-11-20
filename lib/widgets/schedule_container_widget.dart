import 'package:flutter/material.dart';
import 'package:version1_0/models/schedule_model.dart';
import 'package:version1_0/view/schedule/schedule_info_view.dart';

class ScheduleContainerWidget extends StatelessWidget {
  const ScheduleContainerWidget({
    Key? key,
    required this.context,
    required this.schedule,
  }) : super(key: key);

  final BuildContext context;
  final Schedule schedule;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ScheduleInfoView(
                  schedule: schedule,
                )));
      },
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.blueGrey.shade100,
                  blurRadius: 3,
                  offset: Offset(-4, 5))
            ],
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5))),
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
      ),
    );
  }
}
