import 'package:finance_app/app/ui/global_widgets/dialogs/progress_dialog.dart';
import 'package:finance_app/app/ui/pages/home/controller/home_provider.dart';
import 'package:finance_app/app/utils/app_constants.dart';
import 'package:finance_app/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui' as ui;

class LanguageController extends SimpleNotifier {
  Future<void> changeAppLocal(AppLocale locale, BuildContext context) async {
    ProgressDialog.show(context);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    LocaleSettings.setLocale(locale);
    if (locale.countryCode?.isNotEmpty ?? false) {
      Intl.defaultLocale = '${locale.languageCode}_${locale.countryCode}';
    } else {
      Intl.defaultLocale = locale.languageCode;
    }
    preferences.setString(
        AppConstants.preferencesKeyLocal, Intl.defaultLocale!);
    homeProvider.read.reloadListDismissible();
    router.pop();
    router.pop();
  }

  Future<String> getIntlDefaultLocale() async {
    late String defaultLocale;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.getString(AppConstants.preferencesKeyLocal) == null) {
      final languageCode = ui.window.locale.languageCode;
      final countryCode = ui.window.locale.countryCode;
      defaultLocale = languageCode;
      if (countryCode != null) {
        defaultLocale += '_$countryCode';
      } else {
        defaultLocale += AppConstants.defaultCountry;
      }
    } else {
      defaultLocale = preferences.getString(AppConstants.preferencesKeyLocal)!;
    }
    switch (Intl.defaultLocale) {
      case AppConstants.en:
        LocaleSettings.setLocale(AppLocale.en);
        break;
      case AppConstants.enBo:
        LocaleSettings.setLocale(AppLocale.enBo);
        break;
      case AppConstants.enUs:
        LocaleSettings.setLocale(AppLocale.enUs);
        break;
      case AppConstants.es:
        LocaleSettings.setLocale(AppLocale.es);
        break;
      case AppConstants.esBo:
        LocaleSettings.setLocale(AppLocale.esBo);
        break;
      case AppConstants.esUs:
        LocaleSettings.setLocale(AppLocale.esUs);
        break;
    }
    return defaultLocale;
  }
}

extension LanguageControllerExtension on BuildContext {
  Locale get language {
    return TranslationProvider.of(this).flutterLocale;
  }

  AppLocale get appLocale {
    return TranslationProvider.of(this).locale;
  }
}

final languageProvider = SimpleProvider(
  (_) => LanguageController(),
  autoDispose: false,
);
