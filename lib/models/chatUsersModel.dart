class ChatUsers {
  int id;
  String name;
  /*String messageText;
  String imageURL;
  String time;*/

  ChatUsers({
    required this.name,
    required this.id,
    /*required this.messageText,
      required this.imageURL,
      required this.time*/
  });

  factory ChatUsers.fromJson(Map<String, dynamic> json) {
    return ChatUsers(
      name: json['name'] as String,
      id: json['id'] as int,
      /*receiverID: json['receiverID'] as int,
      message: json['message'] as String,
      time: json['created_at'] as String,*/
    );
  }
}
