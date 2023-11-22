Nama    : James Zefanya Tumbelaka  
NPM     : 2206824653  
Kelas   : PBP E  

<details>
<summary>Tugas 7</summary>

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

3. **Langkah Implementasi Checklist**

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
</details>

<details>
<summary>Tugas 8</summary>

# Tugas 8
## Jawaban Pertanyaan

1. **Perbedaan antara `Navigator.push()` dan `Navigator.pushReplacement()`, disertai dengan contoh mengenai penggunaan kedua metode tersebut.**
    `Navigator.push()`
    - Fungsi: Menambahkan sebuah route baru ke atas stack navigas, tanpa menghilangkan route sebelumnya.
    - Konteks: Digunakan saat ingin mempertahankan route sebelumnya, sehingga user dapat kembali ke route tersebut dengan tombol back.
    - Contoh:
      ```dart
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage()),
      );
      ```
      Pada contoh ini, `MyHomePage` ditumpuk di atas page saat ini, dan user dapat kembali ke halaman sebelumnya.
    
    `Navigator.pushReplacement()`
    - Fungsi: Menggantikan route saat ini dengan route baru di stack navigasi, serta menghapus route sebelumnya.
    - Konteks: Digunakan saat ingin membawa user ke sebuah page baru, tanpa memberikan akses kembali ke halaman sebelumnya, contohnya seperti saat login berhasil, langsung diarahkan ke halaman utama, tanpa akses ke login kembali.
    - Contoh:
      ```dart
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage()),
      );
      ```
      Pada contoh ini, `MyHomePage` menggantikan halaman saat ini dalam stack, sehingga user tidak dapat kembali ke halaman sebelumnya.
    
2. **Layout `widget` pada Flutter dan konteks penggunaannya.**
    `Column` dan `Row`
    - Mengatur child dalam bentuk vertikal (`Column`) atau horizontal (`Row`).
    - Digunakan untuk membuat layout linear seperti form atau menu.

    `Container`
    - Widget multifungsi untuk styling, padding, margin, dan constraints.
    - Digunakan untuk membuat kotak dengan warna, ukuran, ataupun dekorasi tertentu.

    `Stack`
    - Menumpuk widget satu diatas widget yang lain.
    - Berguna untuk overlay, seperti teks di atas gambar.

    `ListView`
    - Menampilkan daftar item yang bisa di-scroll.
    - Digunakan untuk menampilkan list yang panjang atau infinite.

    `GridView`
    - Menampilkan item dalam grid yang dapat di-scroll.
    - Digunakan untuk menampilkan item dalam sebuah grid.

    `Padding`
    - Menambahkan padding di sekitar widget.
    - Memberikan ruang di sekitar widget.

    `Align` dan `Center`
    - Mengontrol posisi widget dalam container.
    - `Align` digunakan untuk penempatan spesifik dan `Center` untuk penempatan di tengah.

3. **Apa saja elemen input pada form yang dipakai dan jelaskan mengapa elemen input tersebut digunakan.**
    `TextFormField`
    - Elemen input form ini digunakan untuk menerima input Nama, Harga, Jumlah, dan Deskripsi.
    - Untuk Nama dan Deskripsi terdapat validasi untuk masing - masing input agar tidak kosong valuenya.
    - Untuk Harga dan Jumlah, terdapat validasi untuk value tidak boleh kosong dan harus berupa angka.
    - Elemen input `TextFormField` dirancang untuk digunakan dalam widget `Form`, untuk memudahkan pengelolaan data form, validasi, dan penggunaan `FormKey` untuk mengontrol perilaku form. `TextFormFIeld` membantu dalam manajemen state dari input pengguna, melalui penggunaan `setState` dalam `onChanged` memberikan kontrol atas nilai yang diinput pengguna. `TextFormField` juga memungkinkan kontrol yang lebih baik dalam proses editing text, termasuk focus node, pengaturan controller, dan fleksibilitas dalam menangani input teks.

