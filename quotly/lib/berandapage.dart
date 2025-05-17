import 'package:flutter/material.dart';
import 'models/quote.dart';

class BerandaPage extends StatelessWidget {
  final List<Quote> quotes;
  final Function(Quote) onToggleFavorite;
  final Function(Quote) onDeleteQuote;

  const BerandaPage({
    Key? key,
    required this.quotes,
    required this.onToggleFavorite,
    required this.onDeleteQuote,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (quotes.isEmpty) {
      return const Center(child: Text('Belum ada kutipan.'));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: quotes.length,
      itemBuilder: (context, index) {
        final quote = quotes[index];
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: Card(
            key: ValueKey(quote),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: Text('"${quote.text}"'),
              subtitle: Text('- ${quote.author}'),
              trailing: Wrap(
                spacing: 8,
                children: [
                  IconButton(
                    icon: Icon(
                      quote.isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: Colors.red,
                    ),
                    onPressed: () => onToggleFavorite(quote),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => onDeleteQuote(quote),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
