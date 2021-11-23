import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LayoutExamplePage extends StatefulWidget {
  const LayoutExamplePage({Key? key}) : super(key: key);

  @override
  LayoutExamplePageState createState() => LayoutExamplePageState();
}

class LayoutExamplePageState extends State<LayoutExamplePage> {
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
          middle: const Text('布局演示'),
          backgroundColor: Colors.blueAccent,
        ),
        child: ListView(
          children: [
            Container(
              height : 88,
              color: Colors.grey,
              child: Row(
                children: [
                  Container(
                    width: 88,
                    color: Colors.red,
                  ),
                  Container(
                    width: 88,
                    color: Colors.green,
                  ),
                  Container(
                    width: 88,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
            Container(
              height : 200,
              color: Colors.blueGrey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    color: Colors.blue,
                  ),
                  Container(
                    width: 44,
                    height: 44,
                    color: Colors.red,
                  ),
                  Container(
                    width: 44,
                    height: 44,
                    color: Colors.green,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
