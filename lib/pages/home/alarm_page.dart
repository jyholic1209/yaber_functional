import 'package:flutter/material.dart';
import 'package:flutter_yaber/components/alarm_widget.dart';
import 'package:get/get.dart';

class AlarmPage extends StatelessWidget {
  const AlarmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '알람',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.w800, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        leading: Builder(
          builder: (context) {
            return IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(
                  Icons.arrow_back_sharp,
                  color: Colors.black,
                ));
          },
        ),
      ),
      body: ListView(
        children: [
          AlarmWidget(
              message: 'Apple님이 회원님의 게시글을 좋아합니다.',
              imgUrl: 'https://source.unsplash.com/random/300×300/?people'),
          AlarmWidget(
              message: 'Ahnpho님이 회원님의 게시글을 댓글을 입력했습니다.',
              imgUrl: 'https://source.unsplash.com/random/300×300/?car'),
          AlarmWidget(
              message: '게시글 규제 정책 위반으로 게시글이 삭제 되었습니다.',
              imgUrl: 'https://source.unsplash.com/random/300×300/?robot'),
        ],
      ),
    );
  }
}
