class ScheduleList {
  final List<Schedule> scheduleList;

  ScheduleList({required this.scheduleList});

  factory ScheduleList.fromJson(List<dynamic> parsedJson) {
    List<Schedule> scheduleList =
        parsedJson.map((i) => Schedule.fromJson(i)).toList();

    return new ScheduleList(scheduleList: scheduleList);
  }
}

class Schedule {
  String? description, time, room, theme;

  Schedule({this.description, this.time, this.room, this.theme});

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      description: json['id'],
      time: json['category_name'],
      room: json['created_at'],
      theme: json['updated_at'],
    );
  }
}
