import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Diperlukan untuk rootBundle
import 'package:pusdatin_apk/models/models_item.dart';

class DataCard extends StatefulWidget {
  final Item item;

  DataCard({required this.item});

  @override
  _DataCardState createState() => _DataCardState();
}

class _DataCardState extends State<DataCard> {
  bool imageExists = false;

  @override
  void initState() {
    super.initState();
    _checkImageExistence();
  }

  // Fungsi untuk memeriksa keberadaan gambar pada path
  Future<void> _checkImageExistence() async {
    try {
      await rootBundle.load(widget.item.imagePath);
      setState(() {
        imageExists = true;
      });
    } catch (e) {
      setState(() {
        imageExists = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('No. Seri Barang', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(widget.item.serialNumber),
                  SizedBox(height: 10),
                  Text('Merk Barang', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(widget.item.brand),
                  SizedBox(height: 10),
                  Text('Status Barang', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(widget.item.status),
                  SizedBox(height: 10),
                  Text('Kondisi', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(widget.item.condition),
                  SizedBox(height: 10),
                  Text('Tanggal Masuk', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(widget.item.date),
                ],
              ),
            ),
            Column(
              children: [
                imageExists
                    ? Image.asset(
                        widget.item.imagePath,
                        width: 150,
                        height: 140,
                        fit: BoxFit.cover,
                      )
                    : Icon(
                        Icons.broken_image,
                        size: 160,
                        color: Colors.red,
                      ),
                Text('Jumlah', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('${widget.item.quantity}', style: TextStyle(fontSize: 24)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
