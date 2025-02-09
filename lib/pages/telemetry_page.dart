import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:math' as math;

class TelemetryPage extends StatefulWidget {
  const TelemetryPage({super.key});

  @override
  State<TelemetryPage> createState() => _TelemetryPageState();
}

class _TelemetryPageState extends State<TelemetryPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Telemetry',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: SensorChart(
                    title: 'Thrust (kN)',
                    color: Colors.purple,
                    data: _generateRandomData(),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: SensorChart(
                    title: 'Speed (km/h)',
                    color: Colors.orange,
                    data: _generateRandomData(),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: SensorChart(
                    title: 'Altitude (m)',
                    color: Colors.green,
                    data: _generateRandomData(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<FlSpot> _generateRandomData() {
    final random = math.Random();
    return List.generate(10, (index) => FlSpot(index.toDouble(), random.nextDouble() * 50 + 25));
  }
}
