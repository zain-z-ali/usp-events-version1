import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:version1_0/models/themeForum_message_model.dart';

class HttpServiceThemeForum {
  String themeForumURL = "http://10.0.2.2:8000/api/theme-forum";

  HttpServiceThemeForum() {
    this.themeForumURL = "http://10.0.2.2:8000/api/theme-forum";
  }
  //final String speakersURL = "http://10.0.2.2:8000/api/themes/$event_id";

  Future<List<ThemeMessage>> getThemeForum(int themeID) async {
    themeForumURL = "http://10.0.2.2:8000/api/theme-forum/$themeID";
    http.Response res = await http.get(Uri.parse(themeForumURL));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<ThemeMessage> messages = body
          .map(
            (dynamic item) => ThemeMessage.fromJson(item),
          )
          .toList();
      return messages;
    } else {
      throw Exception("Unable to retrieve messages.");
    }
  }
}

class HttpServiceCreateThemeForumPost {
  String themeForumURL = "http://10.0.2.2:8000/api/theme-forum";

  HttpServiceCreateThemeForumPost() {
    this.themeForumURL = "http://10.0.2.2:8000/api/theme-forum";
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

  createThemeForumPost({required Map body}) async {
    try {
      return await http.post(Uri.parse(themeForumURL),
          body: jsonEncode(body), headers: _setHeaders());
    } catch (e) {
      print(e);
      return 'Could not post to theme forum';
    }
  }
}
