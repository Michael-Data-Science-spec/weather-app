import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

String textLocalizer(String message, context) {
  Locale locale = Localizations.localeOf(context);

  String defaultSearchText = Intl.message(
    message,
    locale: locale.languageCode,
    name: 'defaultSearchText',
    desc: 'Default text for the search field',
  );
  return defaultSearchText;
}
