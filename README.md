# Multi Language Bad Words Filter

[![Pub Version](https://img.shields.io/pub/v/multi_lang_bad_words_filter)](https://pub.dev/packages/multi_lang_bad_words_filter)
[![GitHub stars](https://img.shields.io/github/stars/NegarTavakol/multi_lang_bad_words_filter?style=social)](https://github.com/NegarTavakol/multi_lang_bad_words_filter)
[!License: MIT](https://img.shields.io/badge/License-MIT-green.svg)


A Flutter package for filtering bad and sensitive words in multiple languages, including:
🇬🇧 English | 🇮🇷 Persian | 🇸🇦 Arabic | 🇹🇷 Turkish | 🇩🇪 German | 🇫🇷 French | 🇪🇸 Spanish | 🇷🇺 Russian

## Features
✅ Detect bad words  
✅ Replace bad words with custom characters  
✅ Supports multiple languages  
✅ Filter sensitive topics like sex, drugs, suicide, violence  
✅ Add your own custom word list

## Usage

```dart
final filter = BadWordFilter(
  languages: ['fa', 'en'],
  includeSensitiveTopics: true,
  matchInsideWords: true,
  censorCharacter: '*',
);

## Example

```dart
final filter = BadWordFilter(
  languages: ['en', 'fa'],
  censorCharacter: '*',
  caseSensitive: false,
);

final input = 'You damn fool';
print(filter.filterText(input)); // You **** fool
