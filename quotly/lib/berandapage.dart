import 'package:flutter/material.dart';
import 'models/quote.dart';

class BerandaPage extends StatelessWidget {
  final List<Quote> quotes;
  final Function(Quote) onToggleFavorite;
  final Function(Quote) onDeleteQuote;

  const BerandaPage({
    super.key,
    required this.quotes,
    required this.onToggleFavorite,
    required this.onDeleteQuote,
  });

  Color getCardColor(int index) {
    final colors = [
      Colors.blue.shade300,
      Colors.orange.shade300,
      Colors.red.shade300,
      Colors.brown.shade300,
    ];
    return colors[index % colors.length];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Text(
                'Daily Quotes',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'We have picked some quotes for You',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: quotes.length,
                itemBuilder: (context, index) {
                  final quote = quotes[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: getCardColor(index),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          quote.source,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          quote.title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        if (quote.text.isNotEmpty) ...[
                          const SizedBox(height: 12),
                          Text(
                            '"${quote.text}"',
                            style: const TextStyle(
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                              color: Colors.white,
                            ),
                          ),
                        ],
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Wrap(
                              spacing: 8,
                              children: quote.tags.map((tag) {
                                return Chip(
                                  label: Text(tag),
                                  backgroundColor: Colors.white24,
                                  labelStyle:
                                      const TextStyle(color: Colors.white),
                                );
                              }).toList(),
                            ),
                            Wrap(
                              spacing: 8,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    quote.isFavorite
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: Colors.white,
                                  ),
                                  onPressed: () => onToggleFavorite(quote),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete,
                                      color: Colors.white),
                                  onPressed: () => onDeleteQuote(quote),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
