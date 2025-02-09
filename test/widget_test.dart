// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:rocket_station/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the RocketStationDashboard is initially displayed
    expect(find.byType(RocketStationDashboard), findsOneWidget);


  // Verify that all sensor charts are present
  expect(find.byType(SensorChart), findsNWidgets(6));
  expect(find.text('Thrust (kN)'), findsOneWidget);
  expect(find.text('Speed (km/h)'), findsOneWidget);
  expect(find.text('Altitude (m)'), findsOneWidget);
  expect(find.text('Attitude'), findsOneWidget);
  expect(find.text('Acceleration (km/h)'), findsOneWidget);
  expect(find.text('Temperature (°C)'), findsOneWidget);
    // Tap the "Telemetry" navigation rail destination
    await tester.tap(find.byIcon(Icons.show_chart));
    await tester.pump();

    // Verify that the TelemetryPage is displayed
    expect(find.byType(TelemetryPage), findsOneWidget);
  });

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}

