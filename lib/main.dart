import 'package:flutter/material.dart';
import 'color_schemes.a.dart';

void main() {
  runApp(const MyApp());
}

final ThemeData lightTheme =
    ThemeData(useMaterial3: true, colorScheme: lightColorScheme);
final ThemeData darkTheme =
    ThemeData(useMaterial3: true, colorScheme: darkColorScheme);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const MyHomePage(title: 'm3'),
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
  double _currentSliderValue = 20;
  bool _light = true;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

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
          title: Text(widget.title),
        ),
        body: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 120),
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 64),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
              ElevatedButton(
                  onPressed: () {}, child: const Text('ElevatedButton')),
              Slider(
                value: _currentSliderValue,
                max: 100,
                divisions: 5,
                label: _currentSliderValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValue = value;
                  });
                },
              ),
              Switch(
                value: _light,
                onChanged: (bool value) {
                  _toggleTheme();
                },
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
        bottomNavigationBar: NavigationBar(
          destinations: const [
            Icon(Icons.list),
            Icon(Icons.home),
            Icon(Icons.settings),
          ],
        ),
      ),
    );
  }
}
