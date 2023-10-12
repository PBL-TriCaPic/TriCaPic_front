import 'package:flutter/material.dart';

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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  String _apptitle = 'カプセル埋める';
  String title='';
  String nakami='';


  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  dynamic dateTime;

@override
void initState() {
  super.initState();
  dateTime = DateTime.now();
}
_datePicker(BuildContext context) async {
  final DateTime? datePicked = await showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(2003),
      lastDate: DateTime(2030));
  if (datePicked != null && datePicked != dateTime) {
    setState(() {
      dateTime = datePicked;
    });
  }
}

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
    
      body: Container(
        width: double.infinity,
        child: Column(
         children: [
          
           TextField(
              decoration: InputDecoration(
                hintText: 'タイトル',
              ),
              onChanged: (text) {
                // TODO: ここで取得したtextを使う
                title = text;
              },
            ),
           
            TextField(
              decoration: InputDecoration(
                hintText: '中身',
              ),
              onChanged: (text) {
                // TODO: ここで取得したtextを使う
                nakami = text;
              },
            ),
           
            Text("$dateTime"),

            ElevatedButton(
             onPressed: () { 
              _datePicker(context);
             },
             child: const Text("日付を変更"),
            ),

            ElevatedButton(
             onPressed: () { 
              //次へボタンを押した時の処理
             },
             child: const Text("次へ"),
            ),

            ElevatedButton(
             onPressed: () { 
              //キャンセルボタンを押した時の処理
             },
             child: const Text("キャンセル"),
            ),
             Image.network('https://pbs.twimg.com/media/FfHOaRIagAAxQlC.jpg'),
            
         ],
        ),
        
      ),
    );
  
      
    
  }
}
