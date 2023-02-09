import 'package:finance_app/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';

class LanguageController extends SimpleNotifier {}

extension LanguageControllerExtension on BuildContext {
  Locale get language {
    return TranslationProvider.of(this).flutterLocale;
  }
}

final languageProvider = SimpleProvider(
  (_) => LanguageController(),
  autoDispose: false,
);
