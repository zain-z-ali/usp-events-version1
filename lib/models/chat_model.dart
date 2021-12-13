class ChatMessage {
  final int senderID;
  final int receiverID;
  final String message;
  final String time;

  ChatMessage({
    required this.senderID,
    required this.receiverID,
    required this.message,
    this.time = "unknown",
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      senderID: json['senderID'] as int,
      receiverID: json['receiverID'] as int,
      message: json['message'] as String,
      time: json['created_at'] as String,
    );
  }

  Map toMap() {
    var map = new Map();
    map["senderID"] = senderID;
    map["receiverID"] = receiverID;
    map["message"] = message;

    return map;
  }
}
