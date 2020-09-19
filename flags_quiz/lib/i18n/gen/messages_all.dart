// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that looks up messages for specific locales by
// delegating to the appropriate library.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:implementation_imports, file_names, unnecessary_new
// ignore_for_file:unnecessary_brace_in_string_interps, directives_ordering
// ignore_for_file:argument_type_not_assignable, invalid_assignment
// ignore_for_file:prefer_single_quotes, prefer_generic_function_type_aliases
// ignore_for_file:comment_references

import 'dart:async';

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';
import 'package:intl/src/intl_helpers.dart';

import 'messages_mt.dart' as messages_mt;
import 'messages_no.dart' as messages_no;
import 'messages_ur.dart' as messages_ur;
import 'messages_vi.dart' as messages_vi;
import 'messages_nl.dart' as messages_nl;
import 'messages_ms.dart' as messages_ms;
import 'messages_la.dart' as messages_la;
import 'messages_tr.dart' as messages_tr;
import 'messages_lb.dart' as messages_lb;
import 'messages_ar.dart' as messages_ar;
import 'messages_ka.dart' as messages_ka;
import 'messages_ru.dart' as messages_ru;
import 'messages_fr.dart' as messages_fr;
import 'messages_ga.dart' as messages_ga;
import 'messages_hy.dart' as messages_hy;
import 'messages_sr.dart' as messages_sr;
import 'messages_sv.dart' as messages_sv;
import 'messages_el.dart' as messages_el;
import 'messages_fa.dart' as messages_fa;
import 'messages_pl.dart' as messages_pl;
import 'messages_hi.dart' as messages_hi;
import 'messages_ja.dart' as messages_ja;
import 'messages_en.dart' as messages_en;
import 'messages_et.dart' as messages_et;
import 'messages_iw.dart' as messages_iw;
import 'messages_he.dart' as messages_he;
import 'messages_hr.dart' as messages_hr;
import 'messages_pt.dart' as messages_pt;
import 'messages_kk.dart' as messages_kk;
import 'messages_it.dart' as messages_it;
import 'messages_de.dart' as messages_de;
import 'messages_sl.dart' as messages_sl;
import 'messages_da.dart' as messages_da;
import 'messages_fi.dart' as messages_fi;
import 'messages_hu.dart' as messages_hu;
import 'messages_ko.dart' as messages_ko;
import 'messages_es.dart' as messages_es;
import 'messages_ro.dart' as messages_ro;
import 'messages_sk.dart' as messages_sk;
import 'messages_is.dart' as messages_is;
import 'messages_id.dart' as messages_id;
import 'messages_uz.dart' as messages_uz;
import 'messages_bs.dart' as messages_bs;
import 'messages_mk.dart' as messages_mk;
import 'messages_be.dart' as messages_be;
import 'messages_ca.dart' as messages_ca;
import 'messages_th.dart' as messages_th;
import 'messages_bg.dart' as messages_bg;
import 'messages_ne.dart' as messages_ne;
import 'messages_uk.dart' as messages_uk;
import 'messages_tl.dart' as messages_tl;
import 'messages_az.dart' as messages_az;
import 'messages_cs.dart' as messages_cs;

typedef Future<dynamic> LibraryLoader();
Map<String, LibraryLoader> _deferredLibraries = {
  'mt': () => new Future.value(null),
  'no': () => new Future.value(null),
  'ur': () => new Future.value(null),
  'vi': () => new Future.value(null),
  'nl': () => new Future.value(null),
  'ms': () => new Future.value(null),
  'la': () => new Future.value(null),
  'tr': () => new Future.value(null),
  'lb': () => new Future.value(null),
  'ar': () => new Future.value(null),
  'ka': () => new Future.value(null),
  'ru': () => new Future.value(null),
  'fr': () => new Future.value(null),
  'ga': () => new Future.value(null),
  'hy': () => new Future.value(null),
  'sr': () => new Future.value(null),
  'sv': () => new Future.value(null),
  'el': () => new Future.value(null),
  'fa': () => new Future.value(null),
  'pl': () => new Future.value(null),
  'hi': () => new Future.value(null),
  'ja': () => new Future.value(null),
  'en': () => new Future.value(null),
  'et': () => new Future.value(null),
  'iw': () => new Future.value(null),
  'he': () => new Future.value(null),
  'hr': () => new Future.value(null),
  'pt': () => new Future.value(null),
  'kk': () => new Future.value(null),
  'it': () => new Future.value(null),
  'de': () => new Future.value(null),
  'sl': () => new Future.value(null),
  'da': () => new Future.value(null),
  'fi': () => new Future.value(null),
  'hu': () => new Future.value(null),
  'ko': () => new Future.value(null),
  'es': () => new Future.value(null),
  'ro': () => new Future.value(null),
  'sk': () => new Future.value(null),
  'is': () => new Future.value(null),
  'id': () => new Future.value(null),
  'uz': () => new Future.value(null),
  'bs': () => new Future.value(null),
  'mk': () => new Future.value(null),
  'be': () => new Future.value(null),
  'ca': () => new Future.value(null),
  'th': () => new Future.value(null),
  'bg': () => new Future.value(null),
  'ne': () => new Future.value(null),
  'uk': () => new Future.value(null),
  'tl': () => new Future.value(null),
  'az': () => new Future.value(null),
  'cs': () => new Future.value(null),
};

