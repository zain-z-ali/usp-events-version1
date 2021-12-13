class EventMessage {
  final int userID;
  final int eventID;
  final String text;
  final String time;

  EventMessage({
    required this.userID,
    required this.eventID,
    required this.time,
    required this.text,
  });

  factory EventMessage.fromJson(Map<String, dynamic> json) {
    return EventMessage(
      userID: json['user_id'] as int,
      eventID: json['event_id'] as int,
      time: json['created_at'] as String,
      text: json['event_forum_message'] as String,
    );
  }

  Map toMap() {
    var map = new Map();
    map["user_id"] = userID;
    map["event_forum_message"] = text;
    map["event_id"] = eventID;

    return map;
  }
}
