/// Generated file. Do not edit.
///
/// Locales: 6
/// Strings: 312 (52 per locale)
///
/// Built on 2023-02-21 at 06:33 UTC

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
	late final _TranslationsDrawerEs drawer = _TranslationsDrawerEs._(_root);
	late final _TranslationsHomeDropDownButtonEs homeDropDownButton = _TranslationsHomeDropDownButtonEs._(_root);
	late final _TranslationsLoginEs login = _TranslationsLoginEs._(_root);
	late final _TranslationsHomeModalBottomEs homeModalBottom = _TranslationsHomeModalBottomEs._(_root);
	late final _TranslationsHomeEs home = _TranslationsHomeEs._(_root);
}

// Path: drawer
class _TranslationsDrawerEs {
	_TranslationsDrawerEs._(this._root);

	final _TranslationsEs _root; // ignore: unused_field

	// Translations
	String get cancel => 'Cancelar';
	String get checkYourInternetConection => 'Revisa tu conexi??n a internet';
	String get languageAndRegion => 'Idioma y regi??n';
	String get save => 'Guardar';
}

// Path: homeDropDownButton
class _TranslationsHomeDropDownButtonEs {
	_TranslationsHomeDropDownButtonEs._(this._root);

	final _TranslationsEs _root; // ignore: unused_field

	// Translations
	String get spanish => 'Espa??ol';
	String get spanishBo => 'Espa??ol Bo';
	String get spanishUs => 'Espa??ol US';
	String get english => 'Ingl??s';
	String get englishBo => 'Ingl??s Bo';
	String get englishUs => 'Ingl??s US';
}

// Path: login
class _TranslationsLoginEs {
	_TranslationsLoginEs._(this._root);

	final _TranslationsEs _root; // ignore: unused_field

	// Translations
	String get accountExistsWithDifferentCredential => 'La cuenta existe con otro credencial';
	String get alreadyHaveAnAccount => 'Ya tienes una cuenta';
	String get dontHaveAnAccount => 'No tienes una cuenta';
	String get email => 'Correo electr??nico';
	String get emailAlreadyInUse => 'Correo electr??nico ya est?? registrado';
	String get emailSent => 'Correo electr??nico enviado';
	String get error => 'Error';
	String get forgotYourPassword => 'Olvid?? su contrase??a';
	String get good => 'Bien';
	String get invalidCredential => 'Credential inv??lido';
	String get invalidName => 'nombre inv??lido';
	String get invalidEmail => 'correo electr??nico inv??lido';
	String get internalError => 'Error interno';
	String get invalidFields => 'Campos inv??lidos';
	String get invalidPassword => 'contrase??a inv??lida';
	String get logIn => 'Acceder';
	String get logOut => 'Cerrar sesi??n';
	String get name => 'Nombre';
	String get networkRequestFailed => 'Fallo en la solicitud de red';
	String get orSignInWith => 'O accede con';
	String get orSignUpWith => 'O reg??strate con';
	String get ok => 'OK';
	String get password => 'Contrase??a';
	String get passwordDontMatch => 'no coincide la contrase??a';
	String get register => 'Registrar';
	String get send => 'Enviar';
	String get signIn => 'Iniciar sesi??n';
	String get signUp => 'Registrarse';
	String get tooManyRequest => 'Exceso de peticiones';
	String get unknwonError => 'Error desconocidor';
	String get userDisabled => 'Usuario deshabilitado';
	String get userNotFound => 'Usuario no encontrado';
	String get verificationPassword => 'Repetir contrase??a';
	String get weakPassword => 'Contrase??a muy d??bil';
	String get wrongPassword => 'Contrase??a err??nea';
}

// Path: homeModalBottom
class _TranslationsHomeModalBottomEs {
	_TranslationsHomeModalBottomEs._(this._root);

	final _TranslationsEs _root; // ignore: unused_field

	// Translations
	String get addPhoto => 'Agregar foto';
	String get editPhoto => 'Editar foto';
	String get enterValidAmount => 'Ingrese un monto v??lido';
	String get description => 'Descripci??n';
	String get price => 'Precio';
	String get saveExpense => 'Guardar gasto';
}

// Path: home
class _TranslationsHomeEs {
	_TranslationsHomeEs._(this._root);

	final _TranslationsEs _root; // ignore: unused_field

	// Translations
	String total({required Object month}) => 'Total en ${month} ';
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
	@override late final _TranslationsDrawerEn drawer = _TranslationsDrawerEn._(_root);
	@override late final _TranslationsHomeDropDownButtonEn homeDropDownButton = _TranslationsHomeDropDownButtonEn._(_root);
	@override late final _TranslationsLoginEn login = _TranslationsLoginEn._(_root);
	@override late final _TranslationsHomeModalBottomEn homeModalBottom = _TranslationsHomeModalBottomEn._(_root);
	@override late final _TranslationsHomeEn home = _TranslationsHomeEn._(_root);
}

