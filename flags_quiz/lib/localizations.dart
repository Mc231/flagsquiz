import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import 'l10n/messages_all.dart';


class AppLocalizations {

  AppLocalizations(this.localeName);

  static Future<AppLocalizations> load(Locale locale) {
    final name = locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      return AppLocalizations(localeName);
    });
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  final String localeName;

  String get start {
    return Intl.message(
      'Start',
      name: 'start',
      desc: 'Title of start button',
      locale: localeName,
    );
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'uk'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    return AppLocalizations.load(locale);
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}