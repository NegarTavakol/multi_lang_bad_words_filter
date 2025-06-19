import 'package:multi_lang_bad_words_filter/src/word_lists/ar.dart';
import 'package:multi_lang_bad_words_filter/src/word_lists/de.dart';
import 'package:multi_lang_bad_words_filter/src/word_lists/en.dart';
import 'package:multi_lang_bad_words_filter/src/word_lists/es.dart';
import 'package:multi_lang_bad_words_filter/src/word_lists/fa.dart';
import 'package:multi_lang_bad_words_filter/src/word_lists/fr.dart';
import 'package:multi_lang_bad_words_filter/src/word_lists/ru.dart';
import 'package:multi_lang_bad_words_filter/src/word_lists/tr.dart';




class BadWordFilter {
  final List<String> _badWords = [];
  final String censorCharacter;
  final bool caseSensitive;
  final bool matchInsideWords;
  final bool includeSensitiveTopics; // 🔹 جدید

  BadWordFilter({
    List<String> languages = const ['en'],
    this.censorCharacter = '*',
    this.caseSensitive = false,
    this.matchInsideWords = false,
    this.includeSensitiveTopics = false, // 🔹 پیش‌فرض غیرفعاله
  }) {
    _loadWordLists(languages); // 🔹 متد جدید برای بارگذاری لیست‌ها
  }

  void _loadWordLists(List<String> languages) {
    if (languages.contains('en')) {
      _badWords.addAll(badWordsEn);
      if (includeSensitiveTopics) _badWords.addAll(sensitiveWordsEn);
    }
    if (languages.contains('fa')) {
      _badWords.addAll(badWordsFa);
      if (includeSensitiveTopics) _badWords.addAll(sensitiveWordsFa);
    }
    if (languages.contains('ar')) {
      _badWords.addAll(badWordsAr);
      if (includeSensitiveTopics) _badWords.addAll(sensitiveWordsAr);
    }
    if (languages.contains('tr')) {
      _badWords.addAll(badWordsTr);
      if (includeSensitiveTopics) _badWords.addAll(sensitiveWordsTr);
    }
    if (languages.contains('ru')) {
      _badWords.addAll(badWordsRu);
      if (includeSensitiveTopics) _badWords.addAll(sensitiveWordsRu);
    }
    if (languages.contains('fr')) {
      _badWords.addAll(badWordsFr);
      if (includeSensitiveTopics) _badWords.addAll(sensitiveWordsFr);
    }
    if (languages.contains('es')) {
      _badWords.addAll(badWordsEs);
      if (includeSensitiveTopics) _badWords.addAll(sensitiveWordsEs);
    }
    if (languages.contains('de')) {
      _badWords.addAll(badWordsDe);
      if (includeSensitiveTopics) _badWords.addAll(sensitiveWordsDe);
    }
  }

  bool hasBadWord(String text) {
    return _badWords.any((word) => _containsWord(text, word.trim()));
  }

  String filterText(String text) {
    var result = text;
    for (var word in _badWords) {
      final pattern = matchInsideWords
          ? RegExp(word, caseSensitive: caseSensitive)
          : RegExp('\\b$word\\b', caseSensitive: caseSensitive);

      result = result.replaceAllMapped(pattern, (match) {
        return censorCharacter * match.group(0)!.length;
      });
    }
    return result;
  }

  void addCustomBadWords(List<String> customWords) {
    _badWords.addAll(customWords.map((e) => e.trim().toLowerCase()));
  }

  bool _containsWord(String text, String word) {
    final pattern = matchInsideWords
        ? RegExp(word, caseSensitive: caseSensitive)
        : RegExp('\\b$word\\b', caseSensitive: caseSensitive);
    return pattern.hasMatch(text);
  }
}