// Path: drawer
class _TranslationsDrawerEn implements _TranslationsDrawerEs {
	_TranslationsDrawerEn._(this._root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get cancel => 'Cancel';
	@override String get checkYourInternetConection => 'Check your internet conection';
	@override String get languageAndRegion => 'Language & region';
	@override String get save => 'Save';
}

// Path: homeDropDownButton
class _TranslationsHomeDropDownButtonEn implements _TranslationsHomeDropDownButtonEs {
	_TranslationsHomeDropDownButtonEn._(this._root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get spanish => 'Spanish';
	@override String get spanishBo => 'Spanish Bo';
	@override String get spanishUs => 'Spanish US';
	@override String get english => 'English';
	@override String get englishBo => 'English Bo';
	@override String get englishUs => 'English US';
}

// Path: login
class _TranslationsLoginEn implements _TranslationsLoginEs {
	_TranslationsLoginEn._(this._root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get accountExistsWithDifferentCredential => 'Account exists with different credential';
	@override String get alreadyHaveAnAccount => 'Already have an account';
	@override String get dontHaveAnAccount => 'Don\'t have an account';
	@override String get email => 'Email';
	@override String get emailAlreadyInUse => 'Email already in use';
	@override String get emailSent => 'Email sent';
	@override String get error => 'Error';
	@override String get forgotYourPassword => 'Forgot your password';
	@override String get good => 'Good';
	@override String get invalidCredential => 'Invalid credential';
	@override String get invalidEmail => 'invalid email';
	@override String get internalError => 'Internal error';
	@override String get invalidFields => 'invalid fields';
	@override String get invalidName => 'invalid name';
	@override String get invalidPassword => 'invalid password';
	@override String get logIn => 'Log in';
	@override String get logOut => 'Log out';
	@override String get name => 'Name';
	@override String get networkRequestFailed => 'Network request failed';
	@override String get orSignInWith => 'Or sign in with';
	@override String get orSignUpWith => 'Or sign up with';
	@override String get ok => 'OK';
	@override String get password => 'Password';
	@override String get passwordDontMatch => 'password don\'t match';
	@override String get register => 'Register';
	@override String get send => 'Send';
	@override String get signIn => 'Sign in';
	@override String get signUp => 'Sing up';
	@override String get tooManyRequest => 'Too many request';
	@override String get unknwonError => 'Unknwon error';
	@override String get userDisabled => 'User disabled';
	@override String get userNotFound => 'User not found';
	@override String get verificationPassword => 'Verification password';
	@override String get weakPassword => 'Weak password';
	@override String get wrongPassword => 'Wrong password';
}

// Path: homeModalBottom
class _TranslationsHomeModalBottomEn implements _TranslationsHomeModalBottomEs {
	_TranslationsHomeModalBottomEn._(this._root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get addPhoto => 'Add photo';
	@override String get editPhoto => 'Edit photo';
	@override String get enterValidAmount => 'Enter valid amount';
	@override String get description => 'Description';
	@override String get price => 'Price';
	@override String get saveExpense => 'Save expense';
}

// Path: home
class _TranslationsHomeEn implements _TranslationsHomeEs {
	_TranslationsHomeEn._(this._root);

	@override final _TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String total({required Object month}) => 'Total of ${month} ';
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
	@override late final _TranslationsDrawerEnBo drawer = _TranslationsDrawerEnBo._(_root);
	@override late final _TranslationsHomeDropDownButtonEnBo homeDropDownButton = _TranslationsHomeDropDownButtonEnBo._(_root);
	@override late final _TranslationsLoginEnBo login = _TranslationsLoginEnBo._(_root);
	@override late final _TranslationsHomeModalBottomEnBo homeModalBottom = _TranslationsHomeModalBottomEnBo._(_root);
	@override late final _TranslationsHomeEnBo home = _TranslationsHomeEnBo._(_root);
}

// Path: drawer
class _TranslationsDrawerEnBo implements _TranslationsDrawerEs {
	_TranslationsDrawerEnBo._(this._root);

	@override final _TranslationsEnBo _root; // ignore: unused_field

	// Translations
	@override String get cancel => 'Cancel';
	@override String get checkYourInternetConection => 'Check your internet conection';
	@override String get languageAndRegion => 'Language & region';
	@override String get save => 'Save';
}

// Path: homeDropDownButton
class _TranslationsHomeDropDownButtonEnBo implements _TranslationsHomeDropDownButtonEs {
	_TranslationsHomeDropDownButtonEnBo._(this._root);

	@override final _TranslationsEnBo _root; // ignore: unused_field

	// Translations
	@override String get spanish => 'Spanish';
	@override String get spanishBo => 'Spanish Bo';
	@override String get spanishUs => 'Spanish US';
	@override String get english => 'English';
	@override String get englishBo => 'English Bo';
	@override String get englishUs => 'English US';
}

// Path: login
class _TranslationsLoginEnBo implements _TranslationsLoginEs {
	_TranslationsLoginEnBo._(this._root);

	@override final _TranslationsEnBo _root; // ignore: unused_field

	// Translations
	@override String get accountExistsWithDifferentCredential => 'Account exists with different credential';
	@override String get alreadyHaveAnAccount => 'Already have an account';
	@override String get dontHaveAnAccount => 'Don\'t have an account';
	@override String get email => 'Email';
	@override String get emailAlreadyInUse => 'Email already in use';
	@override String get emailSent => 'Email sent';
	@override String get error => 'Error';
	@override String get forgotYourPassword => 'Forgot your password';
	@override String get good => 'Good';
	@override String get invalidCredential => 'Invalid credential';
	@override String get invalidEmail => 'invalid email';
	@override String get internalError => 'Internal error';
	@override String get invalidFields => 'invalid fields';
	@override String get invalidName => 'invalid name';
	@override String get invalidPassword => 'invalid password';
	@override String get logIn => 'Log in';
	@override String get logOut => 'Log out';
	@override String get name => 'Name';
	@override String get networkRequestFailed => 'Network request failed';
	@override String get orSignInWith => 'Or sign in with';
	@override String get orSignUpWith => 'Or sign up with';
	@override String get ok => 'OK';
	@override String get password => 'Password';
	@override String get passwordDontMatch => 'password don\'t match';
	@override String get register => 'Register';
	@override String get send => 'Send';
	@override String get signIn => 'Sign in';
	@override String get signUp => 'Sing up';
	@override String get tooManyRequest => 'Too many request';
	@override String get unknwonError => 'Unknwon error';
	@override String get userDisabled => 'User disabled';
	@override String get userNotFound => 'User not found';
	@override String get verificationPassword => 'Verification password';
	@override String get weakPassword => 'Weak password';
	@override String get wrongPassword => 'Wrong password';
}

// Path: homeModalBottom
class _TranslationsHomeModalBottomEnBo implements _TranslationsHomeModalBottomEs {
	_TranslationsHomeModalBottomEnBo._(this._root);

