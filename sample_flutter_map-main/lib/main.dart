import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sample_flutter_map/capsel_Create.dart';
import 'package:sample_flutter_map/map_View.dart';

void main() {
  runApp(
    //この下にMaterialAppを書けば動く
    MaterialApp(
      title: 'Map',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MapApp(),
    ),
  );
}
//↓こんな感じにクラスを分けるとなぜかエラー出る
/*class MyApp extends StatelessWidget {
  const MyApp({super.key});
  Widget build(BuildContext context) {
    return
  }
}*/
