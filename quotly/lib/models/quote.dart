class Quote {
  final String text;
  final String author;
  final String source;
  final String title;
  final List<String> tags;
  bool isFavorite;

  Quote({
    required this.text,
    required this.author,
    required this.source,
    required this.title,
    required this.tags,
    this.isFavorite = false,
  });
}
