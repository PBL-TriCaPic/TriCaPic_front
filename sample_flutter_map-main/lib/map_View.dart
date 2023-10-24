import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sample_flutter_map/capsel_Create.dart';
import 'package:sample_flutter_map/main.dart';

class MapApp extends StatefulWidget {
  const MapApp({Key? key}) : super(key: key);
  @override
  State<MapApp> createState() => _MapAppState();
}

class _MapAppState extends State<MapApp> {
  String _title = 'MyMap';
  double lat = 35.995; //メモ：ここを現在地参照にする,今は諏訪市の辺り
  double lng = 138.158;
  var currentPosition; //メモ：現在地を取得する変数
  var currentHeading;
  LatLng? tapLatLng; //メモ：?はnullも許容

  List<Marker> markers = [];

  List<CircleMarker> circleMarkers = [
    //中身ないけど、削除すると現在地の●表示されなくなる
  ];

  @override
  void initState() {
    super.initState();
    /*var future = initLocation();
    future.then((newCorrentPosition) => print("get ${newCorrentPosition}"));*/
    Future<Position> newCorrentPosition = initLocation(); //現在地
    print('returnしたいもの${newCorrentPosition}');
  }

  //この関数の戻り値でlatitudeとlongtitudeの値(端末の現在地)
  Future<Position> initLocation() async {
    //メモ：多分位置を取得するのを許可している？
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    //メモ：Geo~.get~で現在地の位置情報取得し、currentPositionに代入
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentHeading = position.heading;
    currentPosition = position;
    double latitude = position.latitude; //メモ：現在地読み込み？
    double longtitude = position.longitude;
    initCircleMarker(latitude, longtitude);
    lat = latitude;
    lng = longtitude;
    setState(() {
      print('currentPositionは${Geolocator.getCurrentPosition()}で端末の場所');
    });
    return currentPosition;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),

      // flutter_map設定
      body: Container(
        child: FlutterMap(
          // マップ表示設定
          options: MapOptions(
              center: LatLng(lat, lng), //メモ:ここを変える
              zoom: 10.0,
              interactiveFlags: InteractiveFlag.all,
              enableScrollWheel: true,
              scrollWheelVelocity: 0.00001,
              onTap: (tapPosition, latLng) {
                tapLatLng = latLng;
                print(tapLatLng);
                print("↑ピンを押したところの緯度経度");
                //cleatePin(tapLatLng!);
              }),
          layers: [
            //背景地図読み込み (OSM)
            TileLayerOptions(
              urlTemplate: "https://tile.openstreetmap.jp/{z}/{x}/{y}.png",
            ),
            // サークルマーカー設定
            CircleLayerOptions(
              circles: circleMarkers,
            ),
            // ピンマーカー設定
            MarkerLayerOptions(
              markers: markers,
            ),
          ],
        ),
      ),
      //右下の青いボタンの処理
      floatingActionButton: FloatingActionButton(
        //Iconの部分を書き換えるとアイコンのデザイン変更可
        child: Icon(
          Icons.close,
          color: Colors.deepPurple,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              //カプセル作成画面に遷移
              return MyApp();
            }),
          );
        },
      ),
    );
  }

  void cleatePin(LatLng tapLatLng) {
    Marker marker = Marker(
      point: tapLatLng,
      width: 80,
      height: 80,
      builder: (context) => Container(
        child: IconButton(
          icon: Icon(
            Icons.location_on,
            size: 40,
            color: Colors.red,
          ),
          onPressed: () {
            onTapPinCallBack(tapLatLng);
          },
        ),
      ),
    );
    markers.add(marker);
    setState(() {});
  }

  Future<void> onTapPinCallBack(LatLng latLng) async {
    final tapMarker = pinReturn(latLng, pinReturn);
    markers.add(tapMarker);
    markers.removeAt(1);
    print('Pinをタップしたよ');
    setState(() {});
  }

  Marker pinReturn(LatLng tapLatLng, void tapPin) {
    return Marker(
      point: tapLatLng,
      width: 80,
      height: 80,
      builder: (context) => Container(
        child: IconButton(
          icon: Icon(
            Icons.location_on,
            size: 20,
            color: Colors.red,
          ),
          onPressed: () {
            pinReturn(tapLatLng, tapPin);
          },
        ),
      ),
    );
  }

  //メモ：端末の現在地を青色の●で表示する関数
  void initCircleMarker(double latitude, double longitude) {
    CircleMarker circleMarker = CircleMarker(
      color: Colors.indigo.withOpacity(0.9),
      radius: 10,
      borderColor: Colors.white.withOpacity(0.9),
      borderStrokeWidth: 3,
      point: LatLng(latitude, longitude),
    );
    print('initCircleMarkerはアプリ起動時に動く関数');
    //print('lat1は${lat}lng1は${lng}');
    //メモ：多分↓の行がないと●表示されない
    circleMarkers.add(circleMarker);
  }

  void pinSizeChange() {}
}
