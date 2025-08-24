// test/main_test.dart
import 'package:flutter/material.dart';
import 'package:tabi_cook/routes/app_router.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tabi_cook/main.dart';
import 'package:go_router/go_router.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final GoRouter router = buildAppRouter();
  testWidgets('App renders MyHomePage and increments counter', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(MyApp(router: router));
    expect(
      find.text('You have pushed the button this many times:'),
      findsOneWidget,
    );
    expect(find.text('0'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('1'), findsOneWidget);
  });
}
