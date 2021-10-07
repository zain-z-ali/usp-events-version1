
class News {
  final int newsID;
  final String newsTime;
  final String newsName;
  final String newsDescription;
  final String? newsKeyword;
  final String newsContent;

  News({
    required this.newsID,
    required this.newsTime,
    required this.newsName,
    required this.newsDescription,
    required this.newsKeyword,
    required this.newsContent,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      newsID: json['id'] as int,
      newsTime: json['updated_at'] as String,
      newsName: json['title'] as String,
      newsDescription: json['description'] as String,
      newsKeyword: json['keyword'] as String?,
      newsContent: json['article_content'] as String,
    );
  }
}
