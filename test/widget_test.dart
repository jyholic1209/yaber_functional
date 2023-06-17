// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_yaber/main.dart';

void main() {
  // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget(const MyApp());

  //   // Verify that our counter starts at 0.
  //   expect(find.text('0'), findsOneWidget);
  //   expect(find.text('1'), findsNothing);

  //   // Tap the '+' icon and trigger a frame.
  //   await tester.tap(find.byIcon(Icons.add));
  //   await tester.pump();

  //   // Verify that our counter has incremented.
  //   expect(find.text('0'), findsNothing);
  //   expect(find.text('1'), findsOneWidget);
  // });

  test('dio test', () async {
    const iosUrl =
        'https://api.odcloud.kr/api/15076566/v1/uddi:b003548e-3d28-42f4-8f82-e64766b055bc?page=1&perPage=237&serviceKey=IPesnI3k2MuwHqBF08Pli3NRTzp9eNoihEOC0tnHCOHFhr4Y2NOqS6O75xeTxFf9H4qQp5tPMYjeH2U81QgxcA==';

    final dio = Dio();

    final response = await dio.get(iosUrl);
    final List<Map<String, dynamic>> nationList = [];
    Map<String, dynamic> nation;
    for (nation in response.data['data']) {
      nationList.add(nation);
    }
    print(nationList.toString());
  });
}

class Nation {
  String? iso2;
  String? iso3;
  String? iso;
  String? nationKR;
  String? nationEN;

  Nation({
    this.iso2,
    this.iso3,
    this.iso,
    this.nationKR,
    this.nationEN,
  });
}
