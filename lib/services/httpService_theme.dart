import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:version1_0/models/theme_model.dart';
import 'package:version1_0/view/events.dart';

class HttpService_theme {
  int event_id = globalEventId;
  String themesURL = "http://10.0.2.2:8000/api/themes";

  HttpService_theme() {
    this.themesURL = "http://10.0.2.2:8000/api/themes/$event_id";
  }
  //final String speakersURL = "http://10.0.2.2:8000/api/themes/$event_id";

  Future<List<ThemeModel>> getEventThemes() async {
    http.Response res = await http.get(Uri.parse(themesURL));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<ThemeModel> theme = body
          .map(
            (dynamic item) => ThemeModel.fromJson(item),
          )
          .toList();
      return theme;
    } else {
      throw Exception("Unable to retrieve themes.");
    }
  }
}