	@override final _TranslationsEnBo _root; // ignore: unused_field

	// Translations
	@override String get addPhoto => 'Add photo';
	@override String get editPhoto => 'Edit photo';
	@override String get enterValidAmount => 'Enter valid amount';
	@override String get description => 'Description';
	@override String get price => 'Price';
	@override String get saveExpense => 'Save expense';
}

// Path: home
class _TranslationsHomeEnBo implements _TranslationsHomeEs {
	_TranslationsHomeEnBo._(this._root);

	@override final _TranslationsEnBo _root; // ignore: unused_field

	// Translations
	@override String total({required Object month}) => 'Total of ${month} ';
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
	@override late final _TranslationsDrawerEnUs drawer = _TranslationsDrawerEnUs._(_root);
	@override late final _TranslationsHomeDropDownButtonEnUs homeDropDownButton = _TranslationsHomeDropDownButtonEnUs._(_root);
	@override late final _TranslationsLoginEnUs login = _TranslationsLoginEnUs._(_root);
	@override late final _TranslationsHomeModalBottomEnUs homeModalBottom = _TranslationsHomeModalBottomEnUs._(_root);
	@override late final _TranslationsHomeEnUs home = _TranslationsHomeEnUs._(_root);
}

// Path: drawer
class _TranslationsDrawerEnUs implements _TranslationsDrawerEs {
	_TranslationsDrawerEnUs._(this._root);

	@override final _TranslationsEnUs _root; // ignore: unused_field

	// Translations
	@override String get cancel => 'Cancel';
	@override String get checkYourInternetConection => 'Check your internet conection';
	@override String get languageAndRegion => 'Language & region';
	@override String get save => 'Save';
}

// Path: homeDropDownButton
class _TranslationsHomeDropDownButtonEnUs implements _TranslationsHomeDropDownButtonEs {
	_TranslationsHomeDropDownButtonEnUs._(this._root);

	@override final _TranslationsEnUs _root; // ignore: unused_field

	// Translations
	@override String get spanish => 'Spanish';
	@override String get spanishBo => 'Spanish Bo';
	@override String get spanishUs => 'Spanish US';
	@override String get english => 'English';
	@override String get englishBo => 'English Bo';
	@override String get englishUs => 'English US';
}

// Path: login
class _TranslationsLoginEnUs implements _TranslationsLoginEs {
	_TranslationsLoginEnUs._(this._root);

	@override final _TranslationsEnUs _root; // ignore: unused_field

	// Translations
	@override String get accountExistsWithDifferentCredential => 'Account exists with different credential';
	@override String get alreadyHaveAnAccount => 'Already have an account';
	@override String get dontHaveAnAccount => 'Don\'t have an account';
	@override String get email => 'Email';
	@override String get emailAlreadyInUse => 'Email already in use';
	@override String get emailSent => 'Email sent';
	@override String get error => 'Error';
	@override String get forgotYourPassword => 'Forgot your password';
	@override String get good => 'Good';
	@override String get invalidCredential => 'Invalid credential';
	@override String get invalidEmail => 'invalid email';
	@override String get internalError => 'Internal error';
	@override String get invalidFields => 'invalid fields';
	@override String get invalidName => 'invalid name';
	@override String get invalidPassword => 'invalid password';
	@override String get logIn => 'Log in';
	@override String get logOut => 'Log out';
	@override String get name => 'Name';
	@override String get networkRequestFailed => 'Network request failed';
	@override String get orSignInWith => 'Or sign in with';
	@override String get orSignUpWith => 'Or sign up with';
	@override String get ok => 'OK';
	@override String get password => 'Password';
	@override String get passwordDontMatch => 'password don\'t match';
	@override String get register => 'Register';
	@override String get send => 'Send';
	@override String get signIn => 'Sign in';
	@override String get signUp => 'Sing up';
	@override String get tooManyRequest => 'Too many request';
	@override String get unknwonError => 'Unknwon error';
	@override String get userDisabled => 'User disabled';
	@override String get userNotFound => 'User not found';
	@override String get verificationPassword => 'Verification password';
	@override String get weakPassword => 'Weak password';
	@override String get wrongPassword => 'Wrong password';
}

// Path: homeModalBottom
class _TranslationsHomeModalBottomEnUs implements _TranslationsHomeModalBottomEs {
	_TranslationsHomeModalBottomEnUs._(this._root);

	@override final _TranslationsEnUs _root; // ignore: unused_field

	// Translations
	@override String get addPhoto => 'Add photo';
	@override String get editPhoto => 'Edit photo';
	@override String get enterValidAmount => 'Enter valid amount';
	@override String get description => 'Description';
	@override String get price => 'Price';
	@override String get saveExpense => 'Save expense';
}

// Path: home
class _TranslationsHomeEnUs implements _TranslationsHomeEs {
	_TranslationsHomeEnUs._(this._root);

	@override final _TranslationsEnUs _root; // ignore: unused_field

	// Translations
	@override String total({required Object month}) => 'Total of ${month} ';
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
	@override late final _TranslationsDrawerEsBo drawer = _TranslationsDrawerEsBo._(_root);
	@override late final _TranslationsHomeDropDownButtonEsBo homeDropDownButton = _TranslationsHomeDropDownButtonEsBo._(_root);
	@override late final _TranslationsLoginEsBo login = _TranslationsLoginEsBo._(_root);
	@override late final _TranslationsHomeModalBottomEsBo homeModalBottom = _TranslationsHomeModalBottomEsBo._(_root);
	@override late final _TranslationsHomeEsBo home = _TranslationsHomeEsBo._(_root);
}

// Path: drawer
class _TranslationsDrawerEsBo implements _TranslationsDrawerEs {
	_TranslationsDrawerEsBo._(this._root);

