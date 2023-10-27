import 'package:flutter/material.dart';
import 'package:untitled/Login.dart';
import 'Signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: start(),
    );
  }
}

class start extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TriCaPic'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(100.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // 垂直方向に中央寄せ
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.5, // 画面幅の50%に設定
              child: ElevatedButton(
                onPressed: () {
                  // 以下は「Login」のボタンを押した時に呼ばれるコードを書く
                  Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Login()),
                  );
                },
                child: Text('Login'),
              ),
            ),
            SizedBox(height: 50.0), // 適切な間隔を設定
            Container(
              width: MediaQuery.of(context).size.width * 0.5, // 画面幅の50%に設定
              child: ElevatedButton(
                onPressed: () {
                  //以下は「Signup」のボタンを押した時に呼ばれるコードを書く
                  Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Signup()),
                  );
                },
                child: Text('Signup'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}