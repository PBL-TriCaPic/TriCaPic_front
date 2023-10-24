import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sample_flutter_map/capsel_Create.dart';
import 'package:sample_flutter_map/main.dart';
import 'package:sample_flutter_map/map_View.dart';

class Sample2 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('カプセル確認画面'),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      body: Row(//横並び
          children: <Widget>[
        OutlinedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                //マップ画面に遷移(Navigatorpopの方がいいかも？)
                return MyApp();
              }),
            );
          },
          child: Text('戻る'),
        ),
      ]),
    );
  }
}
