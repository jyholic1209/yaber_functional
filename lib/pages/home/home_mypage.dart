import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:flutter_yaber/components/avatar_widget.dart';
import 'package:flutter_yaber/components/message_box.dart';
import 'package:flutter_yaber/components/post_widget.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';

class HomeMyPage extends StatelessWidget {
  const HomeMyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: AuthController.to.isUserProfile()
                    ? AvatarWidget(
                        thumbPath: AuthController.to.authUser!.profileThumb!,
                        size: 70,
                      )
                    : const Image(
                        image: Svg('assets/images/Default_pfp.svg',
                            size: Size(70, 70)),
                      ),
              ),
              Text(AuthController.to.authUser!.nickName!),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(
            height: 2,
            thickness: 1,
            color: Colors.black,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: () {}, child: const Text('최신순')),
              ElevatedButton(onPressed: () {}, child: const Text('지역별')),
            ],
          ),
          const SizedBox(height: 10),
          PostWidget(
            isMyPage: true,
            deleteCallback: () {
              showDialog(
                  context: context,
                  builder: (context) => MessageBox(
                        title: '경 고',
                        message: '게시물을 정말로 삭제 하시겠습니까?',
                        buttonText1: '예',
                        buttonText2: '아니오',
                        okCallback: () {
                          Get.back();
                        },
                        cancelCallback: () {
                          Get.back();
                        },
                      ));
            },
          ),
        ],
      ),
    );
  }
}
