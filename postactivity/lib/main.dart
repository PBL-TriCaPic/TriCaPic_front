import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
  String title='';
  String nakami='';

  //--位置情報取得-----------------------------------------------------------------------------------------

  String _location="";
  Future<void> getLocation() async {
    // 現在の位置を返す
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print("緯度: " + position.latitude.toString());
    // 東経がプラス、西経がマイナス
    print("経度: " + position.longitude.toString());

    setState(() {
      _location=position.toString();
    });
  }
 //-------------------------------------------------------------------------------------------
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
        padding: const EdgeInsets.only(top: 40, left: 20,right: 20),//画面全体の余白
       
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // 垂直方向上寄せ
         children: [
          
          Container(
            child: ButtonBar(//横並びにする
               alignment: MainAxisAlignment.spaceBetween,//幅を等しくする
              children: [

                //キャンセルボタン
                ElevatedButton(
                   onPressed: () { 
                    //キャンセルボタンを押した時の処理
                     },
                     child: const Text("キャンセル"),
                ),

                //次へボタン
                ElevatedButton(
                 onPressed: () { 
                  //次へボタンを押した時の処理
                },
                  child: const Text("次へ"),
               ),
              ]
            ) 
          ),
          Container(
             width: MediaQuery.of(context).size.width * 0.9, // 画面幅の90%に設定
             child:  TextField(
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
            
            Text(
              "$dateTime",
            style: TextStyle(
              fontSize: 25
            )),

            ElevatedButton(
             onPressed: () { 
              _datePicker(
                context,
              );
             },
             child: const Text("日付を変更"),
            ),

            //位置情報取得ボタン
            ElevatedButton(
             onPressed: () { 
                getLocation();
              
             },
             child: const Text("位置情報取得"),
            ),

            Image.network(
              'https://pbs.twimg.com/media/FfHOaRIagAAxQlC.jpg',
              width: 50,
              height: 100,
            ),

            //位置情報テキスト
            Text('$_location'),   
            
         ],
        ),
        
      ),
    );
  
      
    
  }
}
