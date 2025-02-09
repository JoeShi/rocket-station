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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Thrust (kN)',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Expanded(
                            child: SensorChart(
                              data: _generateThrustData(),
                              color: Colors.purple,
                            ),
                          ),
                        ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Speed (km/h)',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Expanded(
                            child: SensorChart(
                              data: _generateSpeedData(),
                              color: Colors.orange,
                            ),
                          ),
                        ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Altitude (m)',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Expanded(
                            child: SensorChart(
                              data: _generateAltitudeData(),
                              color: Colors.green,
                            ),
                          ),
                        ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Attitude',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Expanded(
                            child: SensorChart(
                              data: _generateAttitudeData(),
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Acceleration (km/h)',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Expanded(
                            child: SensorChart(
                              data: _generateAccelerationData(),
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Temperature (°C)',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Expanded(
                            child: SensorChart(
                              data: _generateTemperatureData(),
                              color: Colors.yellow,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ],
            ),
          ),
        ],
            const SizedBox(height: 16),
                      ),
                      ),
                        children: [
                        ],
                            'Speed (km/h)',
              ),
                              data: _generateAltitudeData(),
                              color: Colors.purple,
                              color: Colors.orange,
                        children: [
                              data: _generateThrustData(),

  Widget buildAttitudeChart() {
    return SensorChart(data: _generateAttitudeData(), color: Colors.blue);
  }
                            'Speed (km/h)',
              ),
              ),
                              color: Colors.purple,
              ),
                        children: [
                      ),
                      ),
      ),
    );
  }

  List<FlSpot> _generateThrustData() {
    final random = math.Random();
    return List.generate(10, (index) => FlSpot(index.toDouble(), random.nextDouble() * 50 + 25));
  }

  List<FlSpot> _generateSpeedData() {
    final random = math.Random();
    return List.generate(10, (index) => FlSpot(index.toDouble(), random.nextDouble() * 100 + 50));
  }

  List<FlSpot> _generateAltitudeData() {
    final random = math.Random();
    return List.generate(10, (index) => FlSpot(index.toDouble(), random.nextDouble() * 1000 + 500));
  }

  List<FlSpot> _generateAttitudeData() {
    final random = math.Random();
    return List.generate(10, (index) => FlSpot(index.toDouble(), random.nextDouble() * 360));
  }

  List<FlSpot> _generateAccelerationData() {
    final random = math.Random();
    return List.generate(10, (index) => FlSpot(index.toDouble(), random.nextDouble() * 20 + 5));
  }

  List<FlSpot> _generateTemperatureData() {
    final random = math.Random();
    return List.generate(10, (index) => FlSpot(index.toDouble(), random.nextDouble() * 100 - 50));
  }
}