	@override final _TranslationsEsBo _root; // ignore: unused_field

	// Translations
	@override String get cancel => 'Cancelar';
	@override String get checkYourInternetConection => 'Revisa tu conexi??n a internet';
	@override String get languageAndRegion => 'Idioma y regi??n';
	@override String get save => 'Guardar';
}

// Path: homeDropDownButton
class _TranslationsHomeDropDownButtonEsBo implements _TranslationsHomeDropDownButtonEs {
	_TranslationsHomeDropDownButtonEsBo._(this._root);

	@override final _TranslationsEsBo _root; // ignore: unused_field

	// Translations
	@override String get spanish => 'Espa??ol';
	@override String get spanishBo => 'Espa??ol Bo';
	@override String get spanishUs => 'Espa??ol US';
	@override String get english => 'Ingl??s';
	@override String get englishBo => 'Ingl??s Bo';
	@override String get englishUs => 'Ingl??s US';
}

// Path: login
class _TranslationsLoginEsBo implements _TranslationsLoginEs {
	_TranslationsLoginEsBo._(this._root);

	@override final _TranslationsEsBo _root; // ignore: unused_field

	// Translations
	@override String get accountExistsWithDifferentCredential => 'La cuenta existe con otro credencial';
	@override String get alreadyHaveAnAccount => 'Ya tienes una cuenta';
	@override String get dontHaveAnAccount => 'No tienes una cuenta';
	@override String get email => 'Correo electr??nico';
	@override String get emailAlreadyInUse => 'Correo electr??nico ya est?? registrado';
	@override String get emailSent => 'Correo electr??nico enviado';
	@override String get error => 'Error';
	@override String get forgotYourPassword => 'Olvid?? su contrase??a';
	@override String get good => 'Bien';
	@override String get invalidCredential => 'Credential inv??lido';
	@override String get invalidName => 'nombre inv??lido';
	@override String get invalidEmail => 'correo electr??nico inv??lido';
	@override String get internalError => 'Error interno';
	@override String get invalidFields => 'Campos inv??lidos';
	@override String get invalidPassword => 'contrase??a inv??lida';
	@override String get logIn => 'Acceder';
	@override String get logOut => 'Cerrar sesi??n';
	@override String get name => 'Nombre';
	@override String get networkRequestFailed => 'Fallo en la solicitud de red';
	@override String get orSignInWith => 'O accede con';
	@override String get orSignUpWith => 'O reg??strate con';
	@override String get ok => 'OK';
	@override String get password => 'Contrase??a';
	@override String get passwordDontMatch => 'no coincide la contrase??a';
	@override String get register => 'Registrar';
	@override String get send => 'Enviar';
	@override String get signIn => 'Iniciar sesi??n';
	@override String get signUp => 'Registrarse';
	@override String get tooManyRequest => 'Exceso de peticiones';
	@override String get unknwonError => 'Error desconocidor';
	@override String get userDisabled => 'Usuario deshabilitado';
	@override String get userNotFound => 'Usuario no encontrado';
	@override String get verificationPassword => 'Repetir contrase??a';
	@override String get weakPassword => 'Contrase??a muy d??bil';
	@override String get wrongPassword => 'Contrase??a err??nea';
}

// Path: homeModalBottom
class _TranslationsHomeModalBottomEsBo implements _TranslationsHomeModalBottomEs {
	_TranslationsHomeModalBottomEsBo._(this._root);

	@override final _TranslationsEsBo _root; // ignore: unused_field

	// Translations
	@override String get addPhoto => 'Agregar foto';
	@override String get editPhoto => 'Editar foto';
	@override String get enterValidAmount => 'Ingrese un monto v??lido';
	@override String get description => 'Descripci??n';
	@override String get price => 'Precio';
	@override String get saveExpense => 'Guardar gasto';
}

// Path: home
class _TranslationsHomeEsBo implements _TranslationsHomeEs {
	_TranslationsHomeEsBo._(this._root);

	@override final _TranslationsEsBo _root; // ignore: unused_field

	// Translations
	@override String total({required Object month}) => 'Total en ${month} ';
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
	@override late final _TranslationsDrawerEsUs drawer = _TranslationsDrawerEsUs._(_root);
	@override late final _TranslationsHomeDropDownButtonEsUs homeDropDownButton = _TranslationsHomeDropDownButtonEsUs._(_root);
	@override late final _TranslationsLoginEsUs login = _TranslationsLoginEsUs._(_root);
	@override late final _TranslationsHomeModalBottomEsUs homeModalBottom = _TranslationsHomeModalBottomEsUs._(_root);
	@override late final _TranslationsHomeEsUs home = _TranslationsHomeEsUs._(_root);
}

// Path: drawer
class _TranslationsDrawerEsUs implements _TranslationsDrawerEs {
	_TranslationsDrawerEsUs._(this._root);

	@override final _TranslationsEsUs _root; // ignore: unused_field

	// Translations
	@override String get cancel => 'Cancelar';
	@override String get checkYourInternetConection => 'Revisa tu conexi??n a internet';
	@override String get languageAndRegion => 'Idioma y regi??n';
	@override String get save => 'Guardar';
}

// Path: homeDropDownButton
class _TranslationsHomeDropDownButtonEsUs implements _TranslationsHomeDropDownButtonEs {
	_TranslationsHomeDropDownButtonEsUs._(this._root);

	@override final _TranslationsEsUs _root; // ignore: unused_field

