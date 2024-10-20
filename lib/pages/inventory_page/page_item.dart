import 'package:flutter/material.dart';
import 'package:pusdatin_apk/models/item_models.dart';
import 'package:pusdatin_apk/widgets/inventory/item_card.dart';

class DataBarangPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Contoh data yang diambil dari database
    List<Item> items = [
      Item(
        serialNumber: 'MDB.19SCM20.RF07',
        brand: 'Drone',
        status: 'Dipelihara',
        condition: 'Rusak Ringan',
        date: '2019-09-20',
        quantity: 7,
        imagePath: 'assets/images/drone.png', // Ganti dengan path gambar yang sesuai
      ),
      Item(
        serialNumber: 'MDB.19SCM20.RF07',
        brand: 'Drone',
        status: 'Dipelihara',
        condition: 'Rusak Ringan',
        date: '2019-09-20',
        quantity: 7,
        imagePath: 'assets/images/drone.png', // Ganti dengan path gambar yang sesuai
      ),
      Item(
        serialNumber: 'MDB.19SCM20.RF07',
        brand: 'Drone',
        status: 'Dipelihara',
        condition: 'Rusak Ringan',
        date: '2019-09-20',
        quantity: 7,
        imagePath: 'assets/images/drone.png', // Ganti dengan path gambar yang sesuai
      ),
      Item(
        serialNumber: 'MDB.19SCM20.RF07',
        brand: 'Drone',
        status: 'Dipelihara',
        condition: 'Rusak Ringan',
        date: '2019-09-20',
        quantity: 7,
        imagePath: 'assets/images/drone.png', // Ganti dengan path gambar yang sesuai
      ),
      // Tambahkan item lain di sini jika diperlukan
    ];

    return ListView(
      children: items.map((item) {
        return DataCard(
          serialNumber: item.serialNumber,
          brand: item.brand,
          status: item.status,
          condition: item.condition,
          date: item.date,
          quantity: item.quantity,
          imagePath: item.imagePath,
        );
      }).toList(),
    );
  }
}
