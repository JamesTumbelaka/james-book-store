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