4. **Penerapan `clean architecture` pada aplikasi Flutter**
  * Prinsip Dasar Clean Architecture
    - Independensi Terhadap Framework
    - Memastikan bahwa setiap lapisan dapat diuji secara independen
    - Independensi UI terhadap logika aplikasi
    - Independensi Database, dimana perubahan pada database tidak mempengaruhi logika aplikasi

  * Pemisahan Aplikasi Menjadi Beberapa Layer
    - Presentation Layer
    - Domain Layer
    - Data Layer
  
  * Menetapkan Kontrak Antar Layer
    - Mendefinisikan interface yang menentukan bagaimana komunikasi antar lapisan akan terjadi

  * Mengimplementasikan Use Cases atau Interactors
    - Mengenkapsulasi logika aplikasi spesifik
    - Setiap use case mewakili satu action atau proses bisnis
  
  * Mengelola State
    - Mengelola state aplikasi dengan cara yang terpusat dan konsisten
  
  * Testing
    - Menulis tes untuk setiap lapisan secara independen

5. **Langkah Implementasi Checklist**
    - Membuat Drawer Menu untuk Navigasi
      * Membuat berkas baru dalam direktori baru `widgets` dengan nama `left_drawer.dart`.
      * Mengimpor halaman - halaman yang ingin dimasukkan navigasinya ke dalam Drawer Menu.
      * Menghias drawer dengan memasukkan `DrawerHeader` decoration dan color.
      ```dart
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
              ],
            ),
          );
        }
      }
      ```
      * Memasukkan ke dalam halaman `menu.dart`.
      ```dart
      import 'package:james_book_store/widgets/left_drawer.dart';
      ...
      return Scaffold(
          appBar: AppBar(
            title: const Text(
              'James Book Store',
            ),
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
          ),
          drawer: const LeftDrawer(),
          ...
      )
      ```
    - Membuat Form dan Elemen Input
      * Membuat model object untuk data yang diinput dalam form. Membuat direktori baru dalam `lib` dengan dama `models`, dan membuat berkas baru `bicycle.dart`, dan diisi dengan kode berikut.
      ```dart
      List<Bicycle> globalBicycleList = [];

      class Bicycle {
        final String name;
        final int price;
        final int amount;
        final DateTime dateAdded;
        final String description;

        Bicycle({required this.name, required this.price, required this.amount, required this.dateAdded, required this.description});
      }
      ```
      * Membuat berkas baru pada direktori baru `screens` dengan nama `bicycle_form.dart`.
      ```dart
      import 'package:flutter/material.dart';
      import 'package:james_book_store/widgets/left_drawer.dart';
      import 'package:james_book_store/models/bicycle.dart';

      class ShopFormPage extends StatefulWidget {
          const ShopFormPage({super.key});

          @override
          State<ShopFormPage> createState() => _ShopFormPageState();
      }

      class _ShopFormPageState extends State<ShopFormPage> {
          @override
          Widget build(BuildContext context) {
              return Placeholder();
          }
      }
      ```
      * Mengubah widget `Placeholder` dengan kode berikut.
      ```dart
      Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Form Tambah Produk',
            ),
          ),
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
        ),
        drawer: const LeftDrawer(),
        body: Form(
          child: SingleChildScrollView(),
        ),
      );
      ```
      * Membuat variabel baru bernama `_formKey` lalu menambahkannya ke dalam atribut `key` milik widget `Form`, yang akan berfungsi sebagai handler dari form state, validasi form, dan penyimpanan form.
      ```dart
      ...
      class _ShopFormPageState extends State<ShopFormPage> {
          final _formKey = GlobalKey<FormState>();
      ...
      ```
      ```dart
      ...
      body: Form(
          key: _formKey,
          child: SingleChildScrollView(),
      ),
      ...
      ```
      * Membuat object baru yang akan menampung input dari masing - masing field yang akan dibuat.
      ```dart
      Bicycle _bicycle = Bicycle(name: '', price: 0, amount: 0, dateAdded: DateTime.now(), description: '');
      ```
      * Membuat widget `Column` sebagai child dari `SingleChildScrollView`.
      ```dart
      ...
      body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column()
            ),
      ...
      ```
      * Membuat widget `TextFormField` yang dibungkus oleh `Padding` sebagai salah satu children dari widget `Column`. Atribut `crossAxisAlignment` juga ditambahkan untuk mengatur alignment children dari `Column`. Buat untuk seluruh elemen input, Nama, Harga, Jumlah, dan Deskripsi. Buat juga tombol sebagai child dari `Column`, dibungkus dalam widget `Padding` dan `Align`, yang akan menyimpan objek yang sudah dibuat dalam `globalBicycleList` dan menampilkan pop-up berisi data objek yang sudah dibuat.
      ```dart
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Nama Item",
                labelText: "Nama Item",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              onChanged: (String? value) {
                setState(() {
                  _bicycle = Bicycle(
                    name: value!,
                    price: _bicycle.price,
                    amount: _bicycle.amount,
                    dateAdded: DateTime.now(),
                    description: _bicycle.description,
                  );
                });
              },
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "Nama tidak boleh kosong!";
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Harga",
                labelText: "Harga",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              onChanged: (String? value) {
                setState(() {
                  _bicycle = Bicycle(
                    name: _bicycle.name,
                    price: int.tryParse(value!) ?? 0,
                    amount: _bicycle.amount,
                    dateAdded: DateTime.now(),
                    description: _bicycle.description,
                  );
                });
              },
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "Harga tidak boleh kosong!";
                }
                if (int.tryParse(value) == null) {
                  return "Harga harus berupa angka!";
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Jumlah",
                labelText: "Jumlah",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              onChanged: (String? value) {
                setState(() {
                  _bicycle = Bicycle(
                    name: _bicycle.name,
                    price: _bicycle.price,
                    amount: int.tryParse(value!) ?? 0,
                    dateAdded: DateTime.now(),
                    description: _bicycle.description,
                  );
                });
              },
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "Jumlah tidak boleh kosong!";
                }
                if (int.tryParse(value) == null) {
                  return "Jumlah harus berupa angka!";
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Deskripsi",
                labelText: "Deskripsi",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              onChanged: (String? value) {
                setState(() {
                  _bicycle = Bicycle(
                    name: _bicycle.name,
                    price: _bicycle.price,
                    amount: _bicycle.amount,
                    dateAdded: DateTime.now(),
                    description: value!,
                  );
                });
              },
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "Deskripsi tidak boleh kosong!";
                }
                return null;
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child : Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.grey),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Cancel",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                        MaterialStateProperty.all(Colors.indigo),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        String tempName = _bicycle.name;
                        int tempPrice = _bicycle.price;
                        int tempAmount = _bicycle.amount;
                        DateTime tempDateAdded = _bicycle.dateAdded;
                        String tempDescription = _bicycle.description;
                        globalBicycleList.add(_bicycle);
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Item berhasil tersimpan'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text('Nama: $tempName'),
                                    Text('Harga: $tempPrice'),
                                    Text('Jumlah: $tempAmount'),
                                    Text('Waktu Ditambahkan: $tempDateAdded'),
                                    Text('Deskripsi: $tempDescription'),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                      _formKey.currentState!.reset();
                      setState(() {
                        _bicycle = Bicycle(name: '', price: 0, amount: 0, dateAdded: DateTime.now(), description: '');
                      });
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ]
              ),
            ),
          ),
        ]
      )
      ```
    - Menambahkan Fitur Navigasi pada Tombol
      * Pada widget `ShopItem` pada berkas `menu.dart` menambahkan kode berikut pada `onTap` untuk mengarahkan ke halaman `ShopFormPage` jika tombol `Tambah Item` ditekan.
      ```dart
      ...
      onTap: () {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text(item.snackBarText)));
        if (item.name == "Tambah Item") {
          Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ShopFormPage()));
        }
        ...
      ```
    - Refactoring File
      * Membuat berkas baru dengan nama `bicycle_card.dart` pada direktori `widgets`.
      * Memindahkan isi widget `ShopItem` pada `menu.dart` ke berkas `widgets/bicycle_card.dart`.
      * Mengimpor `bicycle_form.dart` pada `bicycle_card.dart` dan mengimpor `bicycle_card.dart` pada berkas `menu.dart`.
      * Membuat folder baru `screens` pada lib dan memindahkan `bicycle_form.dart`dan `menu.dart` ke dalam folder tersebut, kemudian akan terjadi proses refactoring oleh IDE.

