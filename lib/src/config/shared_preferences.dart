import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart' as sp;

enum SharedPreferencesKey {
  RECENT_SEARCH
}

extension SharedPreferencesKeyExtension on SharedPreferencesKey {
  String get key {
    switch(this) {
      case SharedPreferencesKey.RECENT_SEARCH:
        return 'RECENT_SEARCH';
    }
  }
}

class SharedPreferences {
  static Future<bool> set(SharedPreferencesKey key, dynamic value) async {
    sp.SharedPreferences prefs = await sp.SharedPreferences.getInstance();
    bool result = false;

    if (value is int) {
      result = await prefs.setInt(key.key, value);
    } else if (value is double) {
      result = await prefs.setDouble(key.key, value);
    } else if (value is String) {
      result = await prefs.setString(key.key, value);
    } else if (value is bool) {
      result = await prefs.setBool(key.key, value);
    } else if (value is Map) {
      result = await prefs.setString(key.key, json.encode(value));
    }
    return result;
  }

  static Future<T> getOrDefault<T>(SharedPreferencesKey key, T value) async {
    return (await get<T>(key)) ?? value;
  }

  static Future<T?> get<T>(SharedPreferencesKey key) async {
    sp.SharedPreferences prefs = await sp.SharedPreferences.getInstance();
    dynamic value = prefs.get(key.key);
    if(value == null) {
      return null;
    }
    try {
      switch(T) {
        case int:
        case double:
        case String:
        case bool:
          return value as T;
        case Map:
          final String? mapString = value is String ? value : null;
          if(mapString != null) {
            final map = json.decode(mapString);
            if(map is Map) {
              return map as T;
            }
          }
          return null;
      }
    } catch(_) {
    }

    return null;
  }

  static Future<bool> remove(SharedPreferencesKey key) async {
    sp.SharedPreferences prefs = await sp.SharedPreferences.getInstance();
    return await prefs.remove(key.key);
  }
}