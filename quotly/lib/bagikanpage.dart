import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'models/quote.dart';

class BagikanPage extends StatelessWidget {
  final List<Quote> quotes;

  const BagikanPage({Key? key, required this.quotes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (quotes.isEmpty) {
      return const Center(child: Text('Belum ada kutipan untuk dibagikan.'));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: quotes.length,
      itemBuilder: (context, index) {
        final quote = quotes[index];
        return Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 2,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            title: Text('"${quote.text}"'),
            subtitle: Text('- ${quote.author}'),
            trailing: IconButton(
              icon: const Icon(Icons.share, color: Colors.red),
              onPressed: () {
                final content = '"${quote.text}"\n\n- ${quote.author}';
                Share.share(content);
              },
            ),
          ),
        );
      },
    );
  }
}
