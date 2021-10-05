import 'package:flutter/foundation.dart';

class Event {
  final int eventID;
  final String eventName;
  final String eventTime;
  final String eventVenue;
  final String eventTheme;
  final String eventStartDate;
  final String eventEndDate;
  final String eventInformation;

  Event({
    required this.eventID,
    required this.eventName,
    required this.eventTime,
    required this.eventVenue,
    required this.eventTheme,
    required this.eventStartDate,
    required this.eventEndDate,
    required this.eventInformation,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      eventID: json['event_id'] as int,
      eventName: json['event_name'] as String,
      eventTime: json['event_time'] as String,
      eventVenue: json['event_venue'] as String,
      eventTheme: json['event_theme'] as String,
      eventStartDate: json['event_start_date'] as String,
      eventEndDate: json['event_end_date'] as String,
      eventInformation: json['even_info'] as String,
    );
  }
}
