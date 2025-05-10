import 'package:flutter/material.dart';

class BagikanPage extends StatelessWidget {
  const BagikanPage({Key? key}) : super(key: key);

  // Contoh data kutipan yang bisa dibagikan
  final List<Map<String, String>> shareableQuotes = const [
    {
      'quote': 'Impian tidak akan bekerja kecuali kamu melakukannya.',
      'author': 'John C. Maxwell',
    },
    {
      'quote':
          'Hidup adalah 10% apa yang terjadi padamu dan 90% bagaimana kamu meresponsnya.',
      'author': 'Charles R. Swindoll',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: shareableQuotes.isEmpty
            ? Center(
                child: Text(
                  'Belum ada kutipan untuk dibagikan.',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: shareableQuotes.length,
                itemBuilder: (context, index) {
                  final quote = shareableQuotes[index];
                  return ShareQuoteCard(
                    quote: quote['quote']!,
                    author: quote['author']!,
                  );
                },
              ),
      ),
    );
  }
}

class ShareQuoteCard extends StatelessWidget {
  final String quote;
  final String author;

  const ShareQuoteCard({
    Key? key,
    required this.quote,
    required this.author,
  }) : super(key: key);

  void _bagikanKutipan(BuildContext context) {
    // Simulasi fungsi bagikan
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Kutipan dibagikan!')),
    );
    // Untuk implementasi nyata, bisa pakai: Share.share('"$quote" - $author');
  }

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '- $author',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                IconButton(
                  onPressed: () => _bagikanKutipan(context),
                  icon: Icon(Icons.share, color: Colors.indigo),
                  tooltip: 'Bagikan',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
