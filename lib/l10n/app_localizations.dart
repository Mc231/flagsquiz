import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_af.dart';
import 'app_localizations_am.dart';
import 'app_localizations_ar.dart';
import 'app_localizations_az.dart';
import 'app_localizations_bg.dart';
import 'app_localizations_bn.dart';
import 'app_localizations_bs.dart';
import 'app_localizations_ca.dart';
import 'app_localizations_cs.dart';
import 'app_localizations_cy.dart';
import 'app_localizations_da.dart';
import 'app_localizations_de.dart';
import 'app_localizations_el.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_et.dart';
import 'app_localizations_fa.dart';
import 'app_localizations_fi.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_gu.dart';
import 'app_localizations_he.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_hr.dart';
import 'app_localizations_hu.dart';
import 'app_localizations_id.dart';
import 'app_localizations_is.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ka.dart';
import 'app_localizations_kk.dart';
import 'app_localizations_kn.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_lt.dart';
import 'app_localizations_lv.dart';
import 'app_localizations_ml.dart';
import 'app_localizations_mn.dart';
import 'app_localizations_mr.dart';
import 'app_localizations_ms.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_no.dart';
import 'app_localizations_pa.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ro.dart';
import 'app_localizations_si.dart';
import 'app_localizations_sk.dart';
import 'app_localizations_sl.dart';
import 'app_localizations_sr.dart';
import 'app_localizations_sv.dart';
import 'app_localizations_sw.dart';
import 'app_localizations_ta.dart';
import 'app_localizations_te.dart';
import 'app_localizations_th.dart';
import 'app_localizations_tl.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_uk.dart';
import 'app_localizations_ur.dart';
import 'app_localizations_uz.dart';
import 'app_localizations_vi.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('af'),
    Locale('am'),
    Locale('ar'),
    Locale('az'),
    Locale('bg'),
    Locale('bn'),
    Locale('bs'),
    Locale('ca'),
    Locale('cs'),
    Locale('cy'),
    Locale('da'),
    Locale('de'),
    Locale('el'),
    Locale('en'),
    Locale('es'),
    Locale('et'),
    Locale('fa'),
    Locale('fi'),
    Locale('fr'),
    Locale('gu'),
    Locale('he'),
    Locale('hi'),
    Locale('hr'),
    Locale('hu'),
    Locale('id'),
    Locale('is'),
    Locale('it'),
    Locale('ja'),
    Locale('ka'),
    Locale('kk'),
    Locale('kn'),
    Locale('ko'),
    Locale('lt'),
    Locale('lv'),
    Locale('ml'),
    Locale('mn'),
    Locale('mr'),
    Locale('ms'),
    Locale('nl'),
    Locale('no'),
    Locale('pa'),
    Locale('pl'),
    Locale('pt'),
    Locale('ro'),
    Locale('si'),
    Locale('sk'),
    Locale('sl'),
    Locale('sr'),
    Locale('sv'),
    Locale('sw'),
    Locale('ta'),
    Locale('te'),
    Locale('th'),
    Locale('tl'),
    Locale('tr'),
    Locale('uk'),
    Locale('ur'),
    Locale('uz'),
    Locale('vi'),
    Locale('zh')
  ];

  /// text
  ///
  /// In en, this message translates to:
  /// **'Select Region'**
  String get selectRegion;

  /// text
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Europe'**
  String get europe;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Asia'**
  String get asia;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Africa'**
  String get africa;

  /// text
  ///
  /// In en, this message translates to:
  /// **'North America'**
  String get northAmerica;

  /// text
  ///
  /// In en, this message translates to:
  /// **'South America'**
  String get southAmerica;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Oceania'**
  String get oceania;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Your Score'**
  String get yourScore;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Andorra'**
  String get ad;

  /// text
  ///
  /// In en, this message translates to:
  /// **'United Arab Emirates'**
  String get ae;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Antigua and Barbuda'**
  String get ag;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Anguilla'**
  String get ai;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Afghanistan'**
  String get af;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Albania'**
  String get al;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Armenia'**
  String get am;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Angola'**
  String get ao;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Antarctica'**
  String get aq;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Argentina'**
  String get ar;

  /// text
  ///
  /// In en, this message translates to:
  /// **'American Samoa'**
  String get as;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Austria'**
  String get at;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Australia'**
  String get au;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Aruba'**
  String get aw;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Åland'**
  String get ax;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Azerbaijan'**
  String get az;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Bosnia and Herzegovina'**
  String get ba;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Barbados'**
  String get bb;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Bangladesh'**
  String get bd;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Belgium'**
  String get be;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Burkina Faso'**
  String get bf;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Bulgaria'**
  String get bg;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Bahrain'**
  String get bh;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Burundi'**
  String get bi;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Benin'**
  String get bj;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Saint Barthélemy'**
  String get bl;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Bermuda'**
  String get bm;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Brunei'**
  String get bn;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Bolivia'**
  String get bo;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Bonaire'**
  String get bq;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Brazil'**
  String get br;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Bahamas'**
  String get bs;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Bhutan'**
  String get bt;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Bouvet Island'**
  String get bv;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Botswana'**
  String get bw;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Belarus'**
  String get by;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Belize'**
  String get bz;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Canada'**
  String get ca;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Cocos [Keeling] Islands'**
  String get cc;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Democratic Republic of the Congo'**
  String get cd;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Central African Republic'**
  String get cf;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Republic of the Congo'**
  String get cg;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Switzerland'**
  String get ch;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Ivory Coast'**
  String get ci;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Cook Islands'**
  String get ck;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Chile'**
  String get cl;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Cameroon'**
  String get cm;

  /// text
  ///
  /// In en, this message translates to:
  /// **'China'**
  String get cn;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Colombia'**
  String get co;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Costa Rica'**
  String get cr;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Cuba'**
  String get cu;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Cape Verde'**
  String get cv;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Curacao'**
  String get cw;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Christmas Island'**
  String get cx;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Denmark'**
  String get dk;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Dominica'**
  String get dm;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Dominican Republic'**
  String get doZ;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Algeria'**
  String get dz;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Ecuador'**
  String get ec;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Estonia'**
  String get ee;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Egypt'**
  String get eg;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Western Sahara'**
  String get eh;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Eritrea'**
  String get er;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Spain'**
  String get es;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Ethiopia'**
  String get et;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Finland'**
  String get fi;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Fiji'**
  String get fj;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Falkland Islands'**
  String get fk;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Micronesia'**
  String get fm;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Faroe Islands'**
  String get fo;

  /// text
  ///
  /// In en, this message translates to:
  /// **'France'**
  String get fr;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Gabon'**
  String get ga;

  /// text
  ///
  /// In en, this message translates to:
  /// **'United Kingdom'**
  String get gb;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Grenada'**
  String get gd;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Georgia'**
  String get ge;

  /// text
  ///
  /// In en, this message translates to:
  /// **'French Guiana'**
  String get gf;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Guernsey'**
  String get gg;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Ghana'**
  String get gh;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Gibraltar'**
  String get gi;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Greenland'**
  String get gl;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Gambia'**
  String get gm;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Guinea'**
  String get gn;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Guadeloupe'**
  String get gp;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Equatorial Guinea'**
  String get gq;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Greece'**
  String get gr;

  /// text
  ///
  /// In en, this message translates to:
  /// **'South Georgia and the South Sandwich Islands'**
  String get gs;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Guatemala'**
  String get gt;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Guam'**
  String get gu;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Guinea-Bissau'**
  String get gw;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Guyana'**
  String get gy;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Hong Kong'**
  String get hk;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Heard Island and McDonald Islands'**
  String get hm;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Honduras'**
  String get hn;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Croatia'**
  String get hr;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Czech Republic'**
  String get cz;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Djibouti'**
  String get dj;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Cyprus'**
  String get cy;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Germany'**
  String get de;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Haiti'**
  String get ht;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Hungary'**
  String get hu;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Indonesia'**
  String get id;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Ireland'**
  String get ie;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Israel'**
  String get il;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Isle of Man'**
  String get im;

  /// text
  ///
  /// In en, this message translates to:
  /// **'India'**
  String get inZ;

  /// text
  ///
  /// In en, this message translates to:
  /// **'British Indian Ocean Territory'**
  String get io;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Iraq'**
  String get iq;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Iran'**
  String get ir;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Iceland'**
  String get isZ;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Italy'**
  String get it;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Jersey'**
  String get je;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Jamaica'**
  String get jm;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Jordan'**
  String get jo;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Japan'**
  String get jp;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Kenya'**
  String get ke;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Kyrgyzstan'**
  String get kg;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Cambodia'**
  String get kh;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Kiribati'**
  String get ki;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Comoros'**
  String get km;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Saint Kitts and Nevis'**
  String get kn;

  /// text
  ///
  /// In en, this message translates to:
  /// **'North Korea'**
  String get kp;

  /// text
  ///
  /// In en, this message translates to:
  /// **'South Korea'**
  String get kr;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Kuwait'**
  String get kw;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Cayman Islands'**
  String get ky;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Kazakhstan'**
  String get kz;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Laos'**
  String get la;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Lebanon'**
  String get lb;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Saint Lucia'**
  String get lc;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Liechtenstein'**
  String get li;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Sri Lanka'**
  String get lk;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Liberia'**
  String get lr;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Lesotho'**
  String get ls;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Lithuania'**
  String get lt;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Luxembourg'**
  String get lu;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Latvia'**
  String get lv;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Libya'**
  String get ly;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Morocco'**
  String get ma;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Monaco'**
  String get mc;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Moldova'**
  String get md;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Montenegro'**
  String get me;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Saint Martin'**
  String get mf;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Madagascar'**
  String get mg;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Marshall Islands'**
  String get mh;

  /// text
  ///
  /// In en, this message translates to:
  /// **'North Macedonia'**
  String get mk;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Mali'**
  String get ml;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Myanmar [Burma]'**
  String get mm;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Mongolia'**
  String get mn;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Macao'**
  String get mo;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Northern Mariana Islands'**
  String get mp;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Martinique'**
  String get mq;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Mauritania'**
  String get mr;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Montserrat'**
  String get ms;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Malta'**
  String get mt;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Mauritius'**
  String get mu;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Maldives'**
  String get mv;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Malawi'**
  String get mw;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Mexico'**
  String get mx;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Malaysia'**
  String get my;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Mozambique'**
  String get mz;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Namibia'**
  String get na;

  /// text
  ///
  /// In en, this message translates to:
  /// **'New Caledonia'**
  String get nc;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Niger'**
  String get ne;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Norfolk Island'**
  String get nf;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Nigeria'**
  String get ng;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Nicaragua'**
  String get ni;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Netherlands'**
  String get nl;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Norway'**
  String get no;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Nepal'**
  String get np;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Nauru'**
  String get nr;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Niue'**
  String get nu;

  /// text
  ///
  /// In en, this message translates to:
  /// **'New Zealand'**
  String get nz;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Oman'**
  String get om;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Panama'**
  String get pa;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Peru'**
  String get pe;

  /// text
  ///
  /// In en, this message translates to:
  /// **'French Polynesia'**
  String get pf;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Papua New Guinea'**
  String get pg;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Philippines'**
  String get ph;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Pakistan'**
  String get pk;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Poland'**
  String get pl;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Saint Pierre and Miquelon'**
  String get pm;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Pitcairn Islands'**
  String get pn;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Puerto Rico'**
  String get pr;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Palestine'**
  String get ps;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Portugal'**
  String get pt;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Palau'**
  String get pw;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Paraguay'**
  String get py;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Qatar'**
  String get qa;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Réunion'**
  String get re;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Romania'**
  String get ro;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Serbia'**
  String get rs;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Russia'**
  String get ru;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Rwanda'**
  String get rw;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Saudi Arabia'**
  String get sa;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Solomon Islands'**
  String get sb;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Seychelles'**
  String get sc;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Sudan'**
  String get sd;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Sweden'**
  String get se;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Singapore'**
  String get sg;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Saint Helena'**
  String get sh;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Slovenia'**
  String get si;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Svalbard and Jan Mayen'**
  String get sj;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Slovakia'**
  String get sk;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Sierra Leone'**
  String get sl;

  /// text
  ///
  /// In en, this message translates to:
  /// **'San Marino'**
  String get sm;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Senegal'**
  String get sn;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Somalia'**
  String get so;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Suriname'**
  String get sr;

  /// text
  ///
  /// In en, this message translates to:
  /// **'South Sudan'**
  String get ss;

  /// text
  ///
  /// In en, this message translates to:
  /// **'São Tomé and Príncipe'**
  String get st;

  /// text
  ///
  /// In en, this message translates to:
  /// **'El Salvador'**
  String get sv;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Sint Maarten'**
  String get sx;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Syria'**
  String get sy;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Swaziland'**
  String get sz;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Turks and Caicos Islands'**
  String get tc;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Chad'**
  String get td;

  /// text
  ///
  /// In en, this message translates to:
  /// **'French Southern Territories'**
  String get tf;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Togo'**
  String get tg;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Thailand'**
  String get th;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Tajikistan'**
  String get tj;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Tokelau'**
  String get tk;

  /// text
  ///
  /// In en, this message translates to:
  /// **'East Timor'**
  String get tl;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Turkmenistan'**
  String get tm;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Tunisia'**
  String get tn;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Tonga'**
  String get to;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Turkey'**
  String get tr;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Trinidad and Tobago'**
  String get tt;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Tuvalu'**
  String get tv;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Taiwan'**
  String get tw;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Tanzania'**
  String get tz;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Ukraine'**
  String get ua;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Uganda'**
  String get ug;

  /// text
  ///
  /// In en, this message translates to:
  /// **'U.S. Minor Outlying Islands'**
  String get um;

  /// text
  ///
  /// In en, this message translates to:
  /// **'United States'**
  String get us;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Uruguay'**
  String get uy;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Uzbekistan'**
  String get uz;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Vatican City'**
  String get va;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Saint Vincent and the Grenadines'**
  String get vc;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Venezuela'**
  String get ve;

  /// text
  ///
  /// In en, this message translates to:
  /// **'British Virgin Islands'**
  String get vg;

  /// text
  ///
  /// In en, this message translates to:
  /// **'U.S. Virgin Islands'**
  String get vi;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Vietnam'**
  String get vn;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Vanuatu'**
  String get vu;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Wallis and Futuna'**
  String get wf;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Samoa'**
  String get ws;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Kosovo'**
  String get xk;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Yemen'**
  String get ye;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Mayotte'**
  String get yt;

  /// text
  ///
  /// In en, this message translates to:
  /// **'South Africa'**
  String get za;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Zambia'**
  String get zm;

  /// text
  ///
  /// In en, this message translates to:
  /// **'Zimbabwe'**
  String get zw;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'af',
        'am',
        'ar',
        'az',
        'bg',
        'bn',
        'bs',
        'ca',
        'cs',
        'cy',
        'da',
        'de',
        'el',
        'en',
        'es',
        'et',
        'fa',
        'fi',
        'fr',
        'gu',
        'he',
        'hi',
        'hr',
        'hu',
        'id',
        'is',
        'it',
        'ja',
        'ka',
        'kk',
        'kn',
        'ko',
        'lt',
        'lv',
        'ml',
        'mn',
        'mr',
        'ms',
        'nl',
        'no',
        'pa',
        'pl',
        'pt',
        'ro',
        'si',
        'sk',
        'sl',
        'sr',
        'sv',
        'sw',
        'ta',
        'te',
        'th',
        'tl',
        'tr',
        'uk',
        'ur',
        'uz',
        'vi',
        'zh'
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'af':
      return AppLocalizationsAf();
    case 'am':
      return AppLocalizationsAm();
    case 'ar':
      return AppLocalizationsAr();
    case 'az':
      return AppLocalizationsAz();
    case 'bg':
      return AppLocalizationsBg();
    case 'bn':
      return AppLocalizationsBn();
    case 'bs':
      return AppLocalizationsBs();
    case 'ca':
      return AppLocalizationsCa();
    case 'cs':
      return AppLocalizationsCs();
    case 'cy':
      return AppLocalizationsCy();
    case 'da':
      return AppLocalizationsDa();
    case 'de':
      return AppLocalizationsDe();
    case 'el':
      return AppLocalizationsEl();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'et':
      return AppLocalizationsEt();
    case 'fa':
      return AppLocalizationsFa();
    case 'fi':
      return AppLocalizationsFi();
    case 'fr':
      return AppLocalizationsFr();
    case 'gu':
      return AppLocalizationsGu();
    case 'he':
      return AppLocalizationsHe();
    case 'hi':
      return AppLocalizationsHi();
    case 'hr':
      return AppLocalizationsHr();
    case 'hu':
      return AppLocalizationsHu();
    case 'id':
      return AppLocalizationsId();
    case 'is':
      return AppLocalizationsIs();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'ka':
      return AppLocalizationsKa();
    case 'kk':
      return AppLocalizationsKk();
    case 'kn':
      return AppLocalizationsKn();
    case 'ko':
      return AppLocalizationsKo();
    case 'lt':
      return AppLocalizationsLt();
    case 'lv':
      return AppLocalizationsLv();
    case 'ml':
      return AppLocalizationsMl();
    case 'mn':
      return AppLocalizationsMn();
    case 'mr':
      return AppLocalizationsMr();
    case 'ms':
      return AppLocalizationsMs();
    case 'nl':
      return AppLocalizationsNl();
    case 'no':
      return AppLocalizationsNo();
    case 'pa':
      return AppLocalizationsPa();
    case 'pl':
      return AppLocalizationsPl();
    case 'pt':
      return AppLocalizationsPt();
    case 'ro':
      return AppLocalizationsRo();
    case 'si':
      return AppLocalizationsSi();
    case 'sk':
      return AppLocalizationsSk();
    case 'sl':
      return AppLocalizationsSl();
    case 'sr':
      return AppLocalizationsSr();
    case 'sv':
      return AppLocalizationsSv();
    case 'sw':
      return AppLocalizationsSw();
    case 'ta':
      return AppLocalizationsTa();
    case 'te':
      return AppLocalizationsTe();
    case 'th':
      return AppLocalizationsTh();
    case 'tl':
      return AppLocalizationsTl();
    case 'tr':
      return AppLocalizationsTr();
    case 'uk':
      return AppLocalizationsUk();
    case 'ur':
      return AppLocalizationsUr();
    case 'uz':
      return AppLocalizationsUz();
    case 'vi':
      return AppLocalizationsVi();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
