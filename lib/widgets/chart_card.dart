import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ChartCard extends StatefulWidget {
  @override
  _ChartCardState createState() => _ChartCardState();
}

class _ChartCardState extends State<ChartCard> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF800000), Color(0xFF4B0000)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Legend Section
          Padding(
            padding: const EdgeInsets.only(left: 25.0), // Memberikan jarak di kiri
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: _buildLegendItem('Baik', Colors.blue),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerLeft,
                  child: _buildLegendItem('Rusak Ringan', Colors.red),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerLeft,
                  child: _buildLegendItem('Rusak Berat', Colors.purple),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16), // Spacer between legend and chart
          // Chart Section
          Expanded(
            child: Center(
              child: SizedBox(
                height: 150, // Ukuran tinggi chart yang diperkecil
                child: PieChart(
                  PieChartData(
                    sections: _getSections(),
                    sectionsSpace: 2,
                    centerSpaceRadius: 30,
                    pieTouchData: PieTouchData(
                      touchCallback: (FlTouchEvent event, pieTouchResponse) {
                        setState(() {
                          if (pieTouchResponse != null &&
                              pieTouchResponse.touchedSection != null) {
                            touchedIndex = pieTouchResponse
                                .touchedSection!.touchedSectionIndex;
                          } else {
                            touchedIndex = -1;
                          }
                        });
                      },
                    ),
                  ),
                  swapAnimationDuration: Duration(milliseconds: 600),
                  swapAnimationCurve: Curves.easeInOut,
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
      PieChartSectionData(
        color: Colors.blue,
        value: 45,
        title: '45%',
        radius: touchedIndex == 0 ? 60 : 50,
        titleStyle: const TextStyle(color: Colors.white, fontSize: 14),
      ),
      PieChartSectionData(
        color: Colors.red,
        value: 25,
        title: '25%',
        radius: touchedIndex == 1 ? 60 : 50,
        titleStyle: const TextStyle(color: Colors.white, fontSize: 14),
      ),
      PieChartSectionData(
        color: Colors.purple,
        value: 30,
        title: '30%',
        radius: touchedIndex == 2 ? 60 : 50,
        titleStyle: const TextStyle(color: Colors.white, fontSize: 14),
      ),
    ];
  }

  Widget _buildLegendItem(String title, Color color) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 1),
                blurRadius: 2,
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
      ],
    );
  }
}
