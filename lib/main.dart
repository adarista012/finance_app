import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/number_symbols.dart';
import 'package:intl/number_symbols_data.dart';
import 'app/my_app.dart';
import 'dart:ui' as ui;
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  if (ui.window.locale.countryCode?.isNotEmpty ?? false) { 
    Intl.defaultLocale =
        '${ui.window.locale.languageCode}_${ui.window.locale.countryCode}';
  } else {
    Intl.defaultLocale = ui.window.locale.languageCode;
  }

  numberFormatSymbols['es_BO'] = const NumberSymbols(
    NAME: "es_BO",
    DECIMAL_SEP: '.',
    GROUP_SEP: ',',
    PERCENT: '%',
    ZERO_DIGIT: '00',
    PLUS_SIGN: '+',
    MINUS_SIGN: '-',
    EXP_SYMBOL: 'E',
    PERMILL: '\u2030',
    INFINITY: '\u221E',
    NAN: 'NaN',
    DECIMAL_PATTERN: '#,##0.###',
    SCIENTIFIC_PATTERN: '#E0',
    PERCENT_PATTERN: '#,##0\u00A0%',
    CURRENCY_PATTERN: '#,##0.00 \u00A4',
    DEF_CURRENCY_CODE: 'Bs.',
  );

  numberFormatSymbols['en_BO'] = const NumberSymbols(
    NAME: "en_BO",
    DECIMAL_SEP: '.',
    GROUP_SEP: ',',
    PERCENT: '%',
    ZERO_DIGIT: '00',
    PLUS_SIGN: '+',
    MINUS_SIGN: '-',
    EXP_SYMBOL: 'E',
    PERMILL: '\u2030',
    INFINITY: '\u221E',
    NAN: 'NaN',
    DECIMAL_PATTERN: '#,##0.###',
    SCIENTIFIC_PATTERN: '#E0',
    PERCENT_PATTERN: '#,##0\u00A0%',
    CURRENCY_PATTERN: '#,##0.00 \u00A4',
    DEF_CURRENCY_CODE: 'Bs.',
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'antonio',
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}
