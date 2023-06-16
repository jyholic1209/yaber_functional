import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_yaber/controllers/signup_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_yaber/pages/signup/signup_page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class InfoAgree extends StatefulWidget {
  InfoAgree({super.key});

  @override
  State<InfoAgree> createState() => _InfoAgreeState();
}

class _InfoAgreeState extends State<InfoAgree> {
  File? pickedImage;

  final ImagePicker _picker = ImagePicker();

  Future<void> _onProfileImage(
    ImageSource source, {
    required BuildContext context,
  }) async {
    if (context.mounted) {
      try {
        final XFile? pickedFile = await _picker.pickImage(
          source: source,
        );
        pickedImage = pickedFile == null ? null : File(pickedFile.path);
      } catch (e) {
        print(e.toString());
      }
    }
  }

  Widget _myAvatar() {
    const double imageSize = 100;
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Container(
            width: imageSize,
            height: imageSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(Get.context!).indicatorColor,
              image: pickedImage == null
                  ? const DecorationImage(
                      // image: AssetImage('assets/images/profile.jpeg'),
                      image: Svg('assets/images/Default_pfp.svg'))
                  : DecorationImage(image: FileImage(pickedImage!)),
            ),
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
                color: Theme.of(Get.context!).focusColor,
                border: Border.all(
                  color: Theme.of(Get.context!).cardColor,
                  width: 1,
                ),
              ),
              child: GestureDetector(
                onTap: () async {
                  await _onProfileImage(ImageSource.gallery,
                      context: Get.context!);
                  setState(() {});
                },
                child: const Icon(
                  Icons.photo_camera,
                  color: Colors.black87,
                  size: 30,
                ),
              ),
            ))
      ],
    );
  }

  Widget _infoTable() {
    return Container(
      width: Get.width * 0.9,
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
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
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
          width: 100,
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
          child: Container(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
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
                  width: isHide ? 100 : 150,
                  height: 40,
                  child: TextField(
                    decoration: InputDecoration(
                      // counterText를 적용하면 글자수 제한 글자가 보이지 않는다. (세로 밑에 글자수 제한)
                      // 글자수 제한은 그대로 먹힘, 옆에 따로 가로로 텍스트 위젯을 만들어 글자수 제한을 표시하면 됨
                      counterText: '',
                      hintText: '항목을 입력해 주세요',
                      hintStyle: Theme.of(context).textTheme.bodySmall,
                      contentPadding: const EdgeInsets.symmetric(vertical: 2),
                      border: const OutlineInputBorder(gapPadding: 2.0),
                    ),

                    style: Theme.of(context).textTheme.bodySmall,
                    maxLines: 1,
                    minLines: 1,
                    // 글자수 제한 및 더이상 입력 방지 기능
                    // TODO : 아이디에만 적용할 것
                    maxLength: 16,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
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
