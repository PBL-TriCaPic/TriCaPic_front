import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/theme_provider.dart';
import 'setting1.dart';
import 'setting2.dart';
import 'setting3.dart';
import 'setting4.dart';
//import 'package:flutter_svg/flutter_svg.dart';
//import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      //theme: themeProvider.selectedTheme,
      // theme: lightTheme,
      // darkTheme: darkTheme,
      //title: 'Flutter Demo',
      //home: const AccountScreen(title: 'Flutter Demo Home Page'),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  //const MyHomePage({super.key, required this.title});
  //final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _light = true;

  void _toggleTheme() {
    setState(() {
      _light = !_light;
    });
  }

  final List listTiles = <Widget>[
    const ListTile(title: Text('item1')),
    const ListTile(title: Text('item2')),
    const ListTile(title: Text('item3')),
    const ListTile(title: Text('item4')),
  ];

  @override
  Widget build(BuildContext context) {
    ThemeData selectedTheme = _light ? lightTheme : darkTheme;
    return MaterialApp(
        theme: selectedTheme,
        home: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text('マイページ'),
              elevation: 3,
              shadowColor: Colors.black,
            ),
            endDrawer: Drawer(
              child: ListView(
                children: <Widget>[
                  DrawerHeader(
                    child: Container(
                      height: 100, // 高さを指定
                      child: const Text(
                        "設定",
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                  ListTile(
                    title: const Text("メアド・パスワード"),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Item1Screen(), // 遷移先の画面を指定
                        ),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text("起動時デフォルト"),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Item2Screen(), // 遷移先の画面を指定
                        ),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text("プライバシー"),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Item3Screen(), // 遷移先の画面を指定
                        ),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text("モード"),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Item4Screen(), // 遷移先の画面を指定
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            body: Column(
              children: [
                const Center(
                    child: Text('Map画面', style: TextStyle(fontSize: 32.0))),
                Switch(
                  value: _light,
                  onChanged: (bool value) {
                    _toggleTheme();
                  },
                ),
              ],
            )));
  }
}
