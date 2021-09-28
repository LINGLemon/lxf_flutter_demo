import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lxf_flutter_demo/pages/blank_page.dart';
import 'package:lxf_flutter_demo/pages/example_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        currentIndex: 0,
        items: [
          _bottomNavigationBarItem(Icons.list, "样例"),
          _bottomNavigationBarItem(Icons.settings, "设置"),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return const ExampleFuncListPage();
          default:
            return const BlankPage();
        }
      },
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem(
      IconData icon, String title) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      activeIcon: Icon(icon),
      label: title,
    );
  }
}