	// Translations
	@override String get spanish => 'Espa??ol';
	@override String get spanishBo => 'Espa??ol Bo';
	@override String get spanishUs => 'Espa??ol US';
	@override String get english => 'Ingl??s';
	@override String get englishBo => 'Ingl??s Bo';
	@override String get englishUs => 'Ingl??s US';
}

// Path: login
class _TranslationsLoginEsUs implements _TranslationsLoginEs {
	_TranslationsLoginEsUs._(this._root);

	@override final _TranslationsEsUs _root; // ignore: unused_field

	// Translations
	@override String get accountExistsWithDifferentCredential => 'La cuenta existe con otro credencial';
	@override String get alreadyHaveAnAccount => 'Ya tienes una cuenta';
	@override String get dontHaveAnAccount => 'No tienes una cuenta';
	@override String get email => 'Correo electr??nico';
	@override String get emailAlreadyInUse => 'Correo electr??nico ya est?? registrado';
	@override String get emailSent => 'Correo electr??nico enviado';
	@override String get error => 'Error';
	@override String get forgotYourPassword => 'Olvid?? su contrase??a';
	@override String get good => 'Bien';
	@override String get invalidCredential => 'Credential inv??lido';
	@override String get invalidName => 'nombre inv??lido';
	@override String get invalidEmail => 'correo electr??nico inv??lido';
	@override String get internalError => 'Error interno';
	@override String get invalidFields => 'Campos inv??lidos';
	@override String get invalidPassword => 'contrase??a inv??lida';
	@override String get logIn => 'Acceder';
	@override String get logOut => 'Cerrar sesi??n';
	@override String get name => 'Nombre';
	@override String get networkRequestFailed => 'Fallo en la solicitud de red';
	@override String get orSignInWith => 'O accede con';
	@override String get orSignUpWith => 'O reg??strate con';
	@override String get ok => 'OK';
	@override String get password => 'Contrase??a';
	@override String get passwordDontMatch => 'no coincide la contrase??a';
	@override String get register => 'Registrar';
	@override String get send => 'Enviar';
	@override String get signIn => 'Iniciar sesi??n';
	@override String get signUp => 'Registrarse';
	@override String get tooManyRequest => 'Exceso de peticiones';
	@override String get unknwonError => 'Error desconocidor';
	@override String get userDisabled => 'Usuario deshabilitado';
	@override String get userNotFound => 'Usuario no encontrado';
	@override String get verificationPassword => 'Repetir contrase??a';
	@override String get weakPassword => 'Contrase??a muy d??bil';
	@override String get wrongPassword => 'Contrase??a err??nea';
}

// Path: homeModalBottom
class _TranslationsHomeModalBottomEsUs implements _TranslationsHomeModalBottomEs {
	_TranslationsHomeModalBottomEsUs._(this._root);

	@override final _TranslationsEsUs _root; // ignore: unused_field

	// Translations
	@override String get addPhoto => 'Agregar foto';
	@override String get editPhoto => 'Editar foto';
	@override String get enterValidAmount => 'Ingrese un monto v??lido';
	@override String get description => 'Descripci??n';
	@override String get price => 'Precio';
	@override String get saveExpense => 'Guardar gasto';
}

// Path: home
class _TranslationsHomeEsUs implements _TranslationsHomeEs {
	_TranslationsHomeEsUs._(this._root);

	@override final _TranslationsEsUs _root; // ignore: unused_field

