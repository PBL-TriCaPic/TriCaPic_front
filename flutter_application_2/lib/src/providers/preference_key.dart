import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_application_2/src/screens/theme_provider.dart';
import 'package:flutter_application_2/src/screens/setting4.dart';

enum PreferenceKey {
  isDark,
}

extension PreferenceKeyExt on PreferenceKey {
  String get keyString {
    switch (this) {
      case PreferenceKey.isDark:
        return 'is_dark';
    }
  }

  Future<bool> setBool(bool val) async {
    final pref = await SharedPreferences.getInstance();
    return pref.setBool(keyString, val);
  }

  Future<bool> getBool({required bool defaultVal}) async {
    final pref = await SharedPreferences.getInstance();
    if (pref.containsKey(keyString)) {
      return pref.getBool(keyString) ?? defaultVal;
    } else {
      return defaultVal;
    }
  }
}
