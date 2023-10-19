import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'screens/account.dart';
import 'screens/Mapd.dart';
import 'screens/search.dart';
import 'screens/test.dart';
import 'screens/color_schemes.g.dart';
import 'screens/theme_provider.dart';

import 'package:flutter_application_2/src/providers/preference_key.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'screens/loading.dart';
import 'screens/setting4.dart';
import 'screens/darkmode.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  //bool _light = true;
  //ThemeData selectedTheme = lightTheme;
  // void _toggleTheme() {
  //   setState(() {
  //     _light = !_light;
  //   });
  // }

  static const _screens = [
    MapScreen(),
    TestScreen(),
    NotificationScreen(),
    AccountScreen()
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //ThemeData selectedTheme = Provider.of<ThemeProvider>(context).selectedTheme;
    return Scaffold(
        body: _screens[_selectedIndex],
        bottomNavigationBar: Theme(
            data: ThemeData(splashFactory: NoSplash.splashFactory),
            child: BottomNavigationBar(
              //backgroundColor: selectedTheme.primaryColor,
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              unselectedItemColor: Colors.grey, //Colors.grey,
              selectedItemColor:
                  Color.fromARGB(255, 0, 0, 0), //Color.fromARGB(255, 0, 0, 0),
              iconSize: 28,
              selectedIconTheme: const IconThemeData(size: 28),
              items: [
                const BottomNavigationBarItem(
                    icon: Icon(
                      Icons.map_outlined,
                    ),
                    label: '',
                    activeIcon: Icon(Icons.map)),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/Post.svg',
                      width: 23,
                      height: 23,
                      color: Colors.grey,
                    ),
                    label: '',
                    activeIcon: SvgPicture.asset(
                      'assets/PostActive.svg',
                      width: 24,
                      height: 24,
                      color: Color.fromARGB(255, 0, 0, 0),
                    )),
                const BottomNavigationBarItem(
                    icon: Icon(Icons.search_sharp),
                    label: '',
                    activeIcon: Icon(Icons.search_sharp)),
                const BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle_outlined),
                    label: '',
                    activeIcon: Icon(Icons.account_circle_rounded)),
              ],
              type: BottomNavigationBarType.fixed,
            )));
  }
}
