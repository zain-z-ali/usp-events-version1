import 'package:flutter/foundation.dart';

class Theme {
  final int themeID;
  final String themeName;
  final String eventName;
  /*final String eventTime;
  final String eventVenue;
  final String eventTheme;
  final String eventStartDate;
  final String eventEndDate;
  final String eventInformation;*/

  Theme({
    required this.themeID,
    required this.themeName,
    required this.eventName,
    /*required this.eventTime,
    required this.eventVenue,
    required this.eventTheme,
    required this.eventStartDate,
    required this.eventEndDate,
    required this.eventInformation,*/
  });

  factory Theme.fromJson(Map<String, dynamic> json) {
    return Theme(
      themeID: json['id'] as int,
      themeName: json['theme_name'] as String,
      eventName: json['event_name'] as String,
      /*eventTime: json['event_time'] as String,
      eventVenue: json['event_venue'] as String,
      eventTheme: json['event_theme'] as String,
      eventStartDate: json['event_start_date'] as String,
      eventEndDate: json['event_end_date'] as String,
      eventInformation: json['even_info'] as String,*/
    );
  }
}
