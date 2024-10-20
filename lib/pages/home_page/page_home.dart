import 'package:flutter/material.dart';
import 'package:pusdatin_apk/pages/inventory_page/page_inventory.dart';
import 'package:pusdatin_apk/pages/home_page/page_profile.dart';
import 'package:pusdatin_apk/pages/home_page/page_report.dart';
import 'package:pusdatin_apk/pages/home_page/page_qr.dart';
import 'package:pusdatin_apk/widgets/card/calendar/calendar_card.dart';
import 'package:pusdatin_apk/widgets/card/chart/chart_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    // Navigasi berdasarkan tab yang dipilih
    switch (index) {
      case 0:
        Navigator.push(
          context,
          _createRoute(ScanQRPage()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          _createRoute(InventoryPage()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          _createRoute(ReportPage()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          _createRoute(ProfilePage()),
        );
        break;
    }
  }

  Route _createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0); // Memasuki dari kanan
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3D0E22),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 40),
            _buildCustomAppBar(),
            const SizedBox(height: 20),
            CalendarCard(),
            const SizedBox(height: 20),
            ChartCard(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner),
            label: 'Scan QR',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory),
            label: 'Inventaris',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Report',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.grey[400],
        unselectedItemColor: Colors.grey[400],
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  Widget _buildCustomAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey[300],
                child: Icon(Icons.camera_alt, color: Colors.black),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Lorem ipsum dolor sit amet',
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Consectetur adipiscing elit',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              // Tambahkan logika notifikasi di sini
            },
          ),
        ],
      ),
    );
  }
}
