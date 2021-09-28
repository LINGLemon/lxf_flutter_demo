import 'package:flutter/material.dart';
import 'package:lxf_flutter_demo/models/func_model.dart';
import 'package:lxf_flutter_demo/widgets/common_widgets.dart';

class ExampleFuncListPage extends StatefulWidget {
  const ExampleFuncListPage({Key? key}) : super(key: key);

  @override
  ExampleFuncListPageState createState() => ExampleFuncListPageState();
}

class ExampleFuncListPageState extends State<ExampleFuncListPage> {
  final List<FuncModel> _funcLists = [];

  void _initData() {
    _funcLists.add(
      FuncModel(
        name: "label",
        desc: "文本控件",
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) {
          //     return UpgradePage();
          //   }),
          // );
        },
      ),
    );
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("功能列表"),
          backgroundColor: Colors.blueAccent, //设置appbar背景颜色
          centerTitle: true, //设置标题是否局中
        ),
        body: ListView.builder(
          itemCount: _funcLists.length,
          itemBuilder: (BuildContext context, int index) {
            return _functionWidget(context, index);
          },
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