	// Translations
	@override String total({required Object month}) => 'Total en ${month} ';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _TranslationsEs {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'drawer.cancel': return 'Cancelar';
			case 'drawer.checkYourInternetConection': return 'Revisa tu conexi??n a internet';
			case 'drawer.languageAndRegion': return 'Idioma y regi??n';
			case 'drawer.save': return 'Guardar';
			case 'homeDropDownButton.spanish': return 'Espa??ol';
			case 'homeDropDownButton.spanishBo': return 'Espa??ol Bo';
			case 'homeDropDownButton.spanishUs': return 'Espa??ol US';
			case 'homeDropDownButton.english': return 'Ingl??s';
			case 'homeDropDownButton.englishBo': return 'Ingl??s Bo';
			case 'homeDropDownButton.englishUs': return 'Ingl??s US';
			case 'login.accountExistsWithDifferentCredential': return 'La cuenta existe con otro credencial';
			case 'login.alreadyHaveAnAccount': return 'Ya tienes una cuenta';
			case 'login.dontHaveAnAccount': return 'No tienes una cuenta';
			case 'login.email': return 'Correo electr??nico';
			case 'login.emailAlreadyInUse': return 'Correo electr??nico ya est?? registrado';
			case 'login.emailSent': return 'Correo electr??nico enviado';
			case 'login.error': return 'Error';
			case 'login.forgotYourPassword': return 'Olvid?? su contrase??a';
			case 'login.good': return 'Bien';
			case 'login.invalidCredential': return 'Credential inv??lido';
			case 'login.invalidName': return 'nombre inv??lido';
			case 'login.invalidEmail': return 'correo electr??nico inv??lido';
			case 'login.internalError': return 'Error interno';
			case 'login.invalidFields': return 'Campos inv??lidos';
			case 'login.invalidPassword': return 'contrase??a inv??lida';
			case 'login.logIn': return 'Acceder';
			case 'login.logOut': return 'Cerrar sesi??n';
			case 'login.name': return 'Nombre';
			case 'login.networkRequestFailed': return 'Fallo en la solicitud de red';
			case 'login.orSignInWith': return 'O accede con';
			case 'login.orSignUpWith': return 'O reg??strate con';
			case 'login.ok': return 'OK';
			case 'login.password': return 'Contrase??a';
			case 'login.passwordDontMatch': return 'no coincide la contrase??a';
			case 'login.register': return 'Registrar';
			case 'login.send': return 'Enviar';
			case 'login.signIn': return 'Iniciar sesi??n';
			case 'login.signUp': return 'Registrarse';
			case 'login.tooManyRequest': return 'Exceso de peticiones';
			case 'login.unknwonError': return 'Error desconocidor';
			case 'login.userDisabled': return 'Usuario deshabilitado';
			case 'login.userNotFound': return 'Usuario no encontrado';
			case 'login.verificationPassword': return 'Repetir contrase??a';
			case 'login.weakPassword': return 'Contrase??a muy d??bil';
			case 'login.wrongPassword': return 'Contrase??a err??nea';
			case 'homeModalBottom.addPhoto': return 'Agregar foto';
			case 'homeModalBottom.editPhoto': return 'Editar foto';
			case 'homeModalBottom.enterValidAmount': return 'Ingrese un monto v??lido';
			case 'homeModalBottom.description': return 'Descripci??n';
			case 'homeModalBottom.price': return 'Precio';
			case 'homeModalBottom.saveExpense': return 'Guardar gasto';
			case 'home.total': return ({required Object month}) => 'Total en ${month} ';
			default: return null;
		}
	}
}

extension on _TranslationsEn {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'drawer.cancel': return 'Cancel';
			case 'drawer.checkYourInternetConection': return 'Check your internet conection';
			case 'drawer.languageAndRegion': return 'Language & region';
			case 'drawer.save': return 'Save';
			case 'homeDropDownButton.spanish': return 'Spanish';
			case 'homeDropDownButton.spanishBo': return 'Spanish Bo';
			case 'homeDropDownButton.spanishUs': return 'Spanish US';
			case 'homeDropDownButton.english': return 'English';
			case 'homeDropDownButton.englishBo': return 'English Bo';
			case 'homeDropDownButton.englishUs': return 'English US';
			case 'login.accountExistsWithDifferentCredential': return 'Account exists with different credential';
			case 'login.alreadyHaveAnAccount': return 'Already have an account';
			case 'login.dontHaveAnAccount': return 'Don\'t have an account';
			case 'login.email': return 'Email';
			case 'login.emailAlreadyInUse': return 'Email already in use';
			case 'login.emailSent': return 'Email sent';
			case 'login.error': return 'Error';
			case 'login.forgotYourPassword': return 'Forgot your password';
			case 'login.good': return 'Good';
			case 'login.invalidCredential': return 'Invalid credential';
			case 'login.invalidEmail': return 'invalid email';
			case 'login.internalError': return 'Internal error';
			case 'login.invalidFields': return 'invalid fields';
			case 'login.invalidName': return 'invalid name';
			case 'login.invalidPassword': return 'invalid password';
			case 'login.logIn': return 'Log in';
			case 'login.logOut': return 'Log out';
			case 'login.name': return 'Name';
			case 'login.networkRequestFailed': return 'Network request failed';
			case 'login.orSignInWith': return 'Or sign in with';
			case 'login.orSignUpWith': return 'Or sign up with';
			case 'login.ok': return 'OK';
			case 'login.password': return 'Password';
			case 'login.passwordDontMatch': return 'password don\'t match';
			case 'login.register': return 'Register';
			case 'login.send': return 'Send';
			case 'login.signIn': return 'Sign in';
			case 'login.signUp': return 'Sing up';
			case 'login.tooManyRequest': return 'Too many request';
			case 'login.unknwonError': return 'Unknwon error';
			case 'login.userDisabled': return 'User disabled';
			case 'login.userNotFound': return 'User not found';
			case 'login.verificationPassword': return 'Verification password';
			case 'login.weakPassword': return 'Weak password';
			case 'login.wrongPassword': return 'Wrong password';
			case 'homeModalBottom.addPhoto': return 'Add photo';
			case 'homeModalBottom.editPhoto': return 'Edit photo';
			case 'homeModalBottom.enterValidAmount': return 'Enter valid amount';
			case 'homeModalBottom.description': return 'Description';
			case 'homeModalBottom.price': return 'Price';
			case 'homeModalBottom.saveExpense': return 'Save expense';
			case 'home.total': return ({required Object month}) => 'Total of ${month} ';
			default: return null;
		}
	}
}

extension on _TranslationsEnBo {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'drawer.cancel': return 'Cancel';
			case 'drawer.checkYourInternetConection': return 'Check your internet conection';
			case 'drawer.languageAndRegion': return 'Language & region';
			case 'drawer.save': return 'Save';
			case 'homeDropDownButton.spanish': return 'Spanish';
			case 'homeDropDownButton.spanishBo': return 'Spanish Bo';
			case 'homeDropDownButton.spanishUs': return 'Spanish US';
			case 'homeDropDownButton.english': return 'English';
			case 'homeDropDownButton.englishBo': return 'English Bo';
			case 'homeDropDownButton.englishUs': return 'English US';
			case 'login.accountExistsWithDifferentCredential': return 'Account exists with different credential';
			case 'login.alreadyHaveAnAccount': return 'Already have an account';
			case 'login.dontHaveAnAccount': return 'Don\'t have an account';
			case 'login.email': return 'Email';
			case 'login.emailAlreadyInUse': return 'Email already in use';
			case 'login.emailSent': return 'Email sent';
			case 'login.error': return 'Error';
			case 'login.forgotYourPassword': return 'Forgot your password';
			case 'login.good': return 'Good';
			case 'login.invalidCredential': return 'Invalid credential';
			case 'login.invalidEmail': return 'invalid email';
			case 'login.internalError': return 'Internal error';
			case 'login.invalidFields': return 'invalid fields';
			case 'login.invalidName': return 'invalid name';
			case 'login.invalidPassword': return 'invalid password';
			case 'login.logIn': return 'Log in';
			case 'login.logOut': return 'Log out';
			case 'login.name': return 'Name';
			case 'login.networkRequestFailed': return 'Network request failed';
			case 'login.orSignInWith': return 'Or sign in with';
			case 'login.orSignUpWith': return 'Or sign up with';
			case 'login.ok': return 'OK';
			case 'login.password': return 'Password';
			case 'login.passwordDontMatch': return 'password don\'t match';
			case 'login.register': return 'Register';
			case 'login.send': return 'Send';
			case 'login.signIn': return 'Sign in';
			case 'login.signUp': return 'Sing up';
			case 'login.tooManyRequest': return 'Too many request';
			case 'login.unknwonError': return 'Unknwon error';
			case 'login.userDisabled': return 'User disabled';
			case 'login.userNotFound': return 'User not found';
			case 'login.verificationPassword': return 'Verification password';
			case 'login.weakPassword': return 'Weak password';
			case 'login.wrongPassword': return 'Wrong password';
			case 'homeModalBottom.addPhoto': return 'Add photo';
			case 'homeModalBottom.editPhoto': return 'Edit photo';
			case 'homeModalBottom.enterValidAmount': return 'Enter valid amount';
			case 'homeModalBottom.description': return 'Description';
			case 'homeModalBottom.price': return 'Price';
			case 'homeModalBottom.saveExpense': return 'Save expense';
			case 'home.total': return ({required Object month}) => 'Total of ${month} ';
			default: return null;
		}
	}
}

