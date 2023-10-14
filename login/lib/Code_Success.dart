import 'package:flutter/material.dart';

class Code_Success extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('コード認証'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(60.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // 垂直方向に中央寄せ
          children: [
            Align(
              alignment: Alignment.center,
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'コード入力',
                ),
              ),
            ),
            SizedBox(height: 50.0), // 適切な間隔を設定
            Container(
              width: MediaQuery.of(context).size.width * 0.4, // 画面幅の40%に設定
              child: ElevatedButton(
                onPressed: () {
                  // 以下は「入力完了」のボタンを押した時に呼ばれるコードを書く
                  //Navigator.of(context).push(
                    //MaterialPageRoute(builder: (context) => Passwordforget()),
                  //);
                },
                child: Text('入力完了'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}