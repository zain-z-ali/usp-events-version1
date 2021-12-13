import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:version1_0/models/chatUsersModel.dart';
import 'package:version1_0/models/chat_model.dart';
import 'package:version1_0/view/events.dart';

class HttpServiceChat {
  String chatURL = "http://10.0.2.2:8000/api/userchat/1";

  HttpServiceChat() {
    this.chatURL = "http://10.0.2.2:8000/api/userchat/1";
  }
  //final String speakersURL = "http://10.0.2.2:8000/api/themes/$event_id";

  Future<List<ChatMessage>> getChatMessages(int userID) async {
    chatURL = "http://10.0.2.2:8000/api/userchat/1/$userID";
    http.Response res = await http.get(Uri.parse(chatURL));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<ChatMessage> messages = body
          .map(
            (dynamic item) => ChatMessage.fromJson(item),
          )
          .toList();
      return messages;
    } else {
      throw Exception("Unable to retrieve messages.");
    }
  }
}

class HttpServiceChatList {
  int event_id = globalEventId;
  String chatURL = "http://10.0.2.2:8000/api/userlist/1";

  HttpServiceChatList() {
    this.chatURL = "http://10.0.2.2:8000/api/userlist/$event_id";
  }
  //final String speakersURL = "http://10.0.2.2:8000/api/themes/$event_id";

  Future<List<ChatUsers>> getChatList() async {
    http.Response res = await http.get(Uri.parse(chatURL));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<ChatUsers> users = body
          .map(
            (dynamic item) => ChatUsers.fromJson(item),
          )
          .toList();
      return users;
    } else {
      throw Exception("Unable to retrieve users.");
    }
  }
}

class HttpServiceCreateMessagePost {
  //int event_id = globalEventId;
  String eventForumURL = "http://10.0.2.2:8000/api/chat";

  HttpServiceCreateMessagePost() {
    this.eventForumURL = "http://10.0.2.2:8000/api/chat";
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

  createMessagePost({required Map body}) async {
    try {
      return await http.post(Uri.parse(eventForumURL),
          body: jsonEncode(body), headers: _setHeaders());
    } catch (e) {
      print(e);
      return 'Could not post message!';
    }
  }
}
