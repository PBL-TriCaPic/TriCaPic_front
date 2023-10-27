import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:untitled/main.dart';
import 'package:untitled/HomeScreen.dart';
import 'package:untitled/Passwordforget.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = "";
  String password = "";
  String emailError = "";
  String passwordError = "";

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Future<Map<String, dynamic>> login() async {
  //   final url = Uri.parse('http://localhost:8081/api/login');
  //   final headers = {'Content-Type': 'application/json'};
  //   final body = json.encode({
  //     "email": emailController.text,
  //     "password": passwordController.text,
  //   });
  //
  //   final response = await http.post(url, headers: headers, body: body);
  //
  //   if (response.statusCode == 200) {
  //     // リクエストが成功し、サーバーからJSON応答が返された場合
  //     return json.decode(response.body);
  //   } else {
  //     // リクエストが失敗した場合
  //     throw Exception('Failed to login');
  //   }
  // }



  // メールアドレスのバリデーションルール
  bool isEmailValid(String email) {
    // ここでバリデーションルールを定義します。正規表現を使用するのが一般的です。
    final emailRegExp = RegExp(r"^[\w-+.!#$%&'*/=?^`{|}~]+@[\w-]+(\.[\w-]+)+$");
    return emailRegExp.hasMatch(email);
  }

  bool isPasswordValid(String password) {
    final passwordRegExp = RegExp(r"^(?=.*[A-Z])[a-zA-Z0-9.?/-]{8,24}$");
    return passwordRegExp.hasMatch(password);
  }

  // ログインボタンが押された時の処理
  Future<void> handleLogin() async {
    if (!isEmailValid(email)) {
      setState(() {
        emailError = "無効なメールアドレスです";
      });
    } else {
      setState(() {
        emailError = "";
      });

      if (!isPasswordValid(password)) {
        passwordError = "大文字のアルファベットを少なくとも一つ含み、\n 8 文字以上 24 文字以下にしてください";
      } else {
        passwordError = "";
      }

      if (isEmailValid(email) && isPasswordValid(password)) {
        try {
          final loginResponse = await login(); // loginメソッドの非同期処理を待つ
          if (loginResponse['success']) {
            // ログインに成功した場合、新しいページに遷移
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          } else {
            // ログインに失敗した場合の処理
            // エラーメッセージを表示するなどの処理をここに追加
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('エラー'),
                  content: Text('ログインに失敗しました。'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('閉じる'),
                    ),
                  ],
                );
              },
            );
          }
        } catch (e) {
          // ログインに関する例外が発生した場合の処理
          // エラーメッセージを表示するなどの処理をここに追加
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('エラー'),
                content: Text('例外のエラーが発生しました。'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('閉じる'),
                  ),
                ],
              );
            },
          );
        }
      }
    }
  }

  Future<Map<String, dynamic>> login() async {
    final url = Uri.parse('http://10.0.2.2:8081/api/create/user');
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({
      "email": emailController.text,
      "password": passwordController.text,
    });

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      // リクエストが成功し、サーバーからJSON応答が返された場合
      return json.decode(response.body);
    } else {
      // リクエストが失敗した場合
      throw Exception('Failed to login');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ログイン'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            // ... emailウィジェット ...
            TextField(
              decoration: InputDecoration(
                labelText: 'e-mail',
                errorText: emailError.isNotEmpty ? emailError : null, // エラーメッセージを表示
              ),
              onChanged: (value) {
                setState(() {
                  email = value;
                  isEmailValid(email);
                });
              },
            ),
            // ... パスワードフィールドなど ...
            TextField(
              decoration: InputDecoration(
                labelText: 'password',
                errorText: passwordError.isNotEmpty ? passwordError : null,
              ),
              obscureText: true,
              onChanged: (value) {
                setState(() {
                  password = value;
                  // パスワードのバリデーションを呼び出す
                  isPasswordValid(password);
                });
              },
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
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => start()),
                      );
                    },
                    child: Text('戻る'),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.4, // 画面幅の40%に設定
                  child: ElevatedButton(
                    onPressed: () {
                      handleLogin();
                      login();
                    },
                    child: Text('ログイン'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}