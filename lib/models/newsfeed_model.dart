
class Newsfeed {
  final int newsID;
  final String newsTime;
  final String newsName;
  final String newsDescription;
  final String newsContent;

  Newsfeed({
    required this.newsID,
    required this.newsTime,
    required this.newsName,
    required this.newsDescription,
    required this.newsContent,
  });

  factory Newsfeed.fromJson(Map<String, dynamic> json) {
    return Newsfeed(
      newsID: json['newsfeed_id'] as int,
      newsTime: json['updated_at'] as String,
      newsName: json['newsfeed_status'] as String,
      newsDescription: json['newsfeed_url'] as String,
      newsContent: json['newsfeed_picture'] as String,
    );
  }
}
