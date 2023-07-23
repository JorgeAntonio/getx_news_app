class NewsModel {
  String? name,
      title,
      author,
      description,
      url,
      urlToImage,
      publishedAt,
      content;

  NewsModel({
    required this.name,
    required this.title,
    required this.author,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      name: json['source']['name'],
      title: json['title'],
      author: json['author'],
      description: json['description'],
      url: json['url'],
      urlToImage:
          json['urlToImage'] ?? 'https://picsum.photos/seed/picsum/200/300',
      publishedAt: json['publishedAt'],
      content: json['content'],
    );
  }
}