extension on _TranslationsEnUs {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'drawer.cancel': return 'Cancel';
			case 'drawer.checkYourInternetConection': return 'Check your internet conection';
			case 'drawer.languageAndRegion': return 'Language & region';
			case 'drawer.save': return 'Save';
			case 'homeDropDownButton.spanish': return 'Spanish';
			case 'homeDropDownButton.spanishBo': return 'Spanish Bo';
			case 'homeDropDownButton.spanishUs': return 'Spanish US';
			case 'homeDropDownButton.english': return 'English';
			case 'homeDropDownButton.englishBo': return 'English Bo';
			case 'homeDropDownButton.englishUs': return 'English US';
			case 'login.accountExistsWithDifferentCredential': return 'Account exists with different credential';
			case 'login.alreadyHaveAnAccount': return 'Already have an account';
			case 'login.dontHaveAnAccount': return 'Don\'t have an account';
			case 'login.email': return 'Email';
			case 'login.emailAlreadyInUse': return 'Email already in use';
			case 'login.emailSent': return 'Email sent';
			case 'login.error': return 'Error';
			case 'login.forgotYourPassword': return 'Forgot your password';
			case 'login.good': return 'Good';
			case 'login.invalidCredential': return 'Invalid credential';
			case 'login.invalidEmail': return 'invalid email';
			case 'login.internalError': return 'Internal error';
			case 'login.invalidFields': return 'invalid fields';
			case 'login.invalidName': return 'invalid name';
			case 'login.invalidPassword': return 'invalid password';
			case 'login.logIn': return 'Log in';
			case 'login.logOut': return 'Log out';
			case 'login.name': return 'Name';
			case 'login.networkRequestFailed': return 'Network request failed';
			case 'login.orSignInWith': return 'Or sign in with';
			case 'login.orSignUpWith': return 'Or sign up with';
			case 'login.ok': return 'OK';
			case 'login.password': return 'Password';
			case 'login.passwordDontMatch': return 'password don\'t match';
			case 'login.register': return 'Register';
			case 'login.send': return 'Send';
			case 'login.signIn': return 'Sign in';
			case 'login.signUp': return 'Sing up';
			case 'login.tooManyRequest': return 'Too many request';
			case 'login.unknwonError': return 'Unknwon error';
			case 'login.userDisabled': return 'User disabled';
			case 'login.userNotFound': return 'User not found';
			case 'login.verificationPassword': return 'Verification password';
			case 'login.weakPassword': return 'Weak password';
			case 'login.wrongPassword': return 'Wrong password';
			case 'homeModalBottom.addPhoto': return 'Add photo';
			case 'homeModalBottom.editPhoto': return 'Edit photo';
			case 'homeModalBottom.enterValidAmount': return 'Enter valid amount';
			case 'homeModalBottom.description': return 'Description';
			case 'homeModalBottom.price': return 'Price';
			case 'homeModalBottom.saveExpense': return 'Save expense';
			case 'home.total': return ({required Object month}) => 'Total of ${month} ';
			default: return null;
		}
	}
}

