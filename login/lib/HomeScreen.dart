import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            'Home画面',
            style: TextStyle(
              fontSize: 24, // フォントサイズを変更
            ),
          ),
        ),
      ),
      // ここにユーザーがログイン後に表示するコンテンツを配置します。
    );
  }
}
