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
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Legend Section
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: _buildLegendItem('Kondisi Baik', const Color(0xFFFF6B6B)),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerLeft,
                  child: _buildLegendItem('Pemeliharaan', const Color(0xFFFFA69E)),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerLeft,
                  child: _buildLegendItem('Rusak Berat', const Color(0xFF9B1D20)),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          // Chart Section
          Expanded(
            child: Center(
              child: SizedBox(
                height: 150,
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

                            // Mengatur kembali touchedIndex menjadi -1 setelah 1 detik
                            Future.delayed(const Duration(seconds: 1), () {
                              setState(() {
                                touchedIndex = -1;
                              });
                            });
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
      _buildAnimatedSection(
        index: 0,
        value: 45,
        color: const Color(0xFFFF6B6B),
        touchedColor: const Color(0xFFE63946),
      ),
      _buildAnimatedSection(
        index: 1,
        value: 25,
        color: const Color(0xFFFFA69E),
        touchedColor: const Color(0xFFF77F69),
      ),
      _buildAnimatedSection(
        index: 2,
        value: 30,
        color: const Color(0xFF9B1D20),
        touchedColor: const Color(0xFF7F0A0E),
      ),
    ];
  }

  PieChartSectionData _buildAnimatedSection({
    required int index,
    required double value,
    required Color color,
    required Color touchedColor,
  }) {
    // Gunakan TweenAnimationBuilder untuk animasi perubahan warna
    return PieChartSectionData(
      color: touchedIndex == index ? touchedColor : color,
      value: value,
      title: '${value.toInt()}%',
      radius: touchedIndex == index ? 60 : 50,
      titleStyle: const TextStyle(color: Colors.white, fontSize: 14),
    );
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
                offset: const Offset(0, 1),
                blurRadius: 2,
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(color: Colors.black87, fontSize: 12),
        ),
      ],
    );
  }
}
