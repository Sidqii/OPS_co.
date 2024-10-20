import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

// Fungsi yang membangun segmen PieChart
PieChartSectionData buildPieChartSection({
  required int index,
  required double value,
  required Color color,
  required Color touchedColor,
  required int touchedIndex,
}) {
  return PieChartSectionData(
    color: touchedIndex == index ? touchedColor : color,
    value: value,
    title: '${value.toInt()}%',
    radius: touchedIndex == index ? 60 : 50,
    titleStyle: const TextStyle(color: Colors.white, fontSize: 14),
  );
}
