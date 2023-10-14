import 'package:flutter/material.dart';
import 'package:untitled/Passwordforget.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text('TriCaPic'),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Image.asset('asset/img/TriCaPiclogo.PNG'),
                TextField(
                    decoration: InputDecoration(
                        labelText: 'e-mail'
                    )
                ),
                TextField(
                  decoration: InputDecoration(
                      labelText: 'password'
                  ),
                  obscureText: true,
                ),
                Container(
                  margin: EdgeInsets.all(8.0), // プロパティ同士の間に8.0のマージンを追加
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black, // 枠の色を設定
                      width: 2.0, // 枠の幅を設定
                    ),
                    borderRadius: BorderRadius.circular(8.0), // 枠の角を丸める場合は適切な値を設定
                  ),
                  child: TextButton(
                    onPressed: () {
                      // ここに「パスワードを忘れた人」のボタンを押した時に呼ばれるコードを書く
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Passwordforget()),
                      );
                    },
                    child: Text('パスワードを忘れた人'),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4, // 画面幅の40%に設定
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('戻る'),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4, // 画面幅の40%に設定
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('ログイン'),
                      ),
                    ),
                  ],
                ),
              ],
            )
        )
    );
  }
}