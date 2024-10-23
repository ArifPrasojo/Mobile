import 'package:p6_shopping/models/item.dart';
import 'package:flutter/material.dart';
class ItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mengambil argumen dari navigasi
    final Item item = ModalRoute.of(context)!.settings.arguments as Item;
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),  // Menampilkan nama item di AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),  // Padding untuk konten
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,  // Align ke kiri
          children: [
            Text(
              'Name: ${item.name}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),  // Spacer antara teks
            Text(
              'Price: Rp ${item.price}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),  // Spacer tambahan
            ElevatedButton(
              onPressed: () {
                // Aksi ketika tombol ditekan (misalnya kembali ke halaman sebelumnya)
                Navigator.pop(context);
              },
              child: const Text('Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}