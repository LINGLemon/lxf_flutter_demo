import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlankPage extends StatelessWidget {
  const BlankPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        '这是一个空的静态页面',
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.normal,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }
}
