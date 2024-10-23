import 'package:p6_shopping/models/item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<Item> items = [
    Item(name: 'Sugar', price: 5000, imageUrl: 'assets/images/gula.jpg', stock: 100, rating: 4.5),
    Item(name: 'Salt', price: 2000, imageUrl: 'assets/images/garam.jpg', stock: 50, rating: 4.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal, // Mengubah warna AppBar
        title: const Text('Daftar Barang Belanja', style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 0.75, // Mengubah aspek rasio untuk proporsi lebih tinggi
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/item',
                      arguments: item,
                    );
                  },
                  child: Card(
                    elevation: 4, // Menambahkan bayangan pada kartu
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15), // Menambahkan sudut melengkung
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // Align content ke kiri
                      children: [
                        Hero(
                          tag: item.name,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)), // Melengkungkan gambar
                            child: Image.asset(item.imageUrl, fit: BoxFit.cover, height: 120, width: double.infinity),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            item.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            'Rp ${item.price}',
                            style: const TextStyle(
                              color: Colors.teal,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          child: Text(
                            'Stok: ${item.stock}',
                            style: const TextStyle(color: Colors.black54, fontSize: 12),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            children: [
                              Icon(Icons.star, color: Colors.yellow[700], size: 16),
                              const SizedBox(width: 4),
                              Text(
                                '${item.rating}',
                                style: const TextStyle(color: Colors.black54, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            color: Colors.teal,
            padding: const EdgeInsets.all(16), // Memperbesar padding
            child: const Center(
              child: Text(
                'Arif Prasojo - NIM: 2241760100',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold, // Membuat teks lebih tebal
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
