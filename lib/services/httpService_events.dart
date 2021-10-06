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

class HttpService_eventSpecific {
  Future<Event> getSpecificEvents(int id) async {
    String eventsURL = "http://10.0.2.2:8000/api/events/$id";
    http.Response res = await http.get(Uri.parse(eventsURL));

    if (res.statusCode == 200) {
      Event data = Event.fromJson(jsonDecode(res.body));
      //print(data.eventName);
      return data;
    } else {
      throw Exception("Unable to retrieve event info.");
    }
  }
}
