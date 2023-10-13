import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('タイムライン画面'),
      ),
      body: const Center(
          child: Text('タイムライン画面', style: TextStyle(fontSize: 32.0))),
    );
  }
}
