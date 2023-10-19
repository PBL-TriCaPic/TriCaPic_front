import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/theme_provider.dart';

class Item3Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
        theme: themeProvider.selectedTheme,
        home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back), // バックアイコン
              onPressed: () {
                Navigator.of(context).pop(); // バックボタンが押されたときの処理を記述
              },
            ),
            title: const Text('プライバシー設定'),
          ),
          body: const Center(
              child: Text('鍵垢設定など（ここにパスワードやメアドの変更とかもまとめていいかも？）',
                  style: TextStyle(fontSize: 32.0))),
        ));
  }
}
