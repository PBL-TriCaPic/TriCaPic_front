import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'theme_provider.dart';
import 'darkmode.dart';
import 'package:flutter_application_2/src/providers/preference_key.dart';
//import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application_2/src/screens/theme_provider.dart';

class Item4Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer(builder: (context, ref, child) {
          return Switch(
            value: ref.watch(isDarkProvider),
            onChanged: (val) =>
                ref.watch(isDarkProvider.notifier).toggleThemeMode(val),
          );
        }),
      ),
    );
  }
}
