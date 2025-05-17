import 'package:flutter/material.dart';
import 'models/quote.dart';

class FavoritPage extends StatelessWidget {
  final List<Quote> quotes;
  final Function(Quote) onToggleFavorite;
  final Function(Quote) onDeleteQuote;

  const FavoritPage({
    Key? key,
    required this.quotes,
    required this.onToggleFavorite,
    required this.onDeleteQuote,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favoritQuotes = quotes.where((q) => q.isFavorite).toList();

    if (favoritQuotes.isEmpty) {
      return const Center(child: Text('Belum ada kutipan favorit.'));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: favoritQuotes.length,
      itemBuilder: (context, index) {
        final quote = favoritQuotes[index];
        return Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 3,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            title: Text('"${quote.text}"'),
            subtitle: Text('- ${quote.author}'),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () => onDeleteQuote(quote),
            ),
          ),
        );
      },
    );
  }
}
