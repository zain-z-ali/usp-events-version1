import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:version1_0/models/news_model.dart';

// ignore: camel_case_types
class HttpService_news {
  final String newsURL = "http://10.0.2.2:8000/api/news_articles";

  Future<List<News>> getNews() async {
    http.Response res = await http.get(Uri.parse(newsURL));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<News> news = body
          .map(
            (dynamic item) => News.fromJson(item),
          )
          .toList();
      return news;
    } else {
      throw Exception("Unable to retrieve news.");
    }
  }
}
