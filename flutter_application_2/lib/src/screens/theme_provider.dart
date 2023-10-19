import 'package:flutter/material.dart';
import 'color_schemes.g.dart';

final ThemeData lightTheme =
    ThemeData(useMaterial3: true, colorScheme: lightColorScheme);
final ThemeData darkTheme =
    ThemeData(useMaterial3: true, colorScheme: darkColorScheme);

class ThemeProvider with ChangeNotifier {
  bool _isLightTheme = true;

  ThemeData get selectedTheme => _isLightTheme ? lightTheme : darkTheme;

  void toggleTheme() {
    _isLightTheme = !_isLightTheme;
    notifyListeners();
  }
}
//テーマの切り替え？