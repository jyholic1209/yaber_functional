import 'package:get/state_manager.dart';

class SignupController extends GetxController {
  // 약관 동의 체크박스
  RxBool isPrivateCheck = false.obs;
  RxBool isLocationCheck = false.obs;
  RxBool isMarketingCheck = false.obs;

  // 정보 저장이 잘 됐는지 확인
  RxBool isInfoCheck = false.obs;

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

  void infoPageCheck(bool value) {
    isInfoCheck(value);
  }
}
