import 'package:flutter/material.dart';
import 'color_schemes.g.dart';
//import 'package:flutter_svg/flutter_svg.dart';
//import 'package:flutter_riverpod/flutter_riverpod.dart';

final ThemeData lightTheme =
    ThemeData(useMaterial3: true, colorScheme: lightColorScheme);
final ThemeData darkTheme =
    ThemeData(useMaterial3: true, colorScheme: darkColorScheme);

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      title: 'Flutter Demo',
      home: const HomeScreen(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});
  final String title;
  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  bool _light = true;

  void _toggleTheme() {
    setState(() {
      _light = !_light;
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData selectedTheme = _light ? lightTheme : darkTheme;

    return MaterialApp(
        theme: selectedTheme,
        home: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.white,
              title: Image.asset(
                'assets/TriCaPic_logo.png',
                height: 200,
                width: 200,
              ),
              elevation: 3,
              shadowColor: Colors.black,
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
