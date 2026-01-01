class Video {
  final String title;
  final String source;
  final String time;

  Video({
    required this.title,
    required this.source,
    required this.time,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      title: json['title']?.toString() ?? '',
      source: json['source']?.toString() ?? '',
      time: json['time']?.toString() ??
          json['date']?.toString() ??
          json['created_at']?.toString() ??
          '',
    );
  }
}
