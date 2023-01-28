import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider extends ChangeNotifier {
  String keyLocale = "locale";
  Locale _locale = Locale('en', 'US');
  Locale get locale => this._locale;

  // Read
  Future<bool?> readLocale() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return preferences.getBool(keyLocale);
  }

  // Save
  Future<bool?> saveLocale(bool bool) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    if (bool == true) {
      this._locale = Locale('en', 'US');
    } else {
      this._locale = Locale('id', 'ID');
    }
    notifyListeners();

    return await preferences.setBool(keyLocale, bool);
  }

  // set locale(Locale value) {
  //   this._locale = value;
  //   notifyListeners();
  // }
}
