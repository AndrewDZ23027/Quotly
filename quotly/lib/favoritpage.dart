import 'package:flutter/material.dart';

class FavoritPage extends StatelessWidget {
  const FavoritPage({Key? key}) : super(key: key);

  // Contoh data kutipan favorit
  final List<Map<String, String>> favoriteQuotes = const [
    {
      'quote': 'Jadilah perubahan yang ingin kamu lihat di dunia.',
      'author': 'Mahatma Gandhi',
    },
    {
      'quote': 'Kesuksesan adalah gabungan dari kerja keras dan ketekunan.',
      'author': 'Albert Einstein',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: favoriteQuotes.isEmpty
            ? Center(
                child: Text(
                  'Belum ada kutipan favorit.',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: favoriteQuotes.length,
                itemBuilder: (context, index) {
                  final quote = favoriteQuotes[index];
                  return FavoriteQuoteCard(
                    quote: quote['quote']!,
                    author: quote['author']!,
                  );
                },
              ),
      ),
    );
  }
}

class FavoriteQuoteCard extends StatelessWidget {
  final String quote;
  final String author;

  const FavoriteQuoteCard({
    Key? key,
    required this.quote,
    required this.author,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '"$quote"',
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 8),
            Text(
              '- $author',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
