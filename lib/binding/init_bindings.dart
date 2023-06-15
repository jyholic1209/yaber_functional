// 앱이 실행될때 필요한 GetX 인스턴스를 생성하기 위한 클래스
import 'package:flutter_yaber/controllers/auth_controller.dart';
import 'package:get/get.dart';

import '../controllers/bottom_nav_controller.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    // bottom_nav_controller 인스턴스 생성, 퍼머넌트 true는 앱 종료시까지 데이터 메모리 상주
    Get.put(BottomNavController(), permanent: true);
    Get.put(AuthController(), permanent: true);
  }
}
