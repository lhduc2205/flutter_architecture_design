import 'package:architecture_designed/l10n/l10n.dart';
import 'package:flutter/material.dart';

enum SupportedLanguageType { en, vi }

extension LanguageX on BuildContext {
  List<SupportedLanguageType> getLanguages() {
    return [...SupportedLanguageType.values]..sort(Enum.compareByName);
  }
}

extension SupportedLanguagesX on SupportedLanguageType {
  String getTranslationName(BuildContext context) {
    switch (name) {
      case 'vi':
        return context.l10n.vietnamese;
      case 'en':
        return context.l10n.english;
      default:
        return context.l10n.english;
    }
  }
}

