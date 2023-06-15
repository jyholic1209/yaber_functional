import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_yaber/models/yaberuser_model.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();

  YUser? authUser;

  @override
  void onInit() {
    super.onInit();
    _checklogin();
  }

  void _checklogin() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user == null)
        return;
      else {
        print('login state');
      }
      // await login(user);
      // update();
    });
  }

  Future<void> login(User? userAuth) async {
    // authUser =
    // (await UserRepository.findUserByUid(userAuth!.uid)) as Rx<YUser?>;
  }
}