6. Bonus
    - Membuat model
      * Model sudah dibuat dalam berkas `bicycle.dart` pada direktori `models`, sekaligus membuat sebuah global list yang akan menampung semua objek `Bicycle` yang dibuat pada form.
      ```dart
      List<Bicycle> globalBicycleList = [];

      class Bicycle {
        final String name;
        final int price;
        final int amount;
        final DateTime dateAdded;
        final String description;

        Bicycle({required this.name, required this.price, required this.amount, required this.dateAdded, required this.description});
      }
      ```
    
    - Memasukkan objek yang dibuat kedalam List
      * Pada `bicycle_form.dart`, ditambahkan kode berikut dalam `onPressed`. Data objek disimpan dalam objek sementara untuk ditampilkan dalam pop-up, kemudian akan direset valuesnya pada bagian `setState`.
      ```dart
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          String tempName = _bicycle.name;
          int tempPrice = _bicycle.price;
          int tempAmount = _bicycle.amount;
          DateTime tempDateAdded = _bicycle.dateAdded;
          String tempDescription = _bicycle.description;
          globalBicycleList.add(_bicycle);
        ...
        _formKey.currentState!.reset();
        setState(() {
          _bicycle = Bicycle(name: '', price: 0, amount: 0, dateAdded: DateTime.now(), description: '');
        });
      },
      ```
    
    - Membuat halaman untuk menampilkan objek
      * Membuat berkas baru `bicycle_list.dart` pada folder `screens` dan menambahkan kode berikut.
      ```dart
      import 'package:flutter/material.dart';
      import 'package:james_book_store/models/bicycle.dart';

      class BicycleListViewPage extends StatelessWidget {
        final List<Bicycle> bicycle;

        const BicycleListViewPage({Key? key, required this.bicycle}) : super(key: key);

        @override
        Widget build(BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Daftar Item',
              ),
              backgroundColor: Colors.indigo,
              foregroundColor: Colors.white,
            ),
            body: ListView.builder(
              itemCount: bicycle.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4.0,
                  margin: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          bicycle[index].name,
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          "Harga: ${bicycle[index].price}",
                          style: const TextStyle(fontSize: 16.0),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          "Jumlah: ${bicycle[index].amount}",
                          style: const TextStyle(fontSize: 16.0),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          "Waktu Ditambahkan: ${bicycle[index].dateAdded}",
                          style: const TextStyle(fontSize: 16.0),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          "Deskripsi: ${bicycle[index].description}",
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
      }
      ```
      * Pada program ini, tiap data objek ditampilkan dalam bentuk Card.
    
    - Melakukan routing dalam `bicycle_card.dart` dan `left_drawer.dart` ke halaman `BicycleListViewPage`.
      * Pada `bicycle_card.dart`, menambahkan impor berkas `bicycle_list.dart` dan menambahkan kode berikut.
      ```dart
      import 'package:james_book_store/screens/bicycle_list.dart';
      ...

      onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(item.snackBarText)));
          if (item.name == "Tambah Item") {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ShopFormPage()));
          }
          else if (item.name == "Lihat Item") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BicycleListViewPage(bicycle: globalBicycleList)),
            );
          }
        },
        ...
      ```
      * Pada `left_drawer.dart`, menambahkan impor berkas `bicycle_list.dart` dan menambahkan kode berikut sebagai children dari `LeftDrawer`
      ```dart
      import 'package:james_book_store/screens/bicycle_list.dart';
      ...

      ListTile(
        leading: const Icon(Icons.checklist),
        title: const Text('Lihat Item'),
        onTap: () {
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BicycleListViewPage(bicycle: globalBicycleList)),
        );
        }
      ),
      ```
