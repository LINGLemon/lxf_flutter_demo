import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HttpExamplePage extends StatefulWidget {
  const HttpExamplePage({Key? key}) : super(key: key);

  @override
  _HttpExamplePageState createState() => _HttpExamplePageState();
}

class _HttpExamplePageState extends State<HttpExamplePage> {
  String _text = "";
  var dio = Dio();

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
          middle: const Text('http请求演示'),
          backgroundColor: Colors.blueAccent,
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              SizedBox(
                height: 80,
                child: Row(
                  children: [
                    ElevatedButton(
                      child: const Text("get"),
                      onPressed: () {
                        dio.get<String>("http://httpbin.org/get").then((r) {
                          setState(() {
                            _text = r.data!;
                          });
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 80,
                child: Row(
                  children: [
                    ElevatedButton(
                      child: const Text("post"),
                      onPressed: () {
                        var formData = FormData.fromMap({
                          'file': MultipartFile.fromString('x' * 1024 * 1024),
                        });
                        dio
                            .post(
                          "http://httpbin.org/post",
                          data: formData,
                          options:
                              Options(sendTimeout: 2000, receiveTimeout: 0),
                          onSendProgress: (a, b) => print('send ${a / b}'),
                          onReceiveProgress: (a, b) =>
                              print('received ${a / b}'),
                        )
                            .then((r) {
                          setState(() {
                            _text = r.headers.toString();
                          });
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 600,
                child: SingleChildScrollView(
                  child: Text(_text),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
