import 'package:flutter/material.dart';
import 'package:flutter_yaber/controllers/signup_controller.dart';
import 'package:flutter_yaber/pages/login.dart';
import 'package:flutter_yaber/pages/signup/signup_page.dart';
import 'package:get/get.dart';

import '../../components/message_box.dart';

class SignupEnd extends StatelessWidget {
  const SignupEnd({super.key});

  @override
  Widget build(BuildContext context) {
    if (SignupController.to.isInfoCheck == true) {
      return MessageBox(
        title: 'Yaber',
        message: 'Yaber 회원가입이 완료되었습니다.',
        buttonText1: '로그인',
        okCallback: () {
          Get.offAll(Login());
        },
      );
    } else {
      return MessageBox(
        title: 'Yaber',
        message: 'Yaber 회원가입이 정상적이지 못합니다.\n다시 확인해 주세요.',
        buttonText1: '이전창',
        okCallback: () {
          tabKey.currentState?.previous();
        },
      );
    }
  }
}