</details>

<details>
<summary>Tugas 9</summary>

# Tugas 9
## Jawaban Pertanyaan

1. **Pengambilan Data JSON Tanpa Model di Flutter**:
   - **Apakah Mungkin?**: Ya, memungkinkan untuk mengambil data JSON tanpa membuat model terlebih dahulu di Flutter. Kita dapat menggunakan `Map` untuk secara langsung memproses data JSON yang diterima.
   - **Perbandingan dengan Membuat Model**: Membuat model biasanya lebih baik dibandingkan langsung mengolah data JSON sebagai `Map` karena:
     - **Kejelasan dan Keselamatan Tipe**: Model memberikan struktur yang jelas dan pengecekan tipe data, sehingga mengurangi kemungkinan terjadi kesalahan.
     - **Mudah Dikelola**: Model membuat kode lebih mudah dikelola, terutama untuk proyek yang besar atau saat berkolaborasi dengan tim.
     - **Mudah untuk Modifikasi dan Skalabilitas**: Dengan model, jika struktur data berubah, kita hanya perlu memodifikasi model, bukan setiap instance di mana data tersebut digunakan.

2. **Fungsi dari `CookieRequest` dan Kebutuhan Berbagi Instance**:
   - **Fungsi**: `CookieRequest` biasanya digunakan untuk mengelola cookies dalam aplikasi Flutter, terutama dalam konteks autentikasi dengan membantu menyimpan, mengambil, dan mengelola cookie sesi dari server.
   - **Kebutuhan Sharing**: Sharing instance `CookieRequest` ke seluruh komponen aplikasi Flutter penting untuk:
     - **Konsistensi Sesi**: Memastikan bahwa setiap request ke server menggunakan informasi sesi yang sama, yang penting untuk fitur yang memerlukan autentikasi.
     - **Manajemen Sumber Daya**: Mencegah pembuatan multiple instances yang melakukan hal yang sama, sehingga lebih efisien.

