import 'package:flutter/material.dart';
import 'package:flutter_yaber/components/avatar_widget.dart';
import 'package:flutter_yaber/controllers/signup_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_yaber/pages/signup/signup_page.dart';

class InfoAgree extends StatelessWidget {
  const InfoAgree({super.key});

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

  Widget _infoTable() {
    return Container(
      width: Get.width * 0.8,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.black,
          ),
          right: BorderSide(
            width: 1,
            color: Colors.black,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          TableRowWidget('아이디*'),
          TableRowWidget('이메일*'),
          TableRowWidget('비밀번호 *'),
          TableRowWidget('비밀번호 재입력*'),
          TableRowWidget('국가*'),
        ],
      ),
    );
  }

  bool _isAgree() {
    var isTermCheck = Get.find<SignupController>().isPrivateCheck.value;
    var isLocCheck = Get.find<SignupController>().isLocationCheck.value;
    if (isTermCheck && isLocCheck) {
      return true;
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _myAvatar(),
            const SizedBox(height: 30),
            _infoTable(),
            ElevatedButton(
                onPressed: () {
                  if (_isAgree()) {
                    Get.find<SignupController>().infoPageCheck(true);
                    tabKey.currentState?.next();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('먼저 필수 약관을 확인하세요')),
                    );
                  }
                },
                child: const Text('저 장'))
          ],
        ),
      ),
    );
  }
}

class TableRowWidget extends StatelessWidget {
  final String title;
  const TableRowWidget(
    this.title, {
    super.key,
  });

  bool buttonHide() {
    if (title == '국가*') {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    var isHide = buttonHide();
    return Row(
      children: [
        Container(
          width: 120,
          height: 50,
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                width: 1,
                color: Colors.black,
              ),
              left: BorderSide(
                width: 1,
                color: Colors.black,
              ),
            ),
          ),
          child: Center(child: Text(title)),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            height: 50,
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  width: 1,
                  color: Colors.black,
                ),
                left: BorderSide(
                  width: 1,
                  color: Colors.black,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: isHide ? 150 : 200,
                  height: 35,
                  child: const TextField(
                    decoration: InputDecoration(
                        hintText: '항목을 입력해 주세요',
                        contentPadding: EdgeInsets.symmetric(vertical: 2),
                        border: OutlineInputBorder()),
                    style: TextStyle(fontSize: 13),
                    maxLines: 1,
                    minLines: 1,
                  ),
                ),
                SizedBox(
                  width: isHide ? 45 : 0,
                  height: 33,
                  child: isHide
                      ? ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(0)),
                          child: const Text(
                            '검색',
                            style: TextStyle(fontSize: 12),
                          ),
                          onPressed: () {},
                        )
                      : null,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
