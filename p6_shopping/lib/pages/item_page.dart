import 'package:p6_shopping/models/item.dart';
import 'package:flutter/material.dart';

class ItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Item item = ModalRoute.of(context)!.settings.arguments as Item;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal, // Mengubah warna AppBar menjadi teal
        title: Text(item.name, style: const TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: item.name,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15), // Membulatkan gambar
                child: Image.asset(item.imageUrl, fit: BoxFit.cover, width: double.infinity),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              item.name,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.teal),
            ),
            const SizedBox(height: 12),
            Text(
              'Harga: Rp ${item.price}',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            Text(
              'Stok: ${item.stock}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black54),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.star, color: Colors.yellow[700], size: 24),
                const SizedBox(width: 8),
                Text(
                  '${item.rating}',
                  style: const TextStyle(fontSize: 20, color: Colors.black54),
                ),
              ],
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal, // Mengubah warna button menjadi teal
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12), // Padding lebih besar
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Membulatkan button
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Kembali',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600), // Ukuran font lebih besar
              ),
            ),
          ],
        ),
      ),
    );
  }
}
