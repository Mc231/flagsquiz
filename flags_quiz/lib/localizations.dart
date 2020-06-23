import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import 'l10n/messages_all.dart';

class AppLocalizations {
  AppLocalizations(this.localeName);

  static Future<AppLocalizations> load(Locale locale) {
    final name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      return AppLocalizations(localeName);
    });
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  final String localeName;

  // Main Screen
  String get start {
    return Intl.message(
      'Start',
      name: 'start',
      locale: localeName,
    );
  }

  String get records {
    return Intl.message(
      'Records',
      name: 'records',
      locale: localeName,
    );
  }

  String get about {
    return Intl.message(
      'About',
      name: 'about',
      locale: localeName,
    );
  }

  // Regions Screen
  String get selectRegion {
    return Intl.message(
      'Select Region',
      name: 'selectRegion',
      locale: localeName,
    );
  }

  String get all {
    return Intl.message(
      'All',
      name: 'all',
      locale: localeName,
    );
  }

  String get europe {
    return Intl.message(
      'Europe',
      name: 'europe',
      locale: localeName,
    );
  }

  String get asia {
    return Intl.message(
      'Asia',
      name: 'asia',
      locale: localeName,
    );
  }

  String get africa {
    return Intl.message(
      'Africa',
      name: 'africa',
      locale: localeName,
    );
  }

  String get northAmerica {
    return Intl.message(
      'North America',
      name: 'northAmerica',
      locale: localeName,
    );
  }

  String get southAmerica {
    return Intl.message(
      'South America',
      name: 'southAmerica',
      locale: localeName,
    );
  }

  String get oceania {
    return Intl.message(
      'Oceania',
      name: 'oceania',
      locale: localeName,
    );
  }

  /// Result Alert

  String get yourScore {
    return Intl.message(
      'Your Score',
      name: 'yourScore',
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
