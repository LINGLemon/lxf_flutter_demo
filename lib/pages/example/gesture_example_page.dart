import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GestureExamplePage extends StatefulWidget {
  const GestureExamplePage({Key? key}) : super(key: key);

  @override
  GestureExamplePageState createState() => GestureExamplePageState();
}

class GestureExamplePageState extends State<GestureExamplePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: GestureDetector(
            child: const Icon(
              Icons.navigate_before,
              size: 26,
              color: Colors.white,
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          middle: const Text('事件演示'),
          backgroundColor: Colors.blueAccent,
        ),
        child: Container(),
      ),
    );
  }
}
