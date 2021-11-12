import 'package:flutter/foundation.dart';

class EventMessage {
  final int userID;
  final String time;
  //final int likes;
  //final int dislikes;
  final String text;

  EventMessage({
    required this.userID,
    required this.time,
    required this.text,
  });

  factory EventMessage.fromJson(Map<String, dynamic> json) {
    return EventMessage(
      userID: json['user_id'] as int,
      time: json['created_at'] as String,
      text: json['event_forum_message'] as String,
    );
  }
}
