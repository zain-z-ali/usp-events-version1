import 'package:flutter/material.dart';
import 'package:version1_0/view/news.dart';

class NewsInfo extends StatelessWidget {
  const NewsInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Feed'),
      ),
      body: NewsPage(),
    );
  }
}
