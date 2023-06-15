import 'package:flutter/material.dart';

import '../../components/avatar_widget.dart';

class MyAccountPage extends StatelessWidget {
  const MyAccountPage({super.key});

  Widget _myAvatar() {
    return Stack(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 15),
          child: AvatarWidget(
            thumbPath:
                'https://img.hankyung.com/photo/202304/p1065571917157860_467_thum.jpg',
            size: 100,
          ),
        ),
        Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(
                  color: Colors.cyanAccent,
                  width: 1,
                ),
              ),
              child: const Icon(
                Icons.photo_camera,
                color: Colors.black87,
                size: 30,
              ),
            ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //색변경
        ),
        title: const Text('내 계정',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
                color: Colors.black)),
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _myAvatar(),
            const SizedBox(height: 20),
            Column(
              children: const [
                Text('계정 정보',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.red)),
                Divider(
                  height: 15,
                  thickness: 1,
                  color: Colors.black,
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: const [
                Text(
                  '아이디',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  'Yabber  >',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: const [
                Text(
                  '비밀번호',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  '*********  >',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: const [
                Text(
                  '이메일',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  'abc@gmail.com  >',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: const [
                Text(
                  '국가',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  'South Korea  >',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('저장'),
                ),
                const SizedBox(width: 30),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('취소'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
