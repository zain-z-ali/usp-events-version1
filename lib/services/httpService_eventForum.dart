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