extension on _TranslationsEsBo {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'drawer.cancel': return 'Cancelar';
			case 'drawer.checkYourInternetConection': return 'Revisa tu conexi??n a internet';
			case 'drawer.languageAndRegion': return 'Idioma y regi??n';
			case 'drawer.save': return 'Guardar';
			case 'homeDropDownButton.spanish': return 'Espa??ol';
			case 'homeDropDownButton.spanishBo': return 'Espa??ol Bo';
			case 'homeDropDownButton.spanishUs': return 'Espa??ol US';
			case 'homeDropDownButton.english': return 'Ingl??s';
			case 'homeDropDownButton.englishBo': return 'Ingl??s Bo';
			case 'homeDropDownButton.englishUs': return 'Ingl??s US';
			case 'login.accountExistsWithDifferentCredential': return 'La cuenta existe con otro credencial';
			case 'login.alreadyHaveAnAccount': return 'Ya tienes una cuenta';
			case 'login.dontHaveAnAccount': return 'No tienes una cuenta';
			case 'login.email': return 'Correo electr??nico';
			case 'login.emailAlreadyInUse': return 'Correo electr??nico ya est?? registrado';
			case 'login.emailSent': return 'Correo electr??nico enviado';
			case 'login.error': return 'Error';
			case 'login.forgotYourPassword': return 'Olvid?? su contrase??a';
			case 'login.good': return 'Bien';
			case 'login.invalidCredential': return 'Credential inv??lido';
			case 'login.invalidName': return 'nombre inv??lido';
			case 'login.invalidEmail': return 'correo electr??nico inv??lido';
			case 'login.internalError': return 'Error interno';
			case 'login.invalidFields': return 'Campos inv??lidos';
			case 'login.invalidPassword': return 'contrase??a inv??lida';
			case 'login.logIn': return 'Acceder';
			case 'login.logOut': return 'Cerrar sesi??n';
			case 'login.name': return 'Nombre';
			case 'login.networkRequestFailed': return 'Fallo en la solicitud de red';
			case 'login.orSignInWith': return 'O accede con';
			case 'login.orSignUpWith': return 'O reg??strate con';
			case 'login.ok': return 'OK';
			case 'login.password': return 'Contrase??a';
			case 'login.passwordDontMatch': return 'no coincide la contrase??a';
			case 'login.register': return 'Registrar';
			case 'login.send': return 'Enviar';
			case 'login.signIn': return 'Iniciar sesi??n';
			case 'login.signUp': return 'Registrarse';
			case 'login.tooManyRequest': return 'Exceso de peticiones';
			case 'login.unknwonError': return 'Error desconocidor';
			case 'login.userDisabled': return 'Usuario deshabilitado';
			case 'login.userNotFound': return 'Usuario no encontrado';
			case 'login.verificationPassword': return 'Repetir contrase??a';
			case 'login.weakPassword': return 'Contrase??a muy d??bil';
			case 'login.wrongPassword': return 'Contrase??a err??nea';
			case 'homeModalBottom.addPhoto': return 'Agregar foto';
			case 'homeModalBottom.editPhoto': return 'Editar foto';
			case 'homeModalBottom.enterValidAmount': return 'Ingrese un monto v??lido';
			case 'homeModalBottom.description': return 'Descripci??n';
			case 'homeModalBottom.price': return 'Precio';
			case 'homeModalBottom.saveExpense': return 'Guardar gasto';
			case 'home.total': return ({required Object month}) => 'Total en ${month} ';
			default: return null;
		}
	}
}

extension on _TranslationsEsUs {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'drawer.cancel': return 'Cancelar';
			case 'drawer.checkYourInternetConection': return 'Revisa tu conexi??n a internet';
			case 'drawer.languageAndRegion': return 'Idioma y regi??n';
			case 'drawer.save': return 'Guardar';
			case 'homeDropDownButton.spanish': return 'Espa??ol';
			case 'homeDropDownButton.spanishBo': return 'Espa??ol Bo';
			case 'homeDropDownButton.spanishUs': return 'Espa??ol US';
			case 'homeDropDownButton.english': return 'Ingl??s';
			case 'homeDropDownButton.englishBo': return 'Ingl??s Bo';
			case 'homeDropDownButton.englishUs': return 'Ingl??s US';
			case 'login.accountExistsWithDifferentCredential': return 'La cuenta existe con otro credencial';
			case 'login.alreadyHaveAnAccount': return 'Ya tienes una cuenta';
			case 'login.dontHaveAnAccount': return 'No tienes una cuenta';
			case 'login.email': return 'Correo electr??nico';
			case 'login.emailAlreadyInUse': return 'Correo electr??nico ya est?? registrado';
			case 'login.emailSent': return 'Correo electr??nico enviado';
			case 'login.error': return 'Error';
			case 'login.forgotYourPassword': return 'Olvid?? su contrase??a';
			case 'login.good': return 'Bien';
			case 'login.invalidCredential': return 'Credential inv??lido';
			case 'login.invalidName': return 'nombre inv??lido';
			case 'login.invalidEmail': return 'correo electr??nico inv??lido';
			case 'login.internalError': return 'Error interno';
			case 'login.invalidFields': return 'Campos inv??lidos';
			case 'login.invalidPassword': return 'contrase??a inv??lida';
			case 'login.logIn': return 'Acceder';
			case 'login.logOut': return 'Cerrar sesi??n';
			case 'login.name': return 'Nombre';
			case 'login.networkRequestFailed': return 'Fallo en la solicitud de red';
			case 'login.orSignInWith': return 'O accede con';
			case 'login.orSignUpWith': return 'O reg??strate con';
			case 'login.ok': return 'OK';
			case 'login.password': return 'Contrase??a';
			case 'login.passwordDontMatch': return 'no coincide la contrase??a';
			case 'login.register': return 'Registrar';
			case 'login.send': return 'Enviar';
			case 'login.signIn': return 'Iniciar sesi??n';
			case 'login.signUp': return 'Registrarse';
			case 'login.tooManyRequest': return 'Exceso de peticiones';
			case 'login.unknwonError': return 'Error desconocidor';
			case 'login.userDisabled': return 'Usuario deshabilitado';
			case 'login.userNotFound': return 'Usuario no encontrado';
			case 'login.verificationPassword': return 'Repetir contrase??a';
			case 'login.weakPassword': return 'Contrase??a muy d??bil';
			case 'login.wrongPassword': return 'Contrase??a err??nea';
			case 'homeModalBottom.addPhoto': return 'Agregar foto';
			case 'homeModalBottom.editPhoto': return 'Editar foto';
			case 'homeModalBottom.enterValidAmount': return 'Ingrese un monto v??lido';
			case 'homeModalBottom.description': return 'Descripci??n';
			case 'homeModalBottom.price': return 'Precio';
			case 'homeModalBottom.saveExpense': return 'Guardar gasto';
			case 'home.total': return ({required Object month}) => 'Total en ${month} ';
			default: return null;
		}
	}
}
