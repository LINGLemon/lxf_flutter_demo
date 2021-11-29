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
            height: 88,
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
            height: 200,
            color: Colors.blueGrey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 44,
                  height: 44,
                  color: Colors.blue,
                  constraints: const BoxConstraints(
                    maxWidth: 30,
                  ),
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
          Container(
            height: 100,
            color: Colors.grey,
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: Colors.red),
                color: Colors.green,
                borderRadius: const BorderRadius.all(Radius.circular(22.0)),
              ),
              child: const Text(
                "设置父视图的padding来控制位置",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none,
                ),
              ),
              // transform: Matrix4.rotationZ(0.3),
            ),
          ),
          Container(
            height: 100,
            color: Colors.blueGrey,
            child: Container(
              margin: const EdgeInsets.only(
                  left: 10, top: 20, right: 15, bottom: 5),
              decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: Colors.red),
                color: Colors.green,
                borderRadius: const BorderRadius.all(Radius.circular(22.0)),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.blueAccent,
                      offset: Offset(0.0, 15.0), //阴影xy轴偏移量
                      blurRadius: 15.0, //阴影模糊程度
                      spreadRadius: 1.0 //阴影扩散程度
                      )
                ],
              ),
              child: const Text(
                "设置当前视图的margin来控制位置",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
