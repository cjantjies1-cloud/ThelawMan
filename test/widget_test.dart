import 'package:flutter_test/flutter_test.dart';
import 'package:the_lawman/main.dart';

void main() {
  testWidgets('HomeScreen has a title and message', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const TheLawManApp());
    // Advance past the splash delay and settle navigation.
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();

    // Verify that our app has a title.
    expect(find.text('The LawMan'), findsOneWidget);

    // Verify that our app has a message.
    expect(find.text('Know Your Rights'), findsOneWidget);
  });
}
