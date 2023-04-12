/// Generated file. Do not edit.
///
/// Locales: 2
/// Strings: 30 (15 per locale)
///
/// Built on 2023-04-03 at 14:46 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, _StringsEn> {
	en(languageCode: 'en', build: _StringsEn.build),
	ru(languageCode: 'ru', build: _StringsRu.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, _StringsEn> build;

	/// Gets current instance managed by [LocaleSettings].
	_StringsEn get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
_StringsEn get t => LocaleSettings.instance.currentTranslations;

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
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class Translations {
	Translations._(); // no constructor

	static _StringsEn of(BuildContext context) => InheritedLocaleData.of<AppLocale, _StringsEn>(context).translations;
}

/// The provider for method B
class TranslationProvider extends BaseTranslationProvider<AppLocale, _StringsEn> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, _StringsEn> of(BuildContext context) => InheritedLocaleData.of<AppLocale, _StringsEn>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	_StringsEn get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, _StringsEn> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
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
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, _StringsEn> {
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
class _StringsEn implements BaseTranslations<AppLocale, _StringsEn> {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsEn.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
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
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final _StringsEn _root = this; // ignore: unused_field

	// Translations
	late final _StringsNavbarEn navbar = _StringsNavbarEn._(_root);
	late final _StringsSettingsEn settings = _StringsSettingsEn._(_root);
}

// Path: navbar
class _StringsNavbarEn {
	_StringsNavbarEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get homepage => 'Home';
	String get castompage => 'CastomPage';
	String get profile => 'Profile';
}

// Path: settings
class _StringsSettingsEn {
	_StringsSettingsEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Settings';
	String get general_settings => 'General';
	String get language => 'Language';
	String get visual_settings => 'Visual';
	String get theme_mode => 'Theme';
	String get system_theme => 'System';
	String get dark_theme => 'Dark';
	String get light_theme => 'Light';
	String get seed_color => 'Colors';
	String get dynamic_color => 'Dynamic';
	String get static_color => 'Static';
	String get static_color_picker => 'Accent colors';
}

// Path: <root>
class _StringsRu implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsRu.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.ru,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ru>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _StringsRu _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsNavbarRu navbar = _StringsNavbarRu._(_root);
	@override late final _StringsSettingsRu settings = _StringsSettingsRu._(_root);
}

// Path: navbar
class _StringsNavbarRu implements _StringsNavbarEn {
	_StringsNavbarRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get homepage => 'Главная';
	@override String get castompage => 'Кастомная';
	@override String get profile => 'Профиль';
}

// Path: settings
class _StringsSettingsRu implements _StringsSettingsEn {
	_StringsSettingsRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Настройки';
	@override String get general_settings => 'Основные';
	@override String get language => 'Язык';
	@override String get visual_settings => 'Визуал';
	@override String get theme_mode => 'Тема';
	@override String get system_theme => 'Системная';
	@override String get dark_theme => 'Темная';
	@override String get light_theme => 'Светлая';
	@override String get seed_color => 'Цвета';
	@override String get dynamic_color => 'Динамические';
	@override String get static_color => 'Статические';
	@override String get static_color_picker => 'Акцентные цвета';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _StringsEn {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'navbar.homepage': return 'Home';
			case 'navbar.castompage': return 'CastomPage';
			case 'navbar.profile': return 'Profile';
			case 'settings.title': return 'Settings';
			case 'settings.general_settings': return 'General';
			case 'settings.language': return 'Language';
			case 'settings.visual_settings': return 'Visual';
			case 'settings.theme_mode': return 'Theme';
			case 'settings.system_theme': return 'System';
			case 'settings.dark_theme': return 'Dark';
			case 'settings.light_theme': return 'Light';
			case 'settings.seed_color': return 'Colors';
			case 'settings.dynamic_color': return 'Dynamic';
			case 'settings.static_color': return 'Static';
			case 'settings.static_color_picker': return 'Accent colors';
			default: return null;
		}
	}
}

extension on _StringsRu {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'navbar.homepage': return 'Главная';
			case 'navbar.castompage': return 'Кастомная';
			case 'navbar.profile': return 'Профиль';
			case 'settings.title': return 'Настройки';
			case 'settings.general_settings': return 'Основные';
			case 'settings.language': return 'Язык';
			case 'settings.visual_settings': return 'Визуал';
			case 'settings.theme_mode': return 'Тема';
			case 'settings.system_theme': return 'Системная';
			case 'settings.dark_theme': return 'Темная';
			case 'settings.light_theme': return 'Светлая';
			case 'settings.seed_color': return 'Цвета';
			case 'settings.dynamic_color': return 'Динамические';
			case 'settings.static_color': return 'Статические';
			case 'settings.static_color_picker': return 'Акцентные цвета';
			default: return null;
		}
	}
}
