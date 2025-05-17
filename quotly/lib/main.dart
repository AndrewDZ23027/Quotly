import 'package:flutter/material.dart';
import 'models/quote.dart';
import 'berandapage.dart';
import 'buatkutipanpage.dart';
import 'favoritpage.dart';
import 'bagikanpage.dart';

void main() {
  runApp(const QuotlyApp());
}

class QuotlyApp extends StatelessWidget {
  const QuotlyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quotly',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  // List untuk menyimpan semua kutipan
  List<Quote> _quotes = [];

  // Fungsi untuk menambahkan kutipan baru
  void _addQuote(Quote quote) {
    setState(() {
      _quotes.insert(0, quote); // Tambah di paling atas
    });
  }

  // Fungsi untuk toggle favorit
  void _toggleFavorite(Quote quote) {
    setState(() {
      quote.isFavorite = !quote.isFavorite;
    });
  }

  // Fungsi untuk menghapus kutipan
  void _deleteQuote(Quote quote) {
    setState(() {
      _quotes.remove(quote);
    });
  }

  final List<String> _titles = [
    'Beranda',
    'Buat Kutipan',
    'Favorit',
    'Bagikan',
  ];

  @override
  Widget build(BuildContext context) {
    // Halaman-halaman utama
    final List<Widget> _pages = [
      BerandaPage(
        quotes: _quotes,
        onToggleFavorite: _toggleFavorite,
        onDeleteQuote: _deleteQuote,
      ),
      BuatKutipanPage(onAddQuote: _addQuote),
      FavoritPage(
        quotes: _quotes,
        onToggleFavorite: _toggleFavorite,
        onDeleteQuote: _deleteQuote,
      ),
      BagikanPage(quotes: _quotes),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
        centerTitle: true,
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.red,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: 'Buat Kutipan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorit',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.share),
            label: 'Bagikan',
          ),
        ],
      ),
    );
  }
}