3. **Mekanisme Pengambilan Data dari JSON di Flutter**:
   - **Pengambilan Data**: Menggunakan HTTP request (misalnya dengan package `http`) untuk mengambil data dari sebuah EndPoint Json.
   - **Parsing JSON**: Setelah menerima respons, data JSON di-parse menjadi struktur Dart yang dapat digunakan, biasanya menjadi Map atau menjadi objek berdasarkan model yang telah didefinisikan.
   - **Menampilkan Data**: Data yang telah di-parse kemudian dapat digunakan untuk membangun widget di Flutter, misalnya dengan menggunakan `ListView` untuk menampilkan daftar item.

4. **Mekanisme Autentikasi dari Flutter ke Django**:
   - **Modul**: Menggunakan package dari `provider` dan `pbp_django_auth` untuk logika autentikasi di Flutter.
   - **Input Data Akun**: Pengguna memasukkan data akun (biasanya username dan password) di Flutter.
   - **Pengiriman Data**: Flutter mengirimkan data tersebut ke backend Django, biasanya melalui HTTP POST request.
   - **Proses Autentikasi oleh Django**: Django menerima data, memproses autentikasi (memeriksa database user, dll), dan menghasilkan respons. Jika berhasil, Django mengatur cookie sesi atau token autentikasi.
   - **Respons ke Flutter**: Django mengirim respons kembali ke Flutter, yang mungkin termasuk token atau konfirmasi sesi.
   - **Navigasi Menu di Flutter**: Setelah autentikasi berhasil, aplikasi Flutter biasanya akan melakukan navigasi ke halaman menu atau dashboard utama. Informasi sesi atau token disimpan untuk digunakan dalam request berikutnya.

5. **Widget yang Digunakan**
  - Scaffold: Mengatur dasar aplikasi dengan AppBar, Drawer, dan body.
  - Form: Mengatur form untuk input data item.
  - TextFormField: Widget input teks untuk mengumpulkan data, seperti nama item, jumlah, harga, dan deskripsi.
  - ElevatedButton: Tombol elevated yang digunakan untuk menyimpan data item yang dimasukkan.
  - SnackBar: Menampilkan notifikasi setelah berhasil menyimpan item atau jika terdapat kesalahan.
  - FutureBuilder: Mengelola tampilan berdasarkan status future untuk mendapatkan dan menampilkan data item secara asinkronus.
  - ListView.builder: Menampilkan daftar item dalam bentuk list yang dapat di-scroll.
  - MaterialApp: Widget root yang menentukan tema dan halaman awal aplikasi.
  - Provider: Digunakan untuk menyediakan instance CookieRequest ke seluruh aplikasi menggunakan Provider.
  - Column: Menyusun widget secara vertikal.
  - GridView.count: Menampilkan daftar item dalam grid layout.
  - ShopCard: Widget custom untuk menampilkan setiap item dalam bentuk card.
  - Material: Mengatur warna background item di dalam grid.
  - InkWell: Widget responsif terhadap sentuhan pengguna.
  - Icon: Menampilkan ikon item.
  - Text: Menampilkan nama item.
  - ListView: Menampilkan daftar opsi menu dalam drawer.
  - ListTile: Membuat opsi menu dalam drawer.
  - Navigator: Bertanggung jawab untuk menavigasi antar halaman dalam aplikasi.
  - Card: Menampilkan list barang user dalam bentuk card.

## Langkah Implementasi CheckList
### Membuat halaman login
1. Instalasi package yang akan digunakan untuk proses autentikasi user melalui perintah berikut di terminal root project.
```zsh
flutter pub add provider
flutter pub add pbp_django_auth
```

