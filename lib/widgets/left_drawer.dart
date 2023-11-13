import 'package:flutter/material.dart';
import 'package:james_book_store/screens/menu.dart';
import 'package:james_book_store/screens/bicycle_form.dart';
import 'package:james_book_store/screens/bicycle_list.dart';
import 'package:james_book_store/models/bicycle.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.indigo,
            ),
            child: Column(
              children: [
                Text(
                  'James Book Store',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text("Kelola seluruh list bukumu disini!",
                    textAlign: TextAlign.center, // center alignment
                    style: TextStyle(
                      fontSize: 15.0, // font size 15
                      color: Colors.white, // text color white
                      fontWeight: FontWeight.normal, // font weight biasa
                    ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            onTap: () {
              Navigator.popUntil(context, (route) => route.isFirst);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Tambah Item'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ShopFormPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.checklist),
            title: const Text('Lihat Item'),
            onTap: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BookListViewPage(bicycle: globalBicycleList)),
            );
            }
          ),

        ],
      ),
    );
  }
}