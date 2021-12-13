import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:version1_0/models/sessionForum_message_model.dart';

class HttpServiceSessionForum {
  String sessionForumURL = "http://10.0.2.2:8000/api/session-forum";

  HttpServiceSessionForum() {
    this.sessionForumURL = "http://10.0.2.2:8000/api/session-forum";
  }
  //final String speakersURL = "http://10.0.2.2:8000/api/themes/$event_id";

  Future<List<SessionMessage>> getSessionForum(int sessionID) async {
    sessionForumURL = "http://10.0.2.2:8000/api/session-forum/$sessionID";
    http.Response res = await http.get(Uri.parse(sessionForumURL));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<SessionMessage> messages = body
          .map(
            (dynamic item) => SessionMessage.fromJson(item),
          )
          .toList();
      return messages;
    } else {
      throw Exception("Unable to retrieve messages.");
    }
  }
}

class HttpServiceCreateSessionForumPost {
  String themeForumURL = "http://10.0.2.2:8000/api/session-forum";

  HttpServiceCreateSessionForumPost() {
    this.themeForumURL = "http://10.0.2.2:8000/api/session-forum";
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

  createSessionForumPost({required Map body}) async {
    try {
      return await http.post(Uri.parse(themeForumURL),
          body: jsonEncode(body), headers: _setHeaders());
    } catch (e) {
      print(e);
      return 'Could not post to session forum';
    }
  }
}
