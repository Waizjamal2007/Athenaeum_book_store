import 'package:flutter_test/flutter_test.dart';
import 'package:aptech_login_register_cart/main.dart';

void main() {
  testWidgets('Athenaeum app loads test', (WidgetTester tester) async {
    await tester.pumpWidget(const AthenaeumApp());
    expect(find.byType(AthenaeumApp), findsOneWidget);
  });
}