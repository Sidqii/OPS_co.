import 'package:flutter/material.dart';
import 'package:pusdatin_apk/dummy/dummy_items.dart';
import 'package:pusdatin_apk/widgets/card/inventory/card_item.dart';

class DataBarangPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: dummyItems.map((item) => DataCard(item: item)).toList(),
    );
  }
}
