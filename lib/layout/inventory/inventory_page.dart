import 'package:flutter/material.dart';
import 'package:pusdatin_apk/layout/inventory/data_barang_page.dart';
import 'package:pusdatin_apk/widgets/appbar/custom_appbar.dart';
import 'package:pusdatin_apk/widgets/headers/custom_header.dart';

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
                //PemeliharaanBarangPage(),
                //PeminjamanBarangPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
