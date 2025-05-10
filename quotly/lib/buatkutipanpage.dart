import 'package:flutter/material.dart';

class BuatKutipanPage extends StatefulWidget {
  const BuatKutipanPage({Key? key}) : super(key: key);

  @override
  State<BuatKutipanPage> createState() => _BuatKutipanPageState();
}

class _BuatKutipanPageState extends State<BuatKutipanPage> {
  final TextEditingController _quoteController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();

  void _simpanKutipan() {
    final quote = _quoteController.text.trim();
    final author = _authorController.text.trim();

    if (quote.isEmpty || author.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Kutipan dan nama penulis harus diisi.')),
      );
      return;
    }

    // Simulasi penyimpanan atau kirim ke database / list favorit
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Kutipan berhasil disimpan!')),
    );

    _quoteController.clear();
    _authorController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Text(
                'Buat Kutipan',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _quoteController,
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: 'Tulis kutipan',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _authorController,
                decoration: InputDecoration(
                  labelText: 'Nama penulis',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: _simpanKutipan,
                icon: Icon(Icons.save),
                label: Text('Simpan Kutipan'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
