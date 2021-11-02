import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:version1_0/models/gallery_model.dart';

// ignore: camel_case_types
class HttpService_gallery {
  final String galleryURL = "http://10.0.2.2:8000/api/gallery";

  Future<List<Gallery>> getGallery() async {
    http.Response res = await http.get(Uri.parse(galleryURL));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Gallery> gallery = body
          .map(
            (dynamic item) => Gallery.fromJson(item),
          )
          .toList();
      return gallery;
    } else {
      throw Exception("Unable to retrieve images.");
    }
  }
}