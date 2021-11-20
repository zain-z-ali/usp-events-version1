import 'package:flutter/material.dart';
import 'package:version1_0/models/schedule_model.dart';

class ScheduleInfoView extends StatefulWidget {
  final Schedule schedule;

  const ScheduleInfoView({Key? key, required this.schedule}) : super(key: key);

  @override
  _ScheduleInfoViewState createState() => _ScheduleInfoViewState();
}

class _ScheduleInfoViewState extends State<ScheduleInfoView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(schedule.name.toString()),
      // ),
      body: CustomScrollView(
        slivers: <Widget>[
          //2
          SliverAppBar(
            expandedHeight: 250.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(widget.schedule.name.toString(), textScaleFactor: 1),
              // background: Image.asset(
              //   'assets/images/beach.png',
              //   fit: BoxFit.fill,
              // ),
            ),
          ),
          //3
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.calendar_today),
                      Text(widget.schedule.date.toString()),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      Text(widget.schedule.time.toString()),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Colors.blueGrey.withOpacity(0.4)),
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Text(widget.schedule.theme.toString()),
            ),
          ),

          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Text(
                widget.schedule.description.toString(),
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Colors.blueGrey.withOpacity(0.4)),
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.location_pin),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.schedule.room.toString(),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
