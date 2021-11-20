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
  String? name, description, time,date, room, theme;

  Schedule({this.name,this.date, this.description, this.time, this.room, this.theme});

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      name: json['name'],
      description: json['description'],
      time: json['time'],
      date: json['date'],
      room: json['room'],
      theme: json['theme'],
    );
  }
}
