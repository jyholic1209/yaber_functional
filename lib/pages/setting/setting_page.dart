import 'package:flutter/material.dart';
import 'package:flutter_yaber/controllers/auth_controller.dart';
import 'package:flutter_yaber/pages/login.dart';
import 'package:flutter_yaber/pages/setting/alarm_setting_page.dart';
import 'package:flutter_yaber/pages/setting/myaccount_page.dart';
import 'package:flutter_yaber/pages/setting/notice_page.dart';
import 'package:get/get.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //색변경
        ),
        title: const Text('설정',
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
            Row(
              children: [
                const Icon(Icons.account_circle),
                const SizedBox(width: 30),
                TextButton(
                    onPressed: () {
                      Get.to(const MyAccountPage());
                    },
                    child: const Text('내 계정')),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.notifications_active),
                const SizedBox(width: 30),
                TextButton(
                    onPressed: () {
                      Get.to(const AlarmSettingPage());
                    },
                    child: const Text('알 림')),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.logout),
                const SizedBox(width: 30),
                TextButton(
                    onPressed: () {
                      AuthController.to.logout();
                      Get.offAll(Login());
                    },
                    child: const Text('로그아웃')),
              ],
            ),
            const Divider(
              height: 10,
              thickness: 1,
              color: Colors.black,
            ),
            Row(
              children: [
                const Icon(Icons.notification_important_outlined),
                const SizedBox(width: 30),
                TextButton(
                    onPressed: () {
                      Get.to(const NoticesPage());
                    },
                    child: const Text('공지사항')),
              ],
            ),
            Row(
              children: const [
                Icon(Icons.app_shortcut_outlined),
                SizedBox(width: 30),
                TextButton(onPressed: null, child: Text('앱 버전 0.10')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
