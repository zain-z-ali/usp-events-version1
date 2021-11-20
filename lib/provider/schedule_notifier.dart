import 'package:flutter/cupertino.dart';
import 'package:version1_0/models/schedule_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

enum ScheduleListState { LOADING, SUCCESS, ERROR }

class ScheduleNotifier extends ChangeNotifier {
  late ScheduleList scheduleList;
  ScheduleListState? scheduleListState;

  ScheduleNotifier() {
    getSchedules();
  }

  setScheduleListState(ScheduleListState scheduleListState) async {
    this.scheduleListState = scheduleListState;
    // notifyListeners();
  }

  getSchedules() async {
    http.Response response;
    var data;
    setScheduleListState(ScheduleListState.LOADING);
    try {
      response = await http.get(
        Uri.parse("http://10.0.2.2:8000/api/schedules"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          "x-requested-with": "XMLHttpRequest",
        },
      );

      if (response.statusCode == 200) {
        data = json.decode(response.body);

        scheduleList = new ScheduleList.fromJson(data['schedules']);
        setScheduleListState(ScheduleListState.SUCCESS);
      } else {
        setScheduleListState(ScheduleListState.ERROR);
      }

      notifyListeners();
    } catch (error) {
      setScheduleListState(ScheduleListState.ERROR);
      print(error);
    }
  }
}
