import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';

class ImageExamplePage extends StatefulWidget {
  const ImageExamplePage({Key? key}) : super(key: key);

  @override
  ImageExamplePageState createState() => ImageExamplePageState();
}

class ImageExamplePageState extends State<ImageExamplePage> {
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
        middle: const Text('图片演示'),
        backgroundColor: Colors.blueAccent,
      ),
      child: ListView(
        children: [
          const Text(
            '这是加载网络图片的轮播器',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.normal,
              decoration: TextDecoration.none,
            ),
          ),
          SizedBox(
            height: 86,
            child: Swiper(
              autoplay: true,
              itemHeight: 86.0,
              itemBuilder: (context, index) {
                int i = index + 1;
                String imgUrl = "http://iaelemon.cn/m/img/banner$i.png";
                if (index == 0) {
                  imgUrl = "http://iaelemon.cn/m/img/banner.png";
                }
                return CachedNetworkImage(
                  imageUrl: imgUrl,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      const CupertinoActivityIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                );
              },
              itemCount: 4,
              pagination: const SwiperPagination(),
              // control: const SwiperControl(),
            ),
          ),
          const Text(
            '这是本地加载的图片',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.normal,
              decoration: TextDecoration.none,
            ),
          ),
          Image.asset('assets/images/img_profile_01_nol.png',
              width: 64, height: 64),
          const Text(
            '这是网络加载的图片',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.normal,
              decoration: TextDecoration.none,
            ),
          ),
          CachedNetworkImage(
            imageUrl: "http://iaelemon.cn/m/img/online.png",
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(value: downloadProgress.progress),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ],
      ),
    );
  }
}
