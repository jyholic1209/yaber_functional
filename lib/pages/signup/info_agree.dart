import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_yaber/controllers/auth_controller.dart';
import 'package:flutter_yaber/controllers/mypage_controller.dart';
import 'package:flutter_yaber/controllers/signup_controller.dart';
import 'package:flutter_yaber/models/yaberuser_model.dart';
import 'package:flutter_yaber/pages/signup/nation_list.dart';
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
  TextEditingController idController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController isoNationCodeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Get.put(MypageController());
    // 국가 리스트를 미리 만들어 놓음
    MypageController.to.getList();
  }

  @override
  void dispose() {
    idController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    isoNationCodeController.dispose();
    super.dispose();
  }

  void update() => setState(() {});

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
              image: AuthController.to.pickedImage == null
                  ? const DecorationImage(
                      image: Svg('assets/images/Default_pfp.svg'),
                      fit: BoxFit.cover)
                  : DecorationImage(
                      image: FileImage(AuthController.to.pickedImage!),
                      fit: BoxFit.cover),
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
                  await AuthController.to.onProfileImage(ImageSource.gallery,
                      context: Get.context!);
                  update();
                },
                child: Icon(
                  Icons.photo_camera,
                  color: Theme.of(Get.context!).primaryColorDark,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _tableRowInput(0),
          _tableRowInput(1),
          _tableRowInput(2),
          _tableRowInput(3),
          _tableRowInput(4),
        ],
      ),
    );
  }

  Widget _tableRowInput(int index) {
    String title = '';
    switch (index) {
      case 0:
        title = '아이디';
        break;
      case 1:
        title = '이메일';
        break;
      case 2:
        title = '비밀번호';
        break;
      case 3:
        title = '비밀번호 재입력';
        break;
      case 4:
        title = '국가';
        break;
    }

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
                  width: index == 4 ? 100 : 150,
                  height: 40,
                  child: TextField(
                    controller: index == 0
                        ? idController
                        : index == 1
                            ? emailController
                            : index == 2
                                ? passwordController
                                : index == 3
                                    ? confirmPasswordController
                                    : isoNationCodeController,
                    decoration: InputDecoration(
                      // counterText를 적용하면 글자수 제한 글자가 보이지 않는다. (세로 밑에 글자수 제한)
                      // 글자수 제한은 그대로 먹힘, 옆에 따로 가로로 텍스트 위젯을 만들어 글자수 제한을 표시하면 됨
                      counterText: index == 0 ? '' : null,
                      hintText: '항목을 입력해 주세요',
                      hintStyle: Theme.of(context).textTheme.bodySmall,
                      contentPadding: const EdgeInsets.symmetric(vertical: 2),
                      border: const OutlineInputBorder(gapPadding: 2.0),
                    ),

                    style: Theme.of(context).textTheme.bodySmall,
                    maxLines: 1,
                    minLines: 1,
                    // 글자수 제한 및 더이상 입력 방지 기능
                    maxLength: index == 0 ? 16 : null,
                    maxLengthEnforcement: index == 0
                        ? MaxLengthEnforcement.enforced
                        : MaxLengthEnforcement.none,
                    obscureText: index == 0
                        ? false
                        : index == 1
                            ? false
                            : index == 2
                                ? true
                                : index == 3
                                    ? true
                                    : false,
                    enabled: index == 4 ? false : true,
                  ),
                ),
                SizedBox(
                  width: index == 4 ? 45 : 0,
                  height: 33,
                  child: index == 4
                      ? ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(0)),
                          child: const Text(
                            '검색',
                            style: TextStyle(fontSize: 12),
                          ),
                          onPressed: () async {
                            // Get.back 으로 데이터를 받아 오기 위해 await를 사용
                            // 그래서 여기서 getList를 부르면 리스트 페이지가 갱신되지 않음
                            // MypageController.to.getList();
                            final response =
                                await Get.to(() => const NationList());
                            if (response != null) {
                              isoNationCodeController.text =
                                  response['국가명(영문)'];
                              update();
                            }
                          },
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
                  var val = _validation();
                  if (SignupController.to.isInfoCheck == true && val == true) {
                    var newUser = YUser(
                      email: emailController.text,
                      password: passwordController.text,
                      nickName: idController.text,
                      nationality: isoNationCodeController.text,
                    );
                    if (AuthController.to.pickedImage != null) {
                      AuthController.to
                          .signUp(newUser, AuthController.to.pickedImage);
                    } else {
                      AuthController.to.signUp(newUser, null);
                    }
                    tabKey.currentState?.next();
                    idController.clear();
                    emailController.clear();
                    passwordController.clear();
                    confirmPasswordController.clear();
                    isoNationCodeController.clear();
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

  bool _validation() {
    if (idController.text.length > 16 || idController.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('아이디를 확인해 주세요')));
      return false;
    }
    if (!emailController.text.contains('@') && !emailController.text.isEmail) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('이메일을 확인해 주세요')));
      return false;
    }
    if (passwordController.text != confirmPasswordController.text ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('비밀번호를 확인해 주세요')));
      return false;
    }
    if (isoNationCodeController.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('출신 국가를 선택해 주세요')));
      return false;
    }
    return true;
  }
}
