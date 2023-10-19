import 'package:flutter/material.dart';
import 'color_schemes.g.dart';
import 'package:flutter_application_2/src/providers/preference_key.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// final ThemeData lightTheme =
//     ThemeData(useMaterial3: true, colorScheme: lightColorScheme);
// final ThemeData darkTheme =
//     ThemeData(useMaterial3: true, colorScheme: darkColorScheme);

final ThemeData lightTheme = ThemeData.light()
    .copyWith(useMaterial3: true, colorScheme: lightColorScheme);
final ThemeData darkTheme =
    ThemeData.dark().copyWith(useMaterial3: true, colorScheme: darkColorScheme);

final isDarkProvider = StateNotifierProvider<ThemeModeController, bool>(
    (_) => ThemeModeController());

class ThemeModeController extends StateNotifier<bool> {
  ThemeModeController() : super(false);

  void toggleThemeMode(bool val) {
    state = val;
    PreferenceKey.isDark.setBool(val);
  }

  Future<void> loadTheme() async {
    final isDark = await PreferenceKey.isDark.getBool(defaultVal: false);
    state = isDark;
  }

  Future<ThemeData> initialTheme() async {
    final isDark = await PreferenceKey.isDark.getBool(defaultVal: false);
    state = isDark;
    return isDark ? darkTheme : lightTheme;
  }
}

final themeModeProvider = FutureProvider<ThemeData>((ref) async {
  await ref.watch(isDarkProvider.notifier).loadTheme();
  return ref.watch(isDarkProvider) ? darkTheme : lightTheme;
});

// Future<ThemeData> initialTheme() async {
//   final isDark = await PreferenceKey.isDark.getBool(defaultVal: false);
//   //state = isDark;
//   return isDark ? darkTheme : lightTheme;
// }

//class ThemeProvider with ChangeNotifier {
//   bool _isLightTheme = true;

//   ThemeData get selectedTheme => _isLightTheme ? lightTheme : darkTheme;

//   void toggleTheme() {
//     _isLightTheme = !_isLightTheme;
//     notifyListeners();
//   }
// }
//テーマの切り替え？