import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBack;

  CustomAppBar({required this.title, this.onBack});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(50.0), // Mengatur tinggi AppBar
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              color: Colors.grey[300]!, // Warna garis yang lebih lembut
              width: 0.5, // Ketebalan garis yang lebih tipis
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end, // Menempatkan konten di bagian bawah
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start, // Mengatur posisi ke kiri
                children: [
                  GestureDetector(
                    onTap: onBack ?? () => Navigator.pop(context),
                    child: Row(
                      children: [
                        Icon(Icons.arrow_back, color: Colors.black),
                        SizedBox(width: 4.0),
                        Text(
                          title,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80.0);
}
