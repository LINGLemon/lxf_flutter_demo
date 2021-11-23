import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:lxf_flutter_demo/models/func_model.dart';
import 'package:lxf_flutter_demo/widgets/common_widgets.dart';

import 'example/gesture_example_page.dart';
import 'example/image_example_page.dart';
import 'example/text_example_page.dart';
import 'example/layout_example_page.dart';

class ExampleListPage extends StatefulWidget {
  const ExampleListPage({Key? key}) : super(key: key);

  @override
  ExampleListPageState createState() => ExampleListPageState();
}

class ExampleListPageState extends State<ExampleListPage> {
  late List<FuncModel> _funcLists = [];

  // label、图片、icon、button、column、row、stack、手势、listview
  void _initData() {
    _funcLists = [
      FuncModel(
        name: "Label",
        desc: "文本、字体、多语言演示",
        onPressed: () {
          Navigator.push(
            context,
            CupertinoPageRoute(builder: (context) {
              return const TextExamplePage();
            }),
          );
        },
      ),
      FuncModel(
        name: "Image",
        desc: "本地图片、网络图片演示",
        onPressed: () {
          Navigator.push(
            context,
            CupertinoPageRoute(builder: (context) {
              return const ImageExamplePage();
            }),
          );
        },
      ),
      FuncModel(
        name: "Layout",
        desc: "布局演示",
        onPressed: () {
          Navigator.push(
            context,
            CupertinoPageRoute(builder: (context) {
              return const LayoutExamplePage();
            }),
          );
        },
      ),
      FuncModel(
        name: "Gesture",
        desc: "点击、按钮、手势事件演示",
        onPressed: () {
          Navigator.push(
            context,
            CupertinoPageRoute(builder: (context) {
              return const GestureExamplePage();
            }),
          );
        },
      ),
    ];
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('样例'),
          backgroundColor: Colors.blueAccent,
        ),
        child: Scaffold(
          body: ListView.builder(
            itemCount: _funcLists.length,
            itemBuilder: (BuildContext context, int index) {
              return _functionWidget(context, index);
            },
          ),
        ),
      ),
    );
  }

  /// 功能widget
  Widget _functionWidget(BuildContext context, int index) {
    FuncModel funcModel = _funcLists[index];
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.all(10.0),
          title: Text(
            funcModel.name,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          subtitle: Text(
            funcModel.desc,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.grey,
            ),
          ),
          onTap: funcModel.onPressed,
        ),
        bottomWidget(),
      ],
    );
  }
}
