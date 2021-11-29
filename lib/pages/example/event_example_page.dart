import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EventExamplePage extends StatefulWidget {
  const EventExamplePage({Key? key}) : super(key: key);

  @override
  EventExamplePageState createState() => EventExamplePageState();
}

class EventExamplePageState extends State<EventExamplePage> {
  int index = 0;
  bool _bleFilterEnable = false;
  String printString = '';
  double moveX = 0;
  double moveY = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: Scaffold(
        appBar: CupertinoNavigationBar(
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
        body: ListView(
          children: [
            Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () => _printMsg('点击'),
                  onDoubleTap: () => _printMsg('双击'),
                  onLongPress: () => _printMsg('长按'),
                  onTapCancel: () => _printMsg('取消点击'),
                  onTapUp: (e) => _printMsg('点击抬起'),
                  onTapDown: (e) => _printMsg('按下'),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(color: Colors.blueAccent),
                    child: const Text(
                      '这是GestureDetector，点我',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    width: 150,
                    height: 100,
                    alignment: Alignment.center,
                  ),
                ),
                Text(printString),
              ],
            ),
            SizedBox(
              height: 80,
              child: Row(
                children: [
                  CupertinoButton(
                    child: Row(
                      children: const [
                        // Icon(Icons.radio_button_checked),
                        // Padding(padding: EdgeInsets.all(5)),
                        Text("CupertinoButton"),
                      ],
                    ),
                    color: Colors.blueAccent,
                    padding: const EdgeInsets.all(10),
                    disabledColor: Colors.grey,
                    onPressed: () {
                      showCupertinoDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CupertinoAlertDialog(
                            content: const Text('这是一个AlertView？'),
                            actions: [
                              // CupertinoDialogAction(
                              //   isDestructiveAction: true,
                              //   child: const Text('取消'),
                              //   onPressed: () async {
                              //     Navigator.of(context).pop();
                              //   },
                              // ),
                              // CupertinoDialogAction(
                              //   child: const Text('设置'),
                              //   onPressed: () async {
                              //     Navigator.of(context).pop();
                              //   },
                              // ),
                              CupertinoDialogAction(
                                child: const Text('确定'),
                                onPressed: () async {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            CupertinoSwitch(
              value: _bleFilterEnable,
              // activeColor: Colors.red,
              onChanged: (bool value) async {
                _bleFilterEnable = value;
                if (mounted) setState(() {});
              },
            ),
            Container(
              height: 160,
              color: Colors.grey,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    // 跟着手指移动的小球
                    left: moveX,
                    top: moveY,
                    child: GestureDetector(
                      onPanUpdate: (e) => _pan(e),
                      child: Container(
                        width: 72,
                        height: 72,
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(36)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 80,
              child: Row(
                children: [
                  CupertinoButton(
                    child: Row(
                      children: const [
                        // Icon(Icons.radio_button_checked),
                        // Padding(padding: EdgeInsets.all(5)),
                        Text("模态弹窗"),
                      ],
                    ),
                    color: Colors.blueAccent,
                    padding: const EdgeInsets.all(10),
                    disabledColor: Colors.grey,
                    onPressed: () {
                      showModal(
                        context: context,
                        //动画过渡配置
                        configuration: const FadeScaleTransitionConfiguration(
                          //阴影背景颜色
                          barrierColor: Colors.black54,
                          //打开新的Widget 的时间
                          transitionDuration: Duration(milliseconds: 1000),
                          //关闭新的Widget 的时间
                          reverseTransitionDuration: Duration(milliseconds: 1000),
                        ),
                        builder: (BuildContext context) {
                          //显示的Widget
                          return Scaffold(
                            //背景透明
                            backgroundColor: Colors.transparent,
                            body: Theme(
                              data: ThemeData(
                                //去除点击事件的水波纹效果
                                splashColor: Colors.transparent,
                                //云除点击事件的高亮效果
                                highlightColor: Colors.transparent,
                              ),
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Center(
                                  child: Image.asset("assets/images/img_profile_02_nol.png"),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _pan(DragUpdateDetails e) {
    setState(() {
      moveX += e.delta.dx;
      moveY += e.delta.dy;
    });
//    print(e);
  }

  _printMsg(String s) {
    setState(() {
      printString += ' $s';
    });
  }
}
