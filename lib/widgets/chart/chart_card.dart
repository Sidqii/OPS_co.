import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:pusdatin_apk/widgets/chart/chart_legend.dart';
import 'package:pusdatin_apk/widgets/chart/chart_section.dart';

class ChartCard extends StatefulWidget {
  @override
  _ChartCardState createState() => _ChartCardState();
}

class _ChartCardState extends State<ChartCard> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final chartRadius = screenWidth * 0.2;
    final padding = screenWidth * 0.05;

    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: padding),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                LegendItemWidget(title: 'Kondisi Baik', color: Color(0xFFFF6B6B)),
                SizedBox(height: 8),
                LegendItemWidget(title: 'Pemeliharaan', color: Color(0xFFFFA69E)),
                SizedBox(height: 8),
                LegendItemWidget(title: 'Rusak Berat', color: Color(0xFF9B1D20)),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Center(
              child: SizedBox(
                height: chartRadius * 2,
                child: PieChart(
                  PieChartData(
                    sections: _getSections(),
                    sectionsSpace: 2,
                    centerSpaceRadius: chartRadius / 2,
                    pieTouchData: PieTouchData(
                      touchCallback: (FlTouchEvent event, pieTouchResponse) {
                        setState(() {
                          if (pieTouchResponse != null &&
                              pieTouchResponse.touchedSection != null) {
                            final newIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
                            if (newIndex == touchedIndex) {
                              touchedIndex = -1;
                            } else {
                              touchedIndex = newIndex;
                            }
                          } else {
                            touchedIndex = -1;
                          }
                        });
                      },
                    ),
                  ),
                  swapAnimationDuration: const Duration(milliseconds: 800),
                  swapAnimationCurve: Curves.bounceOut,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> _getSections() {
    return [
      buildPieChartSection(
        index: 0,
        value: 45,
        color: const Color(0xFFFF6B6B),
        touchedColor: const Color(0xFFE63946),
        touchedIndex: touchedIndex,
      ),
      buildPieChartSection(
        index: 1,
        value: 25,
        color: const Color(0xFFFFA69E),
        touchedColor: const Color(0xFFF77F69),
        touchedIndex: touchedIndex,
      ),
      buildPieChartSection(
        index: 2,
        value: 30,
        color: const Color(0xFF9B1D20),
        touchedColor: const Color(0xFF7F0A0E),
        touchedIndex: touchedIndex,
      ),
    ];
  }
}
