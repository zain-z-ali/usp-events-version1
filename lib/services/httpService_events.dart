import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:version1_0/models/event_model.dart';

class HttpService_event {
  final String eventsURL = "http://10.0.2.2:8000/api/events";

  Future<List<Event>> getEvents() async {
    http.Response res = await http.get(Uri.parse(eventsURL));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Event> event = body
          .map(
            (dynamic item) => Event.fromJson(item),
          )
          .toList();
      return event;
    } else {
      throw Exception("Unable to retrieve events.");
    }
  }
}
