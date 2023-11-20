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
   - **Pengambilan Data**: Menggunakan HTTP request (misalnya dengan package `http`) untuk mengambil data dari sebuah API.
   - **Parsing JSON**: Setelah menerima respons, data JSON di-parse menjadi struktur Dart yang dapat digunakan, biasanya menjadi Map atau langsung menjadi objek berdasarkan model yang telah didefinisikan.
   - **Menampilkan Data**: Data yang telah di-parse kemudian dapat digunakan untuk membangun widget di Flutter, misalnya dengan menggunakan `ListView` untuk menampilkan daftar item.

4. **Mekanisme Autentikasi dari Flutter ke Django**:
   - **Input Data Akun**: Pengguna memasukkan data akun (biasanya username dan password) di Flutter.
   - **Pengiriman Data**: Flutter mengirimkan data tersebut ke backend Django, biasanya melalui HTTP POST request.
   - **Proses Autentikasi oleh Django**: Django menerima data, memproses autentikasi (memeriksa database user, dll), dan menghasilkan respons. Jika berhasil, Django mengatur cookie sesi atau token autentikasi.
   - **Respons ke Flutter**: Django mengirim respons kembali ke Flutter, yang mungkin termasuk token atau konfirmasi sesi.
   - **Navigasi Menu di Flutter**: Setelah autentikasi berhasil, aplikasi Flutter biasanya akan melakukan navigasi ke halaman menu atau dashboard utama. Informasi sesi atau token disimpan untuk digunakan dalam request berikutnya.

</details>