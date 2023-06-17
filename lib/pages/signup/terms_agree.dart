import 'package:flutter_yaber/components/message_box.dart';
import 'package:flutter_yaber/components/terms_webview_widget.dart';
import 'package:flutter_yaber/controllers/signup_controller.dart';
import 'package:flutter_yaber/pages/login.dart';
import 'package:flutter_yaber/pages/signup/signup_page.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class TermsAgree extends StatelessWidget {
  const TermsAgree({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignupController());

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
        child: Column(
          children: [
            const Text('서비스 제공과 관련된 약관에 모두 동의합니다.'),
            const SizedBox(height: 30),
            const Terms(term: '개인정보처리방침 동의(필수)', index: 1),
            const Terms(term: '위치기반서비스 이용약관(필수)', index: 2),
            const Terms(term: '마케팅 정보 수신 전체 동의(필수)', index: 3),
            ElevatedButton(
                onPressed: () {
                  if (SignupController.to.isTermAgreed()) {
                    tabKey.currentState?.next();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('필수 약관 동의가 필요합니다.')));
                  }
                },
                child: const Text('다 음'))
          ],
        ),
      ),
    );
  }
}

class Terms extends GetView<SignupController> {
  final int index;
  final String term;
  const Terms({
    super.key,
    required this.term,
    this.index = 0,
  });

  @override
  Widget build(BuildContext context) {
    if (index < 1 || index > 3) {
      return MessageBox(
          message: 'index error',
          buttonText1: '돌아가기',
          okCallback: () => Get.offAll(Login()));
    }
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Checkbox(
            value: index == 1
                ? controller.isPrivateCheck.value
                : index == 2
                    ? controller.isLocationCheck.value
                    : controller.isMarketingCheck.value,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            onChanged: (value) {
              controller.signupControllerCheck(index, value!);
            },
          ),
          Text(term),
          GestureDetector(
            onTap: () {
              switch (index) {
                case 1:
                  Get.to(const TermsWebviewWidget(
                    title: '개인정보처리방침 동의약관',
                    url: 'https://policy.naver.com/policy/service.html',
                  ));
                  break;
                case 2:
                  Get.to(const TermsWebviewWidget(
                    title: '위치기반서비스 이용약관',
                    url: 'https://policy.naver.com/policy/service.html',
                  ));
                  break;
                case 3:
                  Get.to(const TermsWebviewWidget(
                    title: '마켓팅 정보 수신 전체 동의약관',
                    url: 'https://policy.naver.com/policy/service.html',
                  ));
                  break;
              }
            },
            child: const Text(
              '약관보기',
              style: TextStyle(decoration: TextDecoration.underline),
            ),
          ),
        ],
      ),
    );
  }
}
