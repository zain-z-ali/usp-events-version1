class Session {
  final int sessionID;
  final int themeID;
  final String sessionName;
  final String sessionStartTime;
  final String sessionEndTime;
  final String sessionVenue;
  final String sessionDescription;
  final String sessionDate;
  final String sessionKey;

  Session({
    required this.sessionID,
    required this.themeID,
    required this.sessionName,
    required this.sessionStartTime,
    required this.sessionEndTime,
    required this.sessionVenue,
    required this.sessionDescription,
    required this.sessionDate,
    required this.sessionKey,
  });

  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
      sessionID: json['session_id'] as int,
      themeID: json['theme_id'] as int,
      sessionName: json['session_name'] as String,
      sessionStartTime: json['session_start_time'] as String,
      sessionEndTime: json['session_end_time'] as String,
      sessionVenue: json['session_venue'] as String,
      sessionDescription: json['session_description'] as String,
      sessionDate: json['session_date'] as String,
      sessionKey: json['session_key'] as String,
    );
  }
}
