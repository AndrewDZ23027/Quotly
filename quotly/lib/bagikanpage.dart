import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'models/quote.dart';

class BagikanPage extends StatelessWidget {
  final List<Quote> quotes;

  const BagikanPage({Key? key, required this.quotes}) : super(key: key);

  void _shareQuote(Quote quote) {
    final message =
        '📢 Kutipan dari Quotly:\n\n"${quote.text}"\n- ${quote.author}';
    Share.share(message);
  }

  @override
  Widget build(BuildContext context) {
    if (quotes.isEmpty) {
      return const Center(child: Text('Belum ada kutipan yang tersedia.'));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: quotes.length,
      itemBuilder: (context, index) {
        final quote = quotes[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          child: ListTile(
            title: Text('"${quote.text}"'),
            subtitle: Text('- ${quote.author}'),
            trailing: IconButton(
              icon: const Icon(Icons.share, color: Colors.blue),
              onPressed: () => _shareQuote(quote),
            ),
          ),
        );
      },
    );
  }
}