2. Memodifikasi `main.dart` agar dapat menyediakan `CookieRequest` *library* untuk semua *child widget* dengan menggunakan `Provider` melalui pengubahan class `MyApp`. Serta mengubah bagian `home: ` ke `login page` yang akan dibuat.
```dart
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
    const MyApp({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Provider(
            create: (_) {
                CookieRequest request = CookieRequest();
                return request;
            },
            child: MaterialApp(
                title: 'James Bicycle Store',
                theme: ThemeData(
                    colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
                    useMaterial3: true,
                ),
                home: const LoginPage()),
        );
    }
}
```

3. Membuat file baru dengan nama `login.dart` di folder `screens` dan mengisinya dengan program berikut.
```dart
import 'package:james_book_store/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:james_book_store/screens/register.dart';

void main() {
    runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
const LoginApp({super.key});

@override
Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Login',
        
        theme: ThemeData(
            primarySwatch: Colors.blue,
    ),
    home: const LoginPage(),
    );
    }
}

class LoginPage extends StatefulWidget {
    const LoginPage({super.key});

    @override
    _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    final TextEditingController _usernameController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    @override
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();
        return Scaffold(
            appBar: AppBar(
                title: const Text('Login'),
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
            ),
            body: Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        TextField(
                            controller: _usernameController,
                            decoration: const InputDecoration(
                                labelText: 'Username',
                            ),
                        ),
                        const SizedBox(height: 12.0),
                        TextField(
                            controller: _passwordController,
                            decoration: const InputDecoration(
                                labelText: 'Password',
                            ),
                            obscureText: true,
                        ),
                        const SizedBox(height: 24.0),
                        ElevatedButton(
                            onPressed: () async {
                                String username = _usernameController.text;
                                String password = _passwordController.text;
                                final response = await request.login("https://james-zefanya-tugas.pbp.cs.ui.ac.id/auth/login/", {
                                'username': username,
                                'password': password,
                                });
                    
                                if (request.loggedIn) {
                                    String message = response['message'];
                                    String uname = response['username'];
                                    int id = response['id'];
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context) => MyHomePage(id: id)),
                                    );
                                    ScaffoldMessenger.of(context)
                                        ..hideCurrentSnackBar()
                                        ..showSnackBar(
                                            SnackBar(content: Text("$message Selamat datang, $uname.")));
                                    } else {
                                    showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                            title: const Text('Login Gagal'),
                                            content:
                                                Text(response['message']),
                                            actions: [
                                                TextButton(
                                                    child: const Text('OK'),
                                                    onPressed: () {
                                                        Navigator.pop(context);
                                                    },
                                                ),
                                            ],
                                        ),
                                    );
                                }
                            },
                            child: const Text('Login'),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Don`t have an account yet?',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RegistrationPage()),
                            );
                          },
                          child: const Text('Register'),
                        ),
                    ],
                ),
            ),
        );
    }
}
```

### Membuat Fitur Logout
1. Membuat fungsi `logout` pada `views.py` di aplikasi `authentication`.
```python
@csrf_exempt
def logout(request):
    username = request.user.username

    try:
        auth_logout(request)
        return JsonResponse({
            "username": username,
            "status": True,
            "message": "Logout berhasil!"
        }, status=200)
    except:
        return JsonResponse({
        "status": False,
        "message": "Logout gagal."
        }, status=401)
