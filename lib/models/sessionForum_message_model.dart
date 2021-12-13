class SessionMessage {
  final int userID;
  final int sessionID;
  final String text;
  final String time;

  SessionMessage({
    required this.userID,
    required this.sessionID,
    required this.time,
    required this.text,
  });

  factory SessionMessage.fromJson(Map<String, dynamic> json) {
    return SessionMessage(
      userID: json['user_id'] as int,
      sessionID: json['session_id'] as int,
      time: json['created_at'] as String,
      text: json['session_forum_message'] as String,
    );
  }

  Map toMap() {
    var map = new Map();
    map["user_id"] = userID;
    map["session_forum_message"] = text;
    map["session_id"] = sessionID;

    return map;
  }
}
