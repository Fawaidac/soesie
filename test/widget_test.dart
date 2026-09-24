import 'package:flutter_test/flutter_test.dart';
import 'package:new_soesie/main.dart';

void main() {
  testWidgets('App splash screen smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const SoesieApp());

    // Verify that splash screen title is rendered
    expect(find.text('SOESIE'), findsOneWidget);
  });
}
