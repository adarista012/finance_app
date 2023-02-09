import 'package:finance_app/app/ui/pages/home/controller/home_provider.dart';
import 'package:finance_app/app/utils/app_colors_theme.dart';
import 'package:finance_app/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyDropDownButton extends StatelessWidget {
  const MyDropDownButton({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<AppLocale>(
        value: TranslationProvider.of(context).locale,
        icon: const Icon(
          Icons.arrow_drop_down,
        ),
        underline: Container(
          height: 1,
          color: AppColorsTheme.white,
        ),
        onChanged: (locale) {
          if (locale != null) {
            LocaleSettings.setLocale(locale);
            if (locale.countryCode?.isNotEmpty ?? false) {
              Intl.defaultLocale =
                  '${locale.languageCode}_${locale.countryCode}';
            } else {
              Intl.defaultLocale = locale.languageCode;
            }
            homeProvider.read.reloadListDismissible();
          }
        },
        items: [
          DropdownMenuItem(
            value: AppLocale.es,
            child: Text(texts.homeDropDownButton.spanish),
          ),
          DropdownMenuItem(
            value: AppLocale.esBo,
            child: Text(texts.homeDropDownButton.spanishBo),
          ),
          DropdownMenuItem(
            value: AppLocale.esUs,
            child: Text(texts.homeDropDownButton.spanishUs),
          ),
          DropdownMenuItem(
            value: AppLocale.en,
            child: Text(texts.homeDropDownButton.english),
          ),
          DropdownMenuItem(
            value: AppLocale.enBo,
            child: Text(texts.homeDropDownButton.englishBo),
          ),
          DropdownMenuItem(
            value: AppLocale.enUs,
            child: Text(texts.homeDropDownButton.englishUs),
          ),
        ]);
  }
}
