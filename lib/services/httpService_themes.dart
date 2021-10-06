import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:version1_0/models/theme_model.dart';

class HttpService_theme {
  //final String eventsURL = "http://10.0.2.2:8000/api/events";
  final String eventsURL = "http://10.0.2.2:8000/api/events";

  Future<List<Theme>> getTheme() async {
    http.Response res = await http.get(Uri.parse(eventsURL));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Theme> event = body
          .map(
            (dynamic item) => Theme.fromJson(item),
          )
          .toList();
      return event;
    } else {
      throw Exception("Unable to retrieve event themes.");
    }
  }
}
