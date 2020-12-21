import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLanguage extends ChangeNotifier {
  final String langDef = 'vi';
  Locale _appLocale;

  Locale get appLocal => _appLocale ?? Locale(langDef);

  fetchLocale() async {
    var prefs = await SharedPreferences.getInstance();
    if (prefs.getString('language_code') == null) {
      _appLocale = Locale(langDef);
      return Null;
    }
    _appLocale = Locale(prefs.getString('language_code'));
    return Null;
  }

  Future<String> currentLanguage() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString('language_code');
  }

  void changeLanguage(Locale type) async {
    var prefs = await SharedPreferences.getInstance();
    if (_appLocale == type) {
      return;
    }
    if (type == Locale("vi")) {
      _appLocale = Locale("vi");
      await prefs.setString('language_code', 'vi');
      await prefs.setString('countryCode', '');
    } else {
      _appLocale = Locale("en");
      await prefs.setString('language_code', 'en');
      await prefs.setString('countryCode', 'US');
    }
    notifyListeners();
  }
}
