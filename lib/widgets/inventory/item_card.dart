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
      margin: EdgeInsets.all(10), // Mengatur margin di sekitar kartu
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Menambahkan sudut bulat
      ),
      elevation: 5, // Memberikan efek bayangan
      child: Padding(
        padding: EdgeInsets.all(15), // Mengatur padding dalam kartu
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bagian kiri: Informasi barang
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'No. Seri Barang',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                  SizedBox(height: 5),
                  Text(
                    serialNumber,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text('Merk Barang',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                  Text(brand, style: TextStyle(fontSize: 16)),
                  SizedBox(height: 10),
                  Text('Status Barang',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                  Text(status, style: TextStyle(fontSize: 16)),
                  SizedBox(height: 10),
                  Text('Kondisi',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                  Text(condition, style: TextStyle(fontSize: 16)),
                  SizedBox(height: 10),
                  Text('Tanggal Masuk',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                  Text(date, style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
            // Bagian kanan: Gambar dan jumlah barang
            Column(
              children: [
                Image.asset(
                  imagePath,
                  width: 80, // Ukuran gambar
                  height: 140,
                ),
                SizedBox(height: 10),
                Text(
                  'Jumlah',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Text(
                  '$quantity',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.remove),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
