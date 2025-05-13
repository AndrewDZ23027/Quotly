import 'package:flutter/material.dart';
import 'models/quote.dart';

class BuatKutipanPage extends StatefulWidget {
  final Function(Quote) onAddQuote;

  const BuatKutipanPage({Key? key, required this.onAddQuote}) : super(key: key);

  @override
  State<BuatKutipanPage> createState() => _BuatKutipanPageState();
}

class _BuatKutipanPageState extends State<BuatKutipanPage> {
  final _quoteController = TextEditingController();
  final _authorController = TextEditingController();

  void _simpanKutipan() {
    final text = _quoteController.text.trim();
    final author = _authorController.text.trim();

    if (text.isNotEmpty && author.isNotEmpty) {
      final newQuote = Quote(text: text, author: author);
      widget.onAddQuote(newQuote);

      _quoteController.clear();
      _authorController.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Kutipan ditambahkan!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          TextField(
            controller: _quoteController,
            maxLines: 3,
            decoration: InputDecoration(
                labelText: 'Tulis kutipan', border: OutlineInputBorder()),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _authorController,
            decoration: InputDecoration(
                labelText: 'Nama penulis', border: OutlineInputBorder()),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: _simpanKutipan,
            child: Text('Simpan Kutipan'),
          ),
        ],
      ),
    );
  }
}
