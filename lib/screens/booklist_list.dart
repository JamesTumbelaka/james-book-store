import 'package:flutter/material.dart';
import 'package:james_book_store/models/book.dart';

class ProductListPage extends StatelessWidget {
  final List<Item> item;

  const ProductListPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Buku'),
      ),
      body: ListView.builder(
        itemCount: item.length,
        itemBuilder: (context, index) {
          final book = item[index];
          return ListTile(
            title: Text(book.name),
            subtitle: Text('Harga: ${book.price}\nDeskripsi: ${book.description}'),
          );
        },
      ),
    );
  }
}
