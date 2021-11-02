import 'package:flutter/material.dart';
// import 'package:version1_0/models/news_model.dart';
import 'package:version1_0/models/newsfeed_model.dart';

class NewsDetail extends StatelessWidget {
  final Newsfeed news;

  NewsDetail({required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("In Detail"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                Card(
                  color: Colors.teal[50],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ListTile(
                        title: Text("News Title"),
                        subtitle: Text(news.newsName),
                      ),
                      ListTile(
                        title: Text("Details"),
                        subtitle: Text(
                          "URL : ${news.newsDescription}"),
                      ), 
                      ListTile(
                        title: Text("Images:"),
                        subtitle: Image.network(news.newsContent),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      );
  }
}
