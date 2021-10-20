import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:version1_0/models/speaker_model.dart';
import 'package:version1_0/view/events.dart';

class HttpService_speaker {
  int event_id = globalEventId;
  String speakersURL = "http://10.0.2.2:8000/api/speakers";

  HttpService_speaker() {
    this.speakersURL = "http://10.0.2.2:8000/api/speakers/$event_id";
  }
  //final String speakersURL = "http://10.0.2.2:8000/api/speakers/$event_id";

  Future<List<Speaker>> getSpeakers() async {
    http.Response res = await http.get(Uri.parse(speakersURL));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Speaker> speaker = body
          .map(
            (dynamic item) => Speaker.fromJson(item),
          )
          .toList();
      return speaker;
    } else {
      throw Exception("Unable to retrieve speakers.");
    }
  }
}
