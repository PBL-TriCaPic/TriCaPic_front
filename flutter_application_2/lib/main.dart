import 'package:flutter/material.dart';
import 'src/screens/color_schemes.g.dart';
import 'src/app.dart';
//import 'package:provider/provider.dart';
import 'src/screens/theme_provider.dart';
import 'package:flutter_application_2/src/providers/preference_key.dart';
import 'src/screens/darkmode.dart';
import 'src/screens/loading.dart';
import 'src/screens/setting4.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'src/screens/color.dart';

void main() {
  runApp(ProviderScope(
    child: Consumer(
      builder: (BuildContext context, ref, child) {
        return FutureBuilder(
          future: ref.watch(isDarkProvider.notifier).initialTheme(),
          builder: (context, AsyncSnapshot<ThemeData> snapshot) {
            return snapshot.hasData ? const App() : const LoadingView();
          },
        );
      },
    ),
  ));
}
