
import 'package:flutter/material.dart';

class FishLocalizations {

  static FishLocalizations of(BuildContext context) {
    return Localizations.of(
        context,
        FishLocalizations
    );
  }

  String get appTitle => "Fish Example";

}

class FishLocalizationsDelegate extends LocalizationsDelegate<FishLocalizations> {

  @override
  bool isSupported(Locale locale) {
    return locale.languageCode.toLowerCase().contains("en");
  }

  @override
  Future<FishLocalizations> load(Locale locale) =>
      Future(() => FishLocalizations());

  @override
  bool shouldReload(LocalizationsDelegate<FishLocalizations> old) => false;

}