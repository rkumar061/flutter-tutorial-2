import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("calculator_view test", (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.byKey(const Key("result")), findsOneWidget);
    expect(find.byKey(const Key("displayOne")), findsOneWidget);
    expect(find.byKey(const Key("displayTwo")), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsNWidgets(5));
    // find add button
    // await tester.tap(find.byIcon(Icons.add));
    expect(find.byIcon(Icons.add), findsOneWidget);

    // enter 1 in first text field
    await tester.enterText(find.byKey(const Key("displayOne")), "1");
    // enter 2 in second text field
    await tester.enterText(find.byKey(const Key("displayTwo")), "2");

    // tap add button
    await tester.tap(find.byIcon(Icons.add));

    // wait for the build method to finish
    await tester.pump();

    // check if result is 3
    expect(find.text("Result: 3"), findsOneWidget);
  });
}
