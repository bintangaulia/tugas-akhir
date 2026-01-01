class Article {
  final String title;
  final String content;
  final String createdAt;
  final String author;
  final String category;
  final String thumbnail;

  Article({
    required this.title,
    required this.content,
    required this.createdAt,
    this.author = 'Admin',
    this.category = 'Berita',
    this.thumbnail = '',
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title']?.toString() ?? '',
      content: json['content']?.toString() ?? '',
      createdAt: json['created_at']?.toString() ?? '',
      author: json['author']?.toString() ?? 'Admin',
      category: json['news_category']?.toString() ?? 'Berita',
      thumbnail: json['thumbnail']?.toString() ?? '',
    );
  }
}
