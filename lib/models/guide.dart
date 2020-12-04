class Guide {
  final String title;
  final double duration;
  final String imageUrl;

  Guide({
    this.title,
    this.duration,
    this.imageUrl,
  });

  Guide.fromJson(Map<String, dynamic> map)
      : title = map['title'],
        duration = map['duration'],
        imageUrl = map['imageUrl'];
}
