Nama    : James Zefanya Tumbelaka  
NPM     : 2206824653  
Kelas   : PBP E  

# Tugas 7
## Jawaban Pertanyaan

1. **Perbedaan Utama antara `Stateless` dan `Stateful` `widget` dalam Konteks Pengembangan Aplikasi Flutter**

    `Stateless Widget`:
    - `Widget` yang tidak membutuhkan `state` atau `internal condition` yang dapat berubah sepanjang `life cycle` dari `widget` tersebut.
    - Tampilan UI yang dihasilkan tidak bergantung pada data internal yang berubah - ubah.
    - `Stateless widget` hanya di-`render` sekali saja dan tidak memerlukan `rebuild` ketika terdapat perubahan data.

    `Stateful Widget`:
    - `Stateful Widget` dirancang untuk membangun UI yang bergantung pada `state` atau kondisi yang dapat berubah - ubah.
    - `Stateful Widget` mempunyai state yang dipisahkan dari objek `widget` itu sendiri dan me-manage state ini melalui objek `State`.
    - `Stateful Widget` banyak digunakan untuk user interaction seperrti animasi, input, dan interaksi user dengan aplikasi lainnya.

2. **Widget yang Digunakan untuk Menyelesaikan Tugas dan Fungsinya Masing-Masing**

    - **MaterialApp:**
      Widget yang membungkus sejumlah widget yang biasa digunakan untuk aplikasi material design. Ini mengatur tema dan navigasi pada level aplikasi.

    - **Scaffold:**
      Menyediakan struktur dasar untuk layout material design, termasuk AppBar, body, dan floating action button.

    - **AppBar:**
      Menampilkan sebuah app bar di bagian atas layar yang biasanya berisi judul dan aksi.

    - **SingleChildScrollView:**
      Widget scroll yang dapat menampung konten tunggal yang mungkin lebih besar daripada layar, memungkinkan konten dapat discroll.

    - **Padding:**
      Widget yang memberikan padding atau ruang kosong di sekitar child widget-nya.

    - **Column:**
      Menata child widget-nya secara vertikal.

    - **Text:**
      Menampilkan teks pada layar.

    - **GridView.count:**
      Membuat grid dengan jumlah kolom yang tetap. Digunakan untuk menampilkan item-item dalam bentuk grid.

    - **Material:**
      Menyediakan efek visual material design pada child widget-nya.

    - **InkWell:**
      Menambahkan efek sentuhan air pada saat widget ditekan, memberikan feedback visual pada interaksi pengguna.

    - **Container:**
      Widget yang biasa digunakan untuk styling, seperti padding, margin, dekorasi, dan transformasi.

    - **Center:**
      Menempatkan child widget-nya di tengah-tengah parent widget.

    - **Icon:**
      Menampilkan ikon.

    - **ScaffoldMessenger:**
      Digunakan untuk menampilkan snackbar pada konteks Scaffold yang saat ini aktif.

    - **SnackBar:**
      Menampilkan pesan ringkas di bagian bawah layar, biasanya digunakan untuk feedback singkat.

3. Langkah Implementasi Checklist

    - **Membuat proyek flutter baru**
      * Membuat folder yang akan menjadi tempat proyek flutter.
      * Menjalankan perintah `flutter create james_book_store` pada terminal yang sudah berada di dalam folder yang sudah dibuat sebelumnya.
      * Masuk ke dalam direktori proyek dengan perintah `cd james_book_store`.
    
    - **Merapikan struktur proyek flutter**
      * Membuat file baru dengan nama `menu.dart` pada direktori `james_book_store/lib` dan menambahkan kode berikut di baris pertama.
      ```dart
      import 'package:flutter/material.dart';
      ```

      * Memindahkan kode dari baris ke-39 hingga akhir pada `main.dart` ke file `menu.dart` yang sudah dibuat.
      ```dart
      class MyHomePage ... {
        ...
      }

      class _MyHomePageState ... {
        ...
      }
      ```

      * Menambahkan import `menu.dart` pada file `main.dart` seperti berikut.
      ```dart
      import 'package:shopping_list/menu.dart';
      ```
    
    - **Membuat widget pada flutter**
      * Pada file `main.dart`, mengubah `MyHomePage(title: 'Flutter Demo Home Page')` menjadi `MyHomePage()` saja.

      * Mengubah sifat widget halaman menjadi *stateless* dengan mengubah bagian `class MyHomePage` seperti berikut, dan menghapus fungsi `State` yang terdapat dibawah bagian *stateless widget* ini.

      ```dart
      class MyHomePage extends StatelessWidget {
        MyHomePage({Key? key}) : super(key: key);

        @override
        Widget build(BuildContext context) {
          return Scaffold(
              ...
          );
        }
      }
      ```

      * Mendefinisikan tipe data untuk teks dan card dalam `class ShopItem`.
      ```dart
      class ShopItem {
        final String name;
        final IconData icon;
        final String snackBarText;
        final Color color;

        ShopItem(this.name, this.icon, this.snackBarText, this.color);
      }
      ```

      * Menambahkan kode berikut dibawah kode `MyHomePage({Key? key}) : super(key: key);` untuk menambahkan barang - barang yang dijual.

      ```dart
      final List<ShopItem> items = [
        ShopItem("Lihat Item", Icons.checklist, 'Kamu telah menekan tombol Lihat Item', Colors.green),
        ShopItem("Tambah Item", Icons.add_shopping_cart, 'Kamu telah menekan tombol Tambah Item', Colors.blue),
        ShopItem("Logout", Icons.logout, 'Kamu telah menekan tombol Logout', Colors.red),
      ];
      ```

      * Menambahkan kode berikut dalam Widget build.

      ```dart
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'James Book Store',
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
                    'PBP Shop',
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
                    return ShopCard(item);
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      );
      ```
      * Membuat *widget stateless* untuk menampilkan *card*.

      ```dart
      class ShopCard extends StatelessWidget {
        final ShopItem item;

        const ShopCard(this.item, {super.key});

        @override
        Widget build(BuildContext context) {
          return Material(
            color: item.color, // Menggunakan warna dari objek item
            child: InkWell(
              onTap: () {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(SnackBar(content: Text(item.snackBarText)));
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
      ```

      * Menjalankan proyek flutter dengan perintah `flutter run` dan halaman aplikasi sudah dapat terlihat sudah memenuhi checklist yang ditentukan.

      * Untuk pengerjaan soal bonus, dapat dilihat pada bagian `List ShopItem` dimana pada masing - masing objek `ShopItem` terdapat atribut warna yang berbeda.
      ```dart
      final List<ShopItem> items = [
        ShopItem("Lihat Item", Icons.checklist, 'Kamu telah menekan tombol Lihat Item', Colors.green),
        ShopItem("Tambah Item", Icons.add_shopping_cart, 'Kamu telah menekan tombol Tambah Item', Colors.blue),
        ShopItem("Logout", Icons.logout, 'Kamu telah menekan tombol Logout', Colors.red),
      ];

      ...

      class ShopItem {
        final String name;
        final IconData icon;
        final String snackBarText;
        final Color color;

        ShopItem(this.name, this.icon, this.snackBarText, this.color);
      }
      ```



