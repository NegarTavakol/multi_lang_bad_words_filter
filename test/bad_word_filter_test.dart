import 'package:flutter_test/flutter_test.dart';
import 'package:multi_lang_bad_words_filter/multi_lang_bad_words_filter.dart';



void main() {
  group('BadWordFilter', () {
    test('detects bad words in English', () {
      final filter = BadWordFilter(languages: ['en']);
      expect(filter.hasBadWord('You are a damn fool'), true);
    });

    test('filters using custom censor character', () {
      final filter = BadWordFilter(
        languages: ['fa'],
        censorCharacter: '#',
        matchInsideWords: true, // ✅ حتماً باید باشه
      );
      final result = filter.filterText('تو خیلی احمق هستی');
      print('🧪 Filtered result: $result'); // برای بررسی دستی
      expect(result.contains('####'), true);
    });
    test('filters fa with custom censor character', () {
      final filter = BadWordFilter(
        languages: ['fa'],
        censorCharacter: '#',
        matchInsideWords: true,
      );
      final result = filter.filterText('تو خیلی احمق هستی');
      print('🧪 Filtered result: $result');
      expect(result, equals('تو خیلی #### هستی')); // دقیق
    });






    test('filters text correctly', () {
      final filter = BadWordFilter(languages: ['en']);
      final result = filter.filterText('This is shit');
      expect(result, equals('This is ****'));
    });

    test('filters using custom censor character', () {
      final filter = BadWordFilter(languages: ['fa'], censorCharacter: '#');
      final result = filter.filterText('تو خیلی احمق هستی');
      expect(result.contains('####'), true);
    });

    test('can add custom bad words', () {
      final filter = BadWordFilter(languages: []);
      filter.addCustomBadWords(['joker']);
      expect(filter.hasBadWord('You joker'), true);
    });
  });
}
