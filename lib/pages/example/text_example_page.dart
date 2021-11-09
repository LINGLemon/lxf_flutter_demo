import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lxf_flutter_demo/bloc/language_bloc.dart';
import 'package:lxf_flutter_demo/generated/l10n.dart';
import 'package:provider/src/provider.dart';

class TextExamplePage extends StatefulWidget {
  const TextExamplePage({Key? key}) : super(key: key);

  @override
  TextExamplePageState createState() => TextExamplePageState();
}

class TextExamplePageState extends State<TextExamplePage> {
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
        middle: const Text('Text'),
        backgroundColor: Colors.blueAccent,
      ),
      child: Column(
        children: [
          TextButton(
            child: const Text('中文'),
            onPressed: () {
              print('中文');
              context.read<LanguageBloc>().add(ChangeLanguageToZh());
            },
          ),
          TextButton(
            child: const Text('英文'),
            onPressed: () {
              print('英文');
              context.read<LanguageBloc>().add(ChangeLanguageToEn());
            },
          ),
          Text(
            S.of(context).hello,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.normal,
              decoration: TextDecoration.none,
            ),
          ),
          Text(S.of(context).confirm),
          Text(S.current.cancel),
          Container(height: 1, color: Colors.grey),
          const Text(
            "Text组件的使用",
            style: TextStyle(
              // 文字颜色
              color: Colors.red,
              // none 不显示装饰线条，underline 字体下方，overline 字体上方，lineThrough穿过文字
              decoration: TextDecoration.none,
              // solid 直线，double 双下划线，dotted 虚线，dashed 点下划线，wavy 波浪线
              decorationStyle: TextDecorationStyle.solid,
              // 装饰线的颜色
              decorationColor: Colors.blue,
              //Color(0x0f000000),
              // 文字大小
              fontSize: 15.0,
              // normal 正常，italic 斜体
              fontStyle: FontStyle.normal,
              // 字体的粗细
              fontWeight: FontWeight.bold,
              // 文字间的宽度
              letterSpacing: 1.0,
              // 文本行与行的高度，作为字体大小的倍数（取值1~2，如1.2）
              height: 1,
              //对齐文本的水平线:
              //TextBaseline.alphabetic：文本基线是标准的字母基线
              //TextBaseline.ideographic：文字基线是表意字基线；
              //如果字符本身超出了alphabetic 基线，那么ideograhpic基线位置在字符本身的底部。
              textBaseline: TextBaseline.alphabetic,
            ),
            // 段落的间距样式
            strutStyle: StrutStyle(
              fontFamily: 'serif',
              fontFamilyFallback: ['monospace', 'serif'],
              fontSize: 20,
              height: 2,
              leading: 2.0,
              fontWeight: FontWeight.w300,
              fontStyle: FontStyle.normal,
              forceStrutHeight: true,
              debugLabel: 'text demo',
            ),
            // 文字对齐方式
            textAlign: TextAlign.center,
            // 文字排列方向 ltr 左到右，rtl右到左
            textDirection: TextDirection.ltr,
            // 用于选择区域特定字形的语言环境
            locale: Locale('zh_CN'),
            // 软包裹 ，文字是否应该在软断行出断行
            softWrap: false,
            // 如何处理视觉溢出:clip 剪切溢出的文本以修复其容器。ellipsis 使用省略号表示文本已溢出。fade 将溢出的文本淡化为透明。
            overflow: TextOverflow.ellipsis,
            // 文字的缩放比例
            textScaleFactor: 1.0,
            // 文本要跨越的可选最大行数,
            maxLines: 2,
            // 图像的语义描述，用于向Andoid上的TalkBack和iOS上的VoiceOver提供图像描述
            semanticsLabel: 'text demo',
            textWidthBasis: TextWidthBasis.longestLine,
          ),
        ],
      ),
    );
  }
}
