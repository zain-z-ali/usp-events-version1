import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:version1_0/models/newsfeed_model.dart';

// ignore: camel_case_types
class HttpService_newsfeed {
  final String newsfeedURL = "http://10.0.2.2:8000/api/newsfeed";

  Future<List<Newsfeed>> getNewsfeed() async {
    http.Response res = await http.get(Uri.parse(newsfeedURL));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Newsfeed> newsfeed = body
          .map(
            (dynamic item) => Newsfeed.fromJson(item),
          )
          .toList();
      return newsfeed;
    } else {
      throw Exception("Unable to retrieve news.");
    }
  }
}
