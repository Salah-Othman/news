class NewsArticalModel {
  final String? author;
  final String title;
  final String? description;
  final String url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  NewsArticalModel({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory NewsArticalModel.fromJson(Map<String, dynamic> json) {
    return NewsArticalModel(
      author: json['author'] as String?,
      title: json['title'] as String? ?? '',
      description: json['description'] as String?,
      url: json['url'] as String? ?? '',
      urlToImage: json['urlToImage'] as String?,
      publishedAt: json['publishedAt'] as String?,
      content: json['content'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'author': author,
    'title': title,
    'description': description,
    'url': url,
    'urlToImage': urlToImage,
    'publishedAt': publishedAt,
    'content': content,
  };
}

// class NewsResponse {
//   final List<Article> articles;

//   NewsResponse({required this.articles});

//   factory NewsResponse.fromJson(Map<String, dynamic> json) {
//     return NewsResponse(articles: List<Article>.from(
//       (json['articles'] ?? []).map((news)=>Article.fromJson(news))
//     ),);
//   }
//    Map<String, dynamic> toJson() {
//     return {'articles': articles.map((news) => news.toJson()).toList()};
//   }
// }
