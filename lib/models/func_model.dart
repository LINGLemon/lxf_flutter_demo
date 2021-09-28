import 'package:flutter/material.dart';

/// name : ""
/// desc : ""

class FuncModel {
  FuncModel({String name = "default", String desc = "", VoidCallback? onPressed}) {
    _name = name;
    _desc = desc;
    _onPressed = onPressed;
  }

  FuncModel.fromJson(dynamic json) {
    _name = json['name']?json['name'] : "default";
    _desc = json['desc']?json['desc'] : "default";
  }

  late String _name;
  late String _desc;
  VoidCallback? _onPressed;

  String get name => _name;

  String get desc => _desc;

  VoidCallback? get onPressed => _onPressed;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['desc'] = _desc;
    return map;
  }
}
