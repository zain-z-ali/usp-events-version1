import 'package:flutter/material.dart';
import 'package:version1_0/view/news_detail.dart';
import 'package:version1_0/models/news_model.dart';
import '../services/httpService_news.dart';

class NewsPage extends StatelessWidget {
  final HttpService_news httpService = HttpService_news();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News Info"),
        automaticallyImplyLeading: false, // removes back button
      ),
      body: FutureBuilder(
        future: httpService.getNews(),
        builder: (BuildContext context, AsyncSnapshot<List<News>> snapshot) {
          if (snapshot.hasData) {
            List<News>? news = snapshot.data;
            return ListView(
              children: news!
                  .map(
                    (News news) => Card(
                        color: Colors.lightBlue[50],
                        child: ListTile(
                          title: Text(news.newsName),
                          subtitle: Text(
                              '${news.newsDescription} \nKeywords ${news.newsKeyword}'),
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => NewsDetail(
                                news: news,
                              ),
                            ),
                          ),
                        )),
                  )
                  .toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
