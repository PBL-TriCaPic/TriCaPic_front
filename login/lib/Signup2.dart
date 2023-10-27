import 'package:flutter/material.dart';
import 'HomeScreen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Signup2 extends StatefulWidget {
  @override
  _Signup2State createState() => _Signup2State();
}

class _Signup2State extends State<Signup2> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  String password = "";
  String passwordError = "";

  bool isPasswordValid(String password) {
    final passwordRegExp = RegExp(r"^(?=.*[A-Z])[a-zA-Z0-9.?/-]{8,24}$");
    return passwordRegExp.hasMatch(password);
  }

  Future<bool> createUser() async {
    final url = Uri.parse('http://localhost:8081/api/create/user');
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({
      'userId': "@${usernameController.text}",
      'password': passwordController,
      'name': usernameController.text,
    });

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      // リクエストが成功し、サーバーから 'true' が返された場合
      return response.body == 'true';
    } else {
      // リクエストが失敗した場合
      throw Exception('Failed to create user');
      //passwordError = 'ユーザーの作成に失敗しました';
    }
  }


  // 入力完了ボタンが押された時の処理
  void handleclear() async {
    setState(() async {
      if (!isPasswordValid(password)) {
        passwordError = "大文字のアルファベットを少なくとも一つ含み、\n 8 文字以上 24 文字以下にしてください";
      } else {
        passwordError = "";
      }

      String password1 = passwordController.text;
      String rePassword = rePasswordController.text;

      if (password1 == rePassword && passwordError.isEmpty) {
        final success = await createUser();
        if (success) {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        } else {
          // ユーザーの作成に失敗した場合の処理をここに追加
        }
      } else {
        // パスワードが一致しないか、パスワードエラーがある場合、ユーザに通知するなどの処理を追加
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('エラー'),
              content: Text('パスワードが一致しない、もしくはパスワードが適切ではありません。'),
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
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('サインアップ'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                  decoration: InputDecoration(
                      labelText: 'username'
                  )
              ),
              SizedBox(height: 50.0),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'password',
                  errorText: passwordError.isNotEmpty ? passwordError : null,
                ),
                onChanged: (value) {
                  setState(() {
                    password = value;
                    // パスワードのバリデーションを呼び出す
                    isPasswordValid(password);
                  });
                },
              ),
              TextField(
                controller: rePasswordController,
                decoration: InputDecoration(
                  labelText: 're password',
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                child: ElevatedButton(
                  onPressed: () {
                    handleclear();
                    createUser();
                  },
                  child: Text('入力完了'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}