```

2. Membuat `path url` untuk fungsi `logout`.
```python
from authentication.views import logout
path('logout/', logout, name='logout'),
```

3. Membuat fungsional tombol `Logout` di `bicycle_card.dart`.
```dart
...
else if (item.name == "Logout") {
  final response = await request.logout(
      "https://james-zefanya-tugas.pbp.cs.ui.ac.id/auth/logout/");
  String message = response["message"];
  if (response['status']) {
    String uname = response["username"];
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("$message Sampai jumpa, $uname."),
    ));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("$message"),
    ));
  }
}
...
```

### Mengintegrasikan Django Authentication dengan Flutter
1. Membuat sebuah aplikasi Django baru bernama `authentication` pada proyek tugas Django.
2. Menambahkan `authentication` ke dalam `INSTALLED_APPS` pada `settings.py` di main project Django.
3. Menambahkan `django-cors-headers` di dalam `requirements.txt` dan menjalankan `pip install -r requirements.txt` untuk menginstall *dependencies*.
4. Menambahkan `corsheaders` ke dalam `INSTALLED_APPS` pada `settings.py` di main project Django.
5. Menambahkan `corsheaders.middleware.CorsMiddleware` pada `MIDDLEWARE` di `settings.py` di main project Django.
6. Menambahkan variabel - variabel berikut pada `settings.py`.
```python
CORS_ALLOW_ALL_ORIGINS = True
CORS_ALLOW_CREDENTIALS = True
CSRF_COOKIE_SECURE = True
SESSION_COOKIE_SECURE = True
CSRF_COOKIE_SAMESITE = 'None'
SESSION_COOKIE_SAMESITE = 'None'
```
7. Membuat fungsi `login` di direktori`authentication/views.py`.
```python
from django.shortcuts import render
from django.contrib.auth import authenticate, login as auth_login
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt

@csrf_exempt
def login(request):
    username = request.POST['username']
    password = request.POST['password']
    user = authenticate(username=username, password=password)
    if user is not None:
        if user.is_active:
            auth_login(request, user)
            # Status login sukses.
            return JsonResponse({
                "username": user.username,
                "status": True,
                "message": "Login sukses!"
                # Tambahkan data lainnya jika ingin mengirim data ke Flutter.
            }, status=200)
        else:
            return JsonResponse({
                "status": False,
                "message": "Login gagal, akun dinonaktifkan."
            }, status=401)

    else:
        return JsonResponse({
            "status": False,
            "message": "Login gagal, periksa kembali email atau kata sandi."
        }, status=401)
```
8. Menambahkan `path url` untuk aplikasi `authentication` yang sudah dibuat pada `urls.py` direktori proyek.
```python
path('auth/', include('authentication.urls')),
```

9. Menambahkan `path url` untuk fungsi `login` yang sudah dibuat pada `urls.py` direktori aplikasi `authentication`.
```python
from authentication.views import login
path('login/', login, name='login'),
```

### Membuat Model Kustom Sesuai dengan Proyek Django
1. Membuka *endpoint* JSON yang sudah dibuat sebelumnya dan menyalin data ke Quicktype, dan sesuaikan pengatuhan setup name, source type, dan language hasil konversi.
2. Menyalin hasil konversi ke dalam file baru `product.dart` dalam folder baru di `lib/models/`.
```dart
import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
    String model;
    int pk;
    Fields fields;

    Product({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    int user;
    String name;
    int price;
    int amount;
    DateTime dateAdded;
    String description;

    Fields({
        required this.user,
        required this.name,
        required this.price,
        required this.amount,
        required this.dateAdded,
        required this.description,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        price: json["price"],
        amount: json["amount"],
        dateAdded: DateTime.parse(json["date_added"]),
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "price": price,
        "amount": amount,
        "date_added": "${dateAdded.year.toString().padLeft(4, '0')}-${dateAdded.month.toString().padLeft(2, '0')}-${dateAdded.day.toString().padLeft(2, '0')}",
        "description": description,
    };
}
```

### Membuat Halaman yang Menampilkan Daftar Semua Item
1. Membuat file baru dalam folder `lib/screens/` dengan nama `bicycle_list.dart`, lalu menambahkan kode berikut untuk menampilkan data - data yang sesuai dengan parameter tambahan `id` untuk melakukan filter data sesuai dengan pengguna.
```dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:james_book_store/models/product.dart';
import 'package:james_book_store/widgets/left_drawer.dart';
import 'package:james_book_store/screens/bicycle_detail.dart';

class BicycleListViewPage extends StatefulWidget {
    final int id;
    const BicycleListViewPage({Key? key, required this.id}) : super(key: key);

    @override
    _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<BicycleListViewPage> {
  Future<List<Product>> fetchProduct() async {
    final int id = widget.id;
      var url = Uri.parse('https://james-zefanya-tugas.pbp.cs.ui.ac.id/json/');
      
      var response = await http.get(
          url,
          headers: {"Access-Control-Allow-Origin": "*",
          "Content-Type": "application/json"},
      );

      var data = jsonDecode(utf8.decode(response.bodyBytes));

      List<Product> list_product = [];
      for (var d in data) {
          if (d != null && d['fields']['user'] == id) {
              list_product.add(Product.fromJson(d));
          }
      }
      return list_product;
  }

  @override
  Widget build(BuildContext context) {
      final int id = widget.id;

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
          drawer: LeftDrawer(id: id),
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
```

### Membuat Halaman Detail untuk Setiap Produk
1. Membuat file baru pada `lib/screens/` dengan nama `bicycle_detail.dart`.
2. Menambahkan kode berikut untuk menampilkan detail produk.
```dart
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
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 4.0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
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
            ),
        ),
      )
    );
  }
}
```

3. Menambahkan `onTap: ()` pada tiap produk agar mengarahkan ke halaman `bicycle_detail.dart` jika `card` tiap produk ditekan.
```dart
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
  ...
)
```

### Langkah Pengerjaan Bonus
1. Membuat fungsi `register` di `views.py` pada directory `authentication`.
```python
@csrf_exempt
def register(request):
    if request.method == "POST":
        username = request.POST.get('username')
        password = request.POST.get('password')

        new_user = User.objects.create_user(username=username, password=password)
            
        return JsonResponse({
            "status": True,
            "message": "Account created successfully!",
            "user_id": new_user.id,
        }, status=200)
    
    return JsonResponse({
        "status": False,
        "message": "Invalid request method."
    }, status=405)
