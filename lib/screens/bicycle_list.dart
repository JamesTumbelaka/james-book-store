import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:james_book_store/models/product.dart';
import 'package:james_book_store/widgets/left_drawer.dart';
import 'package:james_book_store/screens/bicycle_detail.dart';

class BicycleListViewPage extends StatefulWidget {
    const BicycleListViewPage({Key? key}) : super(key: key);

    @override
    _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<BicycleListViewPage> {
  Future<List<Product>> fetchProduct() async {
      var url = Uri.parse('http://localhost:8000/json/');
      
      var response = await http.get(
          url,
          headers: {"Access-Control-Allow-Origin": "*",
          "Content-Type": "application/json"},
      );

      var data = jsonDecode(utf8.decode(response.bodyBytes));

      List<Product> list_product = [];
      for (var d in data) {
          if (d != null) {
              list_product.add(Product.fromJson(d));
          }
      }
      return list_product;
  }

  @override
  Widget build(BuildContext context) {

      double screenWidth = MediaQuery.of(context).size.width;

      int crossAxisCount;
      if (screenWidth > 1200) {
          crossAxisCount = 3;
      } else if (screenWidth > 600) {
          crossAxisCount = 2;
      } else {
          crossAxisCount = 1;
      }

      return Scaffold(
          appBar: AppBar(
              title: const Text('Product'),
              backgroundColor: Colors.indigo,
              foregroundColor: Colors.white,
          ),
          drawer: const LeftDrawer(),
          body: FutureBuilder(
              future: fetchProduct(),
              builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                      return const Center(child: CircularProgressIndicator());
                  } else if (!snapshot.hasData) {
                      return const Center(
                          child: Text(
                              "Tidak ada data produk.",
                              style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                          ),
                      );
                  } else {
                      return GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: crossAxisCount,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 1 / 0.6,
                          ),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (_, index) {
                            Product product = snapshot.data![index];
                            return InkWell (
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BicycleDetailPage(product: product),
                                  ),
                                );
                              },
                              child: Card(
                                  child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                              Text(
                                                  "${snapshot.data![index].fields.name}",
                                                  style: const TextStyle(
                                                      fontSize: 25.0,
                                                      fontWeight: FontWeight.bold,
                                                  ),
                                              ),
                                              const SizedBox(height: 10),
                                              Text("${snapshot.data![index].fields.description}"),
                                              const SizedBox(height: 10),
                                              Text("${snapshot.data![index].fields.amount}")
                                          ],
                                      ),
                                  ),
                              ),

                            );
                
                          },
                      );
                  }
              },
          ),
      );
  }

}