/// Generated file. Do not edit.
///
/// Locales: 6
/// Strings: 6 (1 per locale)
///
/// Built on 2023-01-21 at 08:10 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.es;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.es) // set locale
/// - Locale locale = AppLocale.es.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.es) // locale check
enum AppLocale with BaseAppLocale<AppLocale, _TranslationsEs> {
	es(languageCode: 'es', build: _TranslationsEs.build),
	en(languageCode: 'en', build: _TranslationsEn.build),
	enBo(languageCode: 'en', countryCode: 'BO', build: _TranslationsEnBo.build),
	enUs(languageCode: 'en', countryCode: 'US', build: _TranslationsEnUs.build),
	esBo(languageCode: 'es', countryCode: 'BO', build: _TranslationsEsBo.build),
	esUs(languageCode: 'es', countryCode: 'US', build: _TranslationsEsUs.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, _TranslationsEs> build;

	/// Gets current instance managed by [LocaleSettings].
	_TranslationsEs get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of texts).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = texts.someKey.anotherKey;
/// String b = texts['someKey.anotherKey']; // Only for edge cases!
_TranslationsEs get texts => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final texts = Translations.of(context); // Get texts variable.
/// String a = texts.someKey.anotherKey; // Use texts variable.
/// String b = texts['someKey.anotherKey']; // Only for edge cases!
class Translations {
	Translations._(); // no constructor

	static _TranslationsEs of(BuildContext context) => InheritedLocaleData.of<AppLocale, _TranslationsEs>(context).translations;
}

/// The provider for method B
class TranslationProvider extends BaseTranslationProvider<AppLocale, _TranslationsEs> {
	TranslationProvider({required super.child}) : super(
		initLocale: LocaleSettings.instance.currentLocale,
		initTranslations: LocaleSettings.instance.currentTranslations,
	);

	static InheritedLocaleData<AppLocale, _TranslationsEs> of(BuildContext context) => InheritedLocaleData.of<AppLocale, _TranslationsEs>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.texts.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	_TranslationsEs get texts => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, _TranslationsEs> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale) => instance.setLocale(locale);
	static AppLocale setLocaleRaw(String rawLocale) => instance.setLocaleRaw(rawLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, _TranslationsEs> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class _TranslationsEs implements BaseTranslations<AppLocale, _TranslationsEs> {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_TranslationsEs.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.es,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <es>.
	@override final TranslationMetadata<AppLocale, _TranslationsEs> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final _TranslationsEs _root = this; // ignore: unused_field

	// Translations
	late final _TranslationsHomeEs home = _TranslationsHomeEs._(_root);
}

// Path: home
class _TranslationsHomeEs {
	_TranslationsHomeEs._(this._root);

	final _TranslationsEs _root; // ignore: unused_field

	// Translations
	String get total => 'total es';
}

// Path: <root>
class _TranslationsEn implements _TranslationsEs {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_TranslationsEn.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, _TranslationsEs> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _TranslationsEn _root = this; // ignore: unused_field

	// Translations
	@override late final _TranslationsHomeEn home = _TranslationsHomeEn._(_root);
}

// Path: home
class _TranslationsHomeEn implements _TranslationsHomeEs {
	_TranslationsHomeEn._(this._root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get total => 'total en';
}

// Path: <root>
class _TranslationsEnBo implements _TranslationsEs {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_TranslationsEnBo.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.enBo,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en-BO>.
	@override final TranslationMetadata<AppLocale, _TranslationsEs> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _TranslationsEnBo _root = this; // ignore: unused_field

	// Translations
	@override late final _TranslationsHomeEnBo home = _TranslationsHomeEnBo._(_root);
}

// Path: home
class _TranslationsHomeEnBo implements _TranslationsHomeEs {
	_TranslationsHomeEnBo._(this._root);

	@override final _TranslationsEnBo _root; // ignore: unused_field

	// Translations
	@override String get total => 'total en_BO';
}

// Path: <root>
class _TranslationsEnUs implements _TranslationsEs {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_TranslationsEnUs.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.enUs,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en-US>.
	@override final TranslationMetadata<AppLocale, _TranslationsEs> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _TranslationsEnUs _root = this; // ignore: unused_field

	// Translations
	@override late final _TranslationsHomeEnUs home = _TranslationsHomeEnUs._(_root);
}

// Path: home
class _TranslationsHomeEnUs implements _TranslationsHomeEs {
	_TranslationsHomeEnUs._(this._root);

	@override final _TranslationsEnUs _root; // ignore: unused_field

	// Translations
	@override String get total => 'total en_US';
}

// Path: <root>
class _TranslationsEsBo implements _TranslationsEs {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_TranslationsEsBo.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.esBo,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <es-BO>.
	@override final TranslationMetadata<AppLocale, _TranslationsEs> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _TranslationsEsBo _root = this; // ignore: unused_field

	// Translations
	@override late final _TranslationsHomeEsBo home = _TranslationsHomeEsBo._(_root);
}

// Path: home
class _TranslationsHomeEsBo implements _TranslationsHomeEs {
	_TranslationsHomeEsBo._(this._root);

	@override final _TranslationsEsBo _root; // ignore: unused_field

	// Translations
	@override String get total => 'total es_BO';
}

// Path: <root>
class _TranslationsEsUs implements _TranslationsEs {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_TranslationsEsUs.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.esUs,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <es-US>.
	@override final TranslationMetadata<AppLocale, _TranslationsEs> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _TranslationsEsUs _root = this; // ignore: unused_field

	// Translations
	@override late final _TranslationsHomeEsUs home = _TranslationsHomeEsUs._(_root);
}

// Path: home
class _TranslationsHomeEsUs implements _TranslationsHomeEs {
	_TranslationsHomeEsUs._(this._root);

	@override final _TranslationsEsUs _root; // ignore: unused_field

	// Translations
	@override String get total => 'total es_US';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _TranslationsEs {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'home.total': return 'total es';
			default: return null;
		}
	}
}

extension on _TranslationsEn {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'home.total': return 'total en';
			default: return null;
		}
	}
}

extension on _TranslationsEnBo {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'home.total': return 'total en_BO';
			default: return null;
		}
	}
}

extension on _TranslationsEnUs {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'home.total': return 'total en_US';
			default: return null;
		}
	}
}

extension on _TranslationsEsBo {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'home.total': return 'total es_BO';
			default: return null;
		}
	}
}

extension on _TranslationsEsUs {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'home.total': return 'total es_US';
			default: return null;
		}
	}
}
