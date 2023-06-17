import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class SignupController extends GetxController {
  static SignupController get to => Get.find();
  // 약관 동의 체크박스
  RxBool isPrivateCheck = false.obs;
  RxBool isLocationCheck = false.obs;
  RxBool isMarketingCheck = false.obs;

  // 필수 약관 저장 자동 확인
  bool isInfoCheck = false;

  void signupControllerCheck(int index, bool value) {
    switch (index) {
      case 1:
        isPrivateCheck(value);
        break;
      case 2:
        isLocationCheck(value);
        break;
      case 3:
        isMarketingCheck(value);
        break;
    }
  }

  bool isTermAgreed() {
    if (isPrivateCheck.isTrue && isLocationCheck.isTrue) {
      return isInfoCheck = true;
    } else {
      return isInfoCheck = false;
    }
  }
}
