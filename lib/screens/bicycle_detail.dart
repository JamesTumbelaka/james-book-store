import 'package:flutter/material.dart';
import 'package:james_book_store/models/product.dart';

class BicycleDetailPage extends StatelessWidget {
  
  final Product product;

  const BicycleDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.fields.name),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${product.fields.name}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text('Price: Rp${product.fields.price.toString()}'),
            const SizedBox(height: 10),
            Text('Amount: ${product.fields.amount}'),
            const SizedBox(height: 10),
            Text('Date Added: ${product.fields.dateAdded}'),
            const SizedBox(height: 10),
            Text('Description: ${product.fields.description}'),
          ],
        ),
      ),
    );
  }
}
