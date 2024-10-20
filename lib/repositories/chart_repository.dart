import 'dart:async';
import 'package:pusdatin_apk/data/chart_data.dart';

class ChartRepository {
  Future<ChartData> fetchChartData() async {
    // Simulasi waktu tunggu untuk data dummy
    await Future.delayed(const Duration(seconds: 1));

    // Data dummy
    return ChartData(
      kondisiBaik: 45.0,
      pemeliharaan: 25.0,
      rusakBerat: 30.0,
    );
  }
}
