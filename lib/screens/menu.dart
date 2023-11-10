import 'package:flutter/material.dart';
import 'package:james_book_store/models/book.dart';
import 'package:james_book_store/screens/booklist_list.dart';
import 'package:james_book_store/screens/booklist_form.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Inventory App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  final List<ShopItem> items = [
    ShopItem("Lihat Item", Icons.checklist, 'Kamu telah menekan tombol Lihat Item', Colors.green),
    ShopItem("Tambah Item", Icons.add_shopping_cart, 'Kamu telah menekan tombol Tambah Item', Colors.blue),
    ShopItem("Logout", Icons.logout, 'Kamu telah menekan tombol Logout', Colors.red),
  ];
  final List<Item> books = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Toko Buku',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text(
                  'James Book Store',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              GridView.count(
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((ShopItem item) {
                  return ShopCard(item, books: books);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShopItem {
  final String name;
  final IconData icon;
  final String snackBarText;
  final Color color;

  ShopItem(this.name, this.icon, this.snackBarText, this.color);
}

class ShopCard extends StatelessWidget {
  final ShopItem item;
  final List<Item> books;
  const ShopCard(this.item, {required this.books, super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color, // Menggunakan warna dari objek item
      child: InkWell(
        onTap: () {
          if (item.name == "Lihat Item") {
            // Navigasi ke ProductListPage
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductListPage(item: books),
              ),
            );
          }
          else if (item.name == "Tambah Item") {
            // Navigate to the form to add a new item
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const ShopFormPage()),
            );
          } else {
            // Show the snackbar for other items
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(content: Text(item.snackBarText)));
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
