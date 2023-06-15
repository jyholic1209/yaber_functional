// ignore_for_file: constant_identifier_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_yaber/components/message_box.dart';
import 'package:get/get.dart';

import '../pages/home/upload_page.dart';

enum PageName { HOME, SEARCH, UPLOAD, BOOKMARK, MYPAGE }

class BottomNavController extends GetxController {
  RxInt pageIndex = 0.obs;
  List<int> pageHistory = [0];

  void changeBottomNav(int value, {bool hasGesture = true}) {
    var page = PageName.values[value];
    switch (page) {
      case PageName.HOME:
      case PageName.SEARCH:
      case PageName.BOOKMARK:
      case PageName.MYPAGE:
        _changePage(value, hasGesture: hasGesture);
        break;
      case PageName.UPLOAD:
        Get.to(const UploadPage());
        break;
    }
  }

  void _changePage(int value, {bool hasGesture = true}) {
    pageIndex(value);
    if (!hasGesture) return;
    // 동일한 인덱스는 히스토리에 쌓지 않는다
    // 시나리오 : 히스토리를 계속 쌓는다.
    if (pageHistory.last != value) {
      pageHistory.add(value);
    }

    // 만약 인덱스당 하나의 히스토리만 저장하고 싶을때
    // 시나리오 : 인덱스 0,1,3,4 4개만 계속 유지하고 앞에 쌓인 것을 지운다.
    // if (bottomHistory.contains(value)) {
    //   bottomHistory.remove(value);
    // }
  }

  // 히스토리 관리를 위해 컨트롤러에서 인덱스값을 저장해서 처리.
  Future<bool> willPoPAction() async {
    // 히스토리가 쌓은 것이 없을때
    if (pageHistory.length == 1) {
      // exit
      showDialog(
        context: Get.context!,
        builder: (context) => MessageBox(
          title: '시스템',
          message: '앱을 종료하시겠습니까?',
          buttonText1: '종료',
          okCallback: () {
            exit(0);
          },
          buttonText2: '취소',
          cancelCallback: Get.back,
        ),
      );
      return true;
    } else {
      // 이전 페이지로 돌아가기 (단 스텍에 쌓인 업로드 페이지는 제외함)
      pageHistory.removeLast();
      var index = pageHistory.last;
      _changePage(index, hasGesture: false);
      return false;
    }
  }
}
