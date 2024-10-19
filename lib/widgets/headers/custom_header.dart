import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  final VoidCallback onExportXLS;
  final VoidCallback onExportPDF;
  final TabController tabController;

  CustomHeader({
    required this.onExportXLS,
    required this.onExportPDF,
    required this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Color(0xFF3D0E22), // Mengatur warna latar belakang sesuai dengan warna home page
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.asset(
                'assets/images/pusdatin.png', // Ganti dengan path logo yang sesuai
                height: 150.0,
              ),
              SizedBox(height: 8.0),
              Text(
                'INVENTARIS BARANG PUSDATIN KEMHAN',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Mengubah warna teks menjadi putih agar kontras
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.0),
              TabBar(
                controller: tabController,
                tabs: [
                  Tab(text: 'Data Barang'),
                  Tab(text: 'Pemeliharaan'),
                  Tab(text: 'Peminjaman'),
                ],
                indicatorColor: Colors.white, // Warna indikator tab
                labelColor: Colors.white, // Warna teks tab aktif
                unselectedLabelColor: Colors.white60, // Warna teks tab tidak aktif
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: onExportXLS,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: Text('XLS'),
                  ),
                  SizedBox(width: 8.0),
                  ElevatedButton(
                    onPressed: onExportPDF,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: Text('PDF'),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Cari',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
