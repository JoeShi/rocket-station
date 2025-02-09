import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Astro Nova Rocket Station',
      theme: ThemeData(
        colorScheme: ColorScheme.dark(
          primary: Colors.blue.shade300,
          secondary: Colors.blue.shade200,
          surface: const Color(0xFF2A2A2A),
        ),
        scaffoldBackgroundColor: const Color(0xFF1A1A1A),
        useMaterial3: true,
      ),
      home: const RocketStationDashboard(),
    );
  }
}

class RocketStationDashboard extends StatefulWidget {
  const RocketStationDashboard({super.key});

  @override
  State<RocketStationDashboard> createState() => _RocketStationDashboardState();
}

class _RocketStationDashboardState extends State<RocketStationDashboard> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
              if (index == 0) {
                // Navigate to RocketStationDashboard
              } else if (index == 1) {
                // Navigate to TelemetryPage
              }
            },
            labelType: NavigationRailLabelType.all,
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.home),
                label: Text('Home'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.show_chart),
                label: Text('Telemetry'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.video_library),
                label: Text('Videos'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.settings),
                label: Text('Settings'),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Astro Nova Rocket Station',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 3,
                          flex: _selectedIndex == 0 ? 3 : 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const RocketStatusCard(),
                              const SizedBox(height: 16),
                              Expanded(
                                child: Card(
                                  child: _selectedIndex == 0
                                      ? const RocketStationDashboard()
                                      : const TelemetryPage(),
                                ),
                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        const Expanded(
                          flex: 2,
                          child: VideoStreamCard(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

  List<FlSpot> _generateRandomData() {
    final random = math.Random();
    return List.generate(
      10,
      (index) => FlSpot(
        index.toDouble(),
        random.nextDouble() * 50 + 25,
      ),
    );
  }
}

class RocketStatusCard extends StatelessWidget {
  const RocketStatusCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Rocket Status',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildStatusItem('Temperature:', '5.0 °C'),
                      const SizedBox(height: 8),
                      _buildStatusItem('Thrust:', '10.1 kN'),
                      const SizedBox(height: 8),
                      _buildStatusItem('Altitude:', '20.3 m'),
                      const SizedBox(height: 8),
                      _buildStatusItem('Speed:', '12.1 km/h'),
                    ],
                  ),
                ),
                const SizedBox(width: 32),
                CustomPaint(
                  size: const Size(120, 200),
                  painter: RocketPainter(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusItem(String label, String value) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class RocketPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final path = Path();
    
    // Nose cone
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width * 0.25, size.height * 0.2);
    path.lineTo(size.width * 0.75, size.height * 0.2);
    path.close();

    // Body
    path.moveTo(size.width * 0.25, size.height * 0.2);
    path.lineTo(size.width * 0.25, size.height * 0.8);
    path.lineTo(size.width * 0.75, size.height * 0.8);
    path.lineTo(size.width * 0.75, size.height * 0.2);

    // Fins
    path.moveTo(size.width * 0.25, size.height * 0.8);
    path.lineTo(size.width * 0.1, size.height);
    path.lineTo(size.width * 0.25, size.height * 0.9);

    path.moveTo(size.width * 0.75, size.height * 0.8);
    path.lineTo(size.width * 0.9, size.height);
    path.lineTo(size.width * 0.75, size.height * 0.9);

    // Windows
    final windowPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    canvas.drawCircle(
      Offset(size.width * 0.5, size.height * 0.4),
      size.width * 0.1,
      windowPaint,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class SensorChart extends StatelessWidget {
  final String title;
  final Color color;
  final List<FlSpot> data;

  const SensorChart({
    super.key,
    required this.title,
    required this.color,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: LineChart(
            LineChartData(
              gridData: FlGridData(
                show: true,
                drawVerticalLine: true,
                horizontalInterval: 20,
                verticalInterval: 2,
              ),
              titlesData: FlTitlesData(
                show: true,
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              borderData: FlBorderData(
                show: true,
                border: Border.all(color: Colors.grey.shade800),
              ),
              minX: 0,
              maxX: 9,
              minY: 0,
              maxY: 100,
              lineBarsData: [
                LineChartBarData(
                  spots: data,
                  isCurved: true,
                  color: color,
                  barWidth: 2,
                  dotData: FlDotData(show: false),
                  belowBarData: BarAreaData(
                    show: true,
                    color: color.withOpacity(0.1),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class VideoStreamCard extends StatelessWidget {
  const VideoStreamCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Video Streaming',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.black,
              child: const Center(
                child: Text(
                  'Video Feed',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
