import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:version1_0/models/speaker_model.dart';

// ignore: camel_case_types
class HttpService_speaker {
  final String speakersURL = "http://10.0.2.2:8000/api/speakers";

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
