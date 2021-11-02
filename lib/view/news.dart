import 'package:flutter/material.dart';
import 'package:version1_0/view/news_detail.dart';
// import 'package:version1_0/models/news_model.dart';
// import '../services/httpService_news.dart';
import 'package:version1_0/models/newsfeed_model.dart';
import '../services/httpService_newsfeed.dart';

class NewsPage extends StatelessWidget {
  final HttpService_newsfeed httpService = HttpService_newsfeed();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("At A Glance"),
        automaticallyImplyLeading: false, // removes back button
      ),
      body: FutureBuilder(
        future: httpService.getNewsfeed(),
        builder: (BuildContext context, AsyncSnapshot<List<Newsfeed>> snapshot) {
          if (snapshot.hasData) {
            List<Newsfeed>? news = snapshot.data;
            return ListView(
              children: news!
                  .map(
                    (Newsfeed news) => Card(
                        color: Colors.lightBlue[50],
                        child: ListTile(
                          title: Text(news.newsName),
                          subtitle: Text(
                              '${news.newsDescription} \nUpdated At: \n${news.newsTime.replaceRange(10, 27, "")}'),
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
