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

import 'messages_en.dart' as messages_en;

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
  return messages_en.messages;
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
