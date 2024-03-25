import 'package:flutter_test/flutter_test.dart';
import 'package:news_app_grade/common/utils/formatter_utils.dart';

void main() {
  group('Formatter', () {
    test('stringDateFormatter should format string date correctly', () {
      const inputDate = '2024-03-25';
      const expectedFormattedDate = '25.03.2024';

      final formattedDate = Formatter.stringDateFormatter(inputDate);

      expect(formattedDate, expectedFormattedDate);
    });

    test('longTextFormatter should remove [+n chars] from text', () {
      const inputText = 'This is a long text [+356 chars]';
      const expectedText = 'This is a long text ';

      final formattedText = Formatter.longTextFormatter(inputText);

      expect(formattedText, expectedText);
    });
  });
}
