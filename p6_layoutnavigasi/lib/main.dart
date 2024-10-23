import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    // Widget titleSection yang berisi struktur Row dan Column untuk title
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32), // padding 32 untuk seluruh Row
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Column di-align ke awal baris
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8), // padding 8 untuk teks pertama
                  child: const Text(
                    'Wisata Gunung di Batu',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Text(
                  'Batu, Malang, Indonesia',
                  style: TextStyle(
                    color: Colors.grey, // warna abu-abu untuk teks kedua
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.star,
            color: Colors.red, // ikon bintang berwarna merah
          ),
          const Text('41'),
        ],
      ),
    );

    // Membuat bagian tombol
    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    // Widget textSection yang berisi teks tambahan
    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: const Text(
        'Carilah teks di internet yang sesuai '
        'dengan foto atau tempat wisata yang ingin '
        'Anda tampilkan. '
        'Tambahkan nama dan NIM Anda sebagai '
        'identitas hasil pekerjaan Anda. '
        'Selamat mengerjakan 🙂.',
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Wisata Gunung di Batu'),
        ),
        body: ListView(
          children: [
            Image.asset(
            'assets/images/gunung.jpg', // Perbaiki path sesuai dengan lokasi aset
            fit: BoxFit.cover, // Sesuaikan ukuran gambar
            ),
            titleSection,  // Title section
            buttonSection, // Button section
            textSection,   // Text section
          ],
        ),
      ),
    );
  }

  // Metode untuk membangun kolom tombol dengan ikon dan teks
  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
