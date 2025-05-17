import 'package:flutter/material.dart';
import 'models/quote.dart';

class BuatKutipanPage extends StatefulWidget {
  final Function(Quote) onAddQuote;

  const BuatKutipanPage({super.key, required this.onAddQuote});

  @override
  State<BuatKutipanPage> createState() => _BuatKutipanPageState();
}

class _BuatKutipanPageState extends State<BuatKutipanPage> {
  final _textController = TextEditingController();
  final _authorController = TextEditingController();
  final _sourceController = TextEditingController();
  final _titleController = TextEditingController();
  final _tagsController = TextEditingController();

  void _submit() {
    final text = _textController.text.trim();
    final author = _authorController.text.trim();
    final source = _sourceController.text.trim();
    final title = _titleController.text.trim();
    final tags = _tagsController.text
        .split(',')
        .map((tag) => tag.trim())
        .where((tag) => tag.isNotEmpty)
        .toList();

    if (text.isNotEmpty &&
        author.isNotEmpty &&
        source.isNotEmpty &&
        title.isNotEmpty) {
      final newQuote = Quote(
        text: text,
        author: author,
        source: source,
        title: title,
        tags: tags,
      );
      widget.onAddQuote(newQuote);
      _textController.clear();
      _authorController.clear();
      _sourceController.clear();
      _titleController.clear();
      _tagsController.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Kutipan berhasil ditambahkan!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
          const SizedBox(height: 16),
          TextField(
            controller: _sourceController,
            decoration: const InputDecoration(
              labelText: 'Sumber (buku/film)',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(
              labelText: 'Judul',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _tagsController,
            decoration: const InputDecoration(
              labelText: 'Tag (pisahkan dengan koma)',
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
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
