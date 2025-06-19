

import 'package:multi_lang_bad_words_filter/multi_lang_bad_words_filter.dart';

void main() {
  final filter = BadWordFilter(
    languages: ['en', 'fa', 'ar', 'tr', 'ru', 'fr', 'es', 'de'],
    includeSensitiveTopics: true,
    matchInsideWords: true,
  );

  final inputs = [
    'You are a fucking idiot',
    'تو خیلی احمق هستی',
    'أنت حمار وقح',
    'salak piç seni öldüreceğim',
    'ты ебаный мудак',
    'espèce de connard je vais te tuer',
    'maldito idiota voy a matarme',
    'du bist ein hurensohn',
  ];

  for (var input in inputs) {
    print('📝 Original: $input');
    print('❗ Contains bad word: ${filter.hasBadWord(input)}');
    print('🧼 Filtered: ${filter.filterText(input)}');
    print('---');
  }
}


