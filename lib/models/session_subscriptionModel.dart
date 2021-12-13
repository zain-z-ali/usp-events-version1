class SessionSubscription {
  final int user_id;
  final int session_id;

  SessionSubscription({
    required this.user_id,
    required this.session_id,
  });

  factory SessionSubscription.fromJson(Map<String, dynamic> json) {
    return SessionSubscription(
      user_id: json['user_id'] as int,
      session_id: json['session_id'] as int,
    );
  }

  Map toMap() {
    var map = new Map();
    map["user_id"] = user_id;
    map["session_id"] = session_id;
    return map;
  }
}
