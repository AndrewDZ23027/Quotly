import 'package:flutter/material.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Text(
                'Kutipan Hari Ini',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 20),
              QuoteCard(
                quote:
                    'Hidup bukan tentang menunggu badai berlalu, tapi belajar menari di tengah hujan.',
                author: 'Anonim',
              ),
              const SizedBox(height: 20),
              Text(
                'Rekomendasi Kutipan',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 10),
              QuoteCard(
                quote: 'Keberanian adalah kunci untuk perubahan sejati.',
                author: 'Nelson Mandela',
              ),
              QuoteCard(
                quote:
                    'Lakukan apa yang kamu bisa, dengan apa yang kamu punya.',
                author: 'Theodore Roosevelt',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QuoteCard extends StatelessWidget {
  final String quote;
  final String author;

  const QuoteCard({
    Key? key,
    required this.quote,
    required this.author,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
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
            const SizedBox(height: 10),
            Text(
              '- $author',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
