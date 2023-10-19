import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.black87,
          child: const Center(
            child: Text(
              'Loading...',
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: 23,
                  fontStyle: FontStyle.italic),
            ),
          ),
        ),
      ),
    );
  }
}
