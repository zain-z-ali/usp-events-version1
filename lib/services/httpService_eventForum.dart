import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:version1_0/models/eventForum_message_model.dart';
import 'package:version1_0/view/events.dart';

class HttpService_eventForum {
  int event_id = globalEventId;
  String eventForumURL = "http://10.0.2.2:8000/api/event-forum";

  HttpService_eventForum() {
    this.eventForumURL = "http://10.0.2.2:8000/api/event-forum/$event_id";
  }
  //final String speakersURL = "http://10.0.2.2:8000/api/themes/$event_id";

  Future<List<EventMessage>> getEventForum() async {
    http.Response res = await http.get(Uri.parse(eventForumURL));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<EventMessage> messages = body
          .map(
            (dynamic item) => EventMessage.fromJson(item),
          )
          .toList();
      return messages;
    } else {
      throw Exception("Unable to retrieve messages.");
    }
  }
}

class HttpService_CreateEventForumPost {
  int event_id = globalEventId;
  String eventForumURL = "http://10.0.2.2:8000/api/event-forum";

  HttpService_CreateEventForumPost() {
    this.eventForumURL = "http://10.0.2.2:8000/api/event-forum";
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

  /*Future createEventForumPost({required Map body}) async {
    return http //gives type cast error
        .post(Uri.parse(eventForumURL), body: body)
        .then((http.Response response) {
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400) {
        throw new Exception("Error while fetching data");
      }
      return EventMessage.fromJson(json.decode(response.body));
    });
  }*/
  createEventForumPost({required Map body}) async {
    try {
      return await http.post(Uri.parse(eventForumURL),
          body: jsonEncode(body), headers: _setHeaders());
    } catch (e) {
      print(e);
      return 'could not post';
    }
  }
}
