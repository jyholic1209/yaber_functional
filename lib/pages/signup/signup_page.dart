import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yaber/pages/signup/info_agree.dart';
import 'package:flutter_yaber/pages/signup/signup_end.dart';
import 'package:flutter_yaber/pages/signup/terms_agree.dart';

GlobalKey<ContainedTabBarViewState> tabKey = GlobalKey();

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Yaber 회원 가입',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ContainedTabBarView(
        key: tabKey,
        tabBarProperties: const TabBarProperties(
          labelColor: Colors.red,
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelColor: Colors.black38,
        ),
        tabs: const [
          Text('약관 동의'),
          Text('정보 입력'),
          Text('가입 완료'),
        ],
        views: const [
          TermsAgree(),
          InfoAgree(),
          SignupEnd(),
        ],
      ),
    );
  }
}
