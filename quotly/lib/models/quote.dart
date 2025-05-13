class Quote {
  String text;
  String author;
  bool isFavorite;

  Quote({
    required this.text,
    required this.author,
    this.isFavorite = false,
  });
}
