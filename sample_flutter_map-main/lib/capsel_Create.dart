import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sample_flutter_map/capsel_Check.dart';
import 'package:sample_flutter_map/main.dart';
import 'package:sample_flutter_map/map_View.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  String _apptitle = 'カプセル埋める';
  String title = '';
  String nakami = '';

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  dynamic dateTime;

  @override
  void initState() {
    super.initState();
    dateTime = DateTime.now();
  }

//DatePicker設定画面
  _datePicker(BuildContext context) async {
    final DateTime? datePicked = await showDatePicker(
        context: context,
        initialDate: dateTime,
        firstDate: DateTime(2003),
        lastDate: DateTime(2100));
    if (datePicked != null && datePicked != dateTime) {
      setState(() {
        dateTime = datePicked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      // ),

      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 20, right: 20), //画面全体の余白

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // 垂直方向上寄せ
          children: [
            Container(
                child: ButtonBar(
                    //横並びにする
                    alignment: MainAxisAlignment.spaceBetween, //幅を等しくする
                    children: [
                  //キャンセルボタンを押した時の処理
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          //マップ画面に遷移(Navigatorpopの方がいいかも？)
                          return MapApp();
                        }),
                      );
                    },
                    child: const Text("キャンセル"),
                  ),

                  //次へボタンを押した時の処理
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          //マップ画面に遷移(Navigatorpopの方がいいかも？)
                          return Sample2();
                        }),
                      );
                    },
                    child: const Text("次へ"),
                  ),
                ])),
            Container(
              width: MediaQuery.of(context).size.width * 0.9, // 画面幅の90%に設定
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'タイトル',
                ),
                onChanged: (text) {
                  // TODO: ここで取得したtextを使う
                  title = text;
                },
              ),
            ),
            SizedBox(height: 20.0), // 適切な間隔を設定
            Container(
              width: MediaQuery.of(context).size.width * 0.9, // 画面幅の90%に設定
              child: TextField(
                decoration: InputDecoration(
                  hintText: '中身',
                ),
                onChanged: (text) {
                  // TODO: ここで取得したtextを使う
                  nakami = text;
                },
              ),
            ),

            Text("$dateTime", style: TextStyle(fontSize: 25)),

            ElevatedButton(
              onPressed: () {
                _datePicker(
                  context,
                );
              },
              child: const Text("日付を変更"),
            ),

            //仮
            Image.network('https://pbs.twimg.com/media/FfHOaRIagAAxQlC.jpg'),
          ],
        ),
      ),
    );
  }
}
