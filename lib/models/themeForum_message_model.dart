class ThemeMessage {
  final int userID;
  final int themeID;
  final String text;
  final String time;
  final String name;

  ThemeMessage({
    required this.userID,
    required this.themeID,
    required this.time,
    required this.text,
    required this.name,
  });

  factory ThemeMessage.fromJson(Map<String, dynamic> json) {
    return ThemeMessage(
      userID: json['user_id'] as int,
      themeID: json['theme_id'] as int,
      time: json['created_at'] as String,
      text: json['theme_forum_message'] as String,
      name: json['name'] as String,
    );
  }

  Map toMap() {
    var map = new Map();
    map["user_id"] = userID;
    map["theme_forum_message"] = text;
    map["theme_id"] = themeID;

    return map;
  }
}
