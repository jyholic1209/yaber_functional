import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AlarmWidget extends StatelessWidget {
  AlarmWidget({super.key, required this.message, required this.imgUrl});

  final GlobalKey _containerKey = GlobalKey();
  final String message;
  final String imgUrl;
  // Size? containerSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _containerKey,
      padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(flex: 2, child: Text(message)),
          Expanded(flex: 1, child: CachedNetworkImage(imageUrl: imgUrl)),
        ],
      ),
    );
  }
}