MessageLookupByLibrary _findExact(String localeName) {
  switch (localeName) {
    case 'mt':
      return messages_mt.messages;
    case 'no':
      return messages_no.messages;
    case 'ur':
      return messages_ur.messages;
    case 'vi':
      return messages_vi.messages;
    case 'nl':
      return messages_nl.messages;
    case 'ms':
      return messages_ms.messages;
    case 'la':
      return messages_la.messages;
    case 'tr':
      return messages_tr.messages;
    case 'lb':
      return messages_lb.messages;
    case 'ar':
      return messages_ar.messages;
    case 'ka':
      return messages_ka.messages;
    case 'ru':
      return messages_ru.messages;
    case 'fr':
      return messages_fr.messages;
    case 'ga':
      return messages_ga.messages;
    case 'hy':
      return messages_hy.messages;
    case 'sr':
      return messages_sr.messages;
    case 'sv':
      return messages_sv.messages;
    case 'el':
      return messages_el.messages;
    case 'fa':
      return messages_fa.messages;
    case 'pl':
      return messages_pl.messages;
    case 'hi':
      return messages_hi.messages;
    case 'ja':
      return messages_ja.messages;
    case 'en':
      return messages_en.messages;
    case 'et':
      return messages_et.messages;
    case 'iw':
      return messages_iw.messages;
    case 'he':
      return messages_he.messages;
    case 'hr':
      return messages_hr.messages;
    case 'pt':
      return messages_pt.messages;
    case 'kk':
      return messages_kk.messages;
    case 'it':
      return messages_it.messages;
    case 'de':
      return messages_de.messages;
    case 'sl':
      return messages_sl.messages;
    case 'da':
      return messages_da.messages;
    case 'fi':
      return messages_fi.messages;
    case 'hu':
      return messages_hu.messages;
    case 'ko':
      return messages_ko.messages;
    case 'es':
      return messages_es.messages;
    case 'ro':
      return messages_ro.messages;
    case 'sk':
      return messages_sk.messages;
    case 'is':
      return messages_is.messages;
    case 'id':
      return messages_id.messages;
    case 'uz':
      return messages_uz.messages;
    case 'bs':
      return messages_bs.messages;
    case 'mk':
      return messages_mk.messages;
    case 'be':
      return messages_be.messages;
    case 'ca':
      return messages_ca.messages;
    case 'th':
      return messages_th.messages;
    case 'bg':
      return messages_bg.messages;
    case 'ne':
      return messages_ne.messages;
    case 'uk':
      return messages_uk.messages;
    case 'tl':
      return messages_tl.messages;
    case 'az':
      return messages_az.messages;
    case 'cs':
      return messages_cs.messages;
    default:
      return null;
  }
}

/// User programs should call this before using [localeName] for messages.
Future<bool> initializeMessages(String localeName) async {
  var availableLocale = Intl.verifiedLocale(
    localeName,
    (locale) => _deferredLibraries[locale] != null,
    onFailure: (_) => null);
  if (availableLocale == null) {
    return new Future.value(false);
  }
  var lib = _deferredLibraries[availableLocale];
  await (lib == null ? new Future.value(false) : lib());
  initializeInternalMessageLookup(() => new CompositeMessageLookup());
  messageLookup.addLocale(availableLocale, _findGeneratedMessagesFor);
  return new Future.value(true);
}

bool _messagesExistFor(String locale) {
  try {
    return _findExact(locale) != null;
  } catch (e) {
    return false;
  }
}

MessageLookupByLibrary _findGeneratedMessagesFor(String locale) {
  var actualLocale = Intl.verifiedLocale(locale, _messagesExistFor,
      onFailure: (_) => null);
  if (actualLocale == null) return null;
  return _findExact(actualLocale);
}
