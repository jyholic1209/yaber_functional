import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:flutter_yaber/controllers/auth_controller.dart';
import 'package:get/get.dart';

import '../../components/avatar_widget.dart';

class MyAccountPage extends StatelessWidget {
  const MyAccountPage({super.key});

  bool isAuthUser() {
    if (AuthController.to.authUser == null) {
      return false;
    } else if (AuthController.to.authUser!.profileThumb == null) {
      return false;
    } else if (AuthController.to.authUser!.profileThumb == '') {
      return false;
    } else {
      return true;
    }
  }

  Widget _myAvatar() {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15),
          child: isAuthUser()
              ? AvatarWidget(
                  thumbPath: AuthController.to.authUser!.profileThumb!,
                  size: 100,
                )
              : const Image(
                  image: Svg('assets/images/Default_pfp.svg'),
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
            const Column(
              children: [
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
              children: [
                const Text(
                  '아이디',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    // 데이터 변경 처리 완료. UI에 맞출 필요 있음
                    // AuthController.to.updateUser(
                    //   AuthController.to.authUser!,
                    //   nickname: 'come on',
                    // );
                  },
                  child: Text(
                    '${AuthController.to.authUser!.nickName!}  >',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Row(
              children: [
                // TODO : 빼는 것이 좋을 것 같음.
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
              children: [
                const Text(
                  '이메일',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  '${AuthController.to.authUser!.email!}  >',
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.normal),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text(
                  '국가',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  '${AuthController.to.authUser!.nationality!}  >',
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.normal),
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
                  onPressed: () => Get.back(),
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
