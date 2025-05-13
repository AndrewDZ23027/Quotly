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

  void _konfirmasiHapus(BuildContext context, Quote quote) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Hapus Kutipan'),
        content: const Text('Apakah kamu yakin ingin menghapus kutipan ini?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              onDeleteQuote(quote);
              Navigator.of(ctx).pop();
            },
            child: const Text('Hapus'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final favoriteQuotes = quotes.where((q) => q.isFavorite).toList();

    if (favoriteQuotes.isEmpty) {
      return const Center(child: Text('Belum ada kutipan favorit.'));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: favoriteQuotes.length,
      itemBuilder: (context, index) {
        final quote = favoriteQuotes[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          child: ListTile(
            title: Text('"${quote.text}"'),
            subtitle: Text('- ${quote.author}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.favorite, color: Colors.red),
                  onPressed: () => onToggleFavorite(quote),
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.grey),
                  onPressed: () => _konfirmasiHapus(context, quote),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
