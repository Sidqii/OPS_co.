import 'package:flutter/material.dart';
import 'package:pusdatin_apk/pages/inventory_page/page_item.dart';
import 'package:pusdatin_apk/pages/inventory_page/page_pemeliharaan.dart';
import 'package:pusdatin_apk/pages/inventory_page/page_peminjaman.dart';
import 'package:pusdatin_apk/widgets/appbar/cust_appbar.dart';
import 'package:pusdatin_apk/widgets/headers/inventaris_header.dart';

class InventoryPage extends StatefulWidget {
  @override
  _InventoryPageState createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Menu',
        onBack: () {
          Navigator.pop(context);
        },
      ),
      body: Column(
        children: [
          CustomHeader(
            onExportXLS: () {
              print('Export XLS');
            },
            onExportPDF: () {
              print('Export PDF');
            },
            tabController: _tabController!,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                DataBarangPage(),
                PemeliharaanPage(),
                PeminjamanPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
