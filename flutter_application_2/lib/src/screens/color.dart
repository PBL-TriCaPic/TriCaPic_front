import 'package:flutter/material.dart';
import 'package:flutter_application_2/src/app.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'account.dart';
import 'Mapd.dart';
import 'search.dart';
import 'test.dart';
import 'color_schemes.g.dart';
import 'theme_provider.dart';

import 'package:flutter_application_2/src/providers/preference_key.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'loading.dart';
import 'setting4.dart';
import 'darkmode.dart';

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<ThemeData> themeData = ref.watch(themeModeProvider);
    return themeData.when(
      data: (themeData) {
        return MaterialApp(
          theme: themeData,
          home: MyApp(), //Item4Screen(),
        );
      },
      error: (error, stack) => Text('$error'),
      loading: () => const LoadingView(),
    );
  }
}
