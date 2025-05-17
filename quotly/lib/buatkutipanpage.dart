import 'package:flutter/material.dart';
import 'models/quote.dart';

class BuatKutipanPage extends StatefulWidget {
  final Function(Quote) onAddQuote;

  const BuatKutipanPage({Key? key, required this.onAddQuote}) : super(key: key);

  @override
  State<BuatKutipanPage> createState() => _BuatKutipanPageState();
}

class _BuatKutipanPageState extends State<BuatKutipanPage> {
  final _textController = TextEditingController();
  final _authorController = TextEditingController();

  void _submit() {
    final text = _textController.text.trim();
    final author = _authorController.text.trim();

    if (text.isNotEmpty && author.isNotEmpty) {
      final newQuote = Quote(text: text, author: author);
      widget.onAddQuote(newQuote);
      _textController.clear();
      _authorController.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Kutipan berhasil ditambahkan!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          TextField(
            controller: _textController,
            decoration: const InputDecoration(
              labelText: 'Tulis Kutipan',
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _authorController,
            decoration: const InputDecoration(
              labelText: 'Nama Penulis',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            icon: const Icon(Icons.save),
            label: const Text('Simpan'),
            onPressed: _submit,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
            ),
          ),
        ],
      ),
    );
  }
}
