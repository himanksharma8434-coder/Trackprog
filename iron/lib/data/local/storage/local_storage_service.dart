import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LocalStorageService {
  final SharedPreferences _prefs;

  LocalStorageService(this._prefs);

  Future<void> save(String key, dynamic value) async {
    final jsonString = jsonEncode(value);
    await _prefs.setString(key, jsonString);
  }

  dynamic read(String key) {
    final jsonString = _prefs.getString(key);
    if (jsonString != null) {
      return jsonDecode(jsonString);
    }
    return null;
  }
}
