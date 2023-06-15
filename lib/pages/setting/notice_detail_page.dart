import 'package:flutter/material.dart';

class NoticeDetailPage extends StatelessWidget {
  final String title;
  const NoticeDetailPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //색변경
        ),
        title: Text(title,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black)),
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('안녕하세요\n이번 업데이트에서는 아래와 같은 기능이 추가되었습니다.'),
            SizedBox(height: 20),
            Text('1번 기능 사진 업로드 1장 -> 3장'),
            Text('2번 기능 사진필터 추가'),
            SizedBox(height: 10),
            Text('감사합니다.'),
          ],
        ),
      )),
    );
  }
}