```

2. Membuat `path url` untuk fungsi register yang dibuat.
```python
path('register/', register, name='register'),
```
3. Membuat file `register.dart` dan menambahkan kode berikut.
```dart
import 'package:flutter/material.dart';
import 'package:james_book_store/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a username';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12.0),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24.0),
              TextFormField(
                controller: _confirmPasswordController,
                decoration: const InputDecoration(
                  labelText: 'Confirm Password',
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 36.0),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    String username = _usernameController.text;
                    String password = _passwordController.text;
                    String confirmPassword = _confirmPasswordController.text;

                    if (password != confirmPassword) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Passwords do not match"),
                        ),
                      );
                      return;
                    }

                    try {
                      if (password.length < 8) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                "Password must be at least 8 characters long"),
                          ),
                        );
                        return;
                      }
                      if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])')
                          .hasMatch(password)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                "Password must contain at least 1 uppercase letter, 1 lowercase letter, and 1 number"),
                          ),
                        );
                        return;
                      }

                      final response = await http.post(
                        Uri.parse('https://james-zefanya-tugas.pbp.cs.ui.ac.id/auth/register/'),
                        body: {
                          'username': username,
                          'password': password,
                        },
                      );

                      if (response.statusCode == 400) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                                Text("Registration failed. Please try again."),
                          ),
                        );
                        // Navigate to login page or other screen
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Registration successful!"),
                          ),
                        );
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      }
                    } catch (e) {
                      print("Error during registration: $e");
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                              "An error occurred. Please try again later."),
                        ),
                      );
                    }
                  }
                },
                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
```

4. Membuat tombol untuk melakukan register pada halaman `login`.
```dart
SizedBox(height: 20),
Text(
  'Don`t have an account yet?',
  style: TextStyle(fontSize: 16),
),
SizedBox(height: 20),
ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const RegistrationPage()),
    );
  },
  child: const Text('Register'),
),
```

5. Memodifikasi konstruktor kelas `bicycle_form.dart`, `bicycle_list.dart`, `menu.dart`, `bicycle_card.dart`, dan `left_drawer.dart` agar memiliki parameter `id` dan memodifikasi pemanggilan routingnya juga.
```dart
// contohnya pada bicycle_form.dart
class ShopFormPage extends StatefulWidget {
    final int id;
    const ShopFormPage({super.key, required this.id});
...
}
```

6. Memodifikasi bagian `fetchProduct` pada `bicycle_list.dart`.
```dart
Future<List<Product>> fetchProduct() async {
    final int id = widget.id;
      var url = Uri.parse('https://james-zefanya-tugas.pbp.cs.ui.ac.id/json/');
      
      var response = await http.get(
          url,
          headers: {"Access-Control-Allow-Origin": "*",
          "Content-Type": "application/json"},
      );

      var data = jsonDecode(utf8.decode(response.bodyBytes));

      List<Product> list_product = [];
      for (var d in data) {
          if (d != null && d['fields']['user'] == id) {
              list_product.add(Product.fromJson(d));
          }
      }
      return list_product;
  }
```

</details>