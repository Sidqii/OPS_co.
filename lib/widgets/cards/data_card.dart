import 'package:flutter/material.dart';

class DataCard extends StatelessWidget {
  final String serialNumber;
  final String brand;
  final String status;
  final String condition;
  final String date;
  final int quantity;
  final String imagePath;

  DataCard({
    required this.serialNumber,
    required this.brand,
    required this.status,
    required this.condition,
    required this.date,
    required this.quantity,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'No. Seri Barang',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(serialNumber),
                  SizedBox(height: 8.0),
                  Text('Merk Barang: $brand'),
                  Text('Status Barang: $status'),
                  Text('Kondisi: $condition'),
                  Text('Tanggal Masuk: $date'),
                ],
              ),
            ),
            Column(
              children: [
                Image.asset(
                  imagePath, // Ganti dengan path gambar yang sesuai
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove, color: Colors.grey),
                      onPressed: () {
                        // Aksi untuk mengurangi jumlah barang
                      },
                    ),
                    Text('Jumlah: $quantity'),
                    IconButton(
                      icon: Icon(Icons.add, color: Colors.grey),
                      onPressed: () {
                        // Aksi untuk menambah jumlah barang
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
