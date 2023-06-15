import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_yaber/models/yaberuser_model.dart';
import 'package:flutter_yaber/repository/user_repository.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();
  final _authentication = FirebaseAuth.instance;
  YUser? authUser;
  // String? userEmail;
  // String? userPassword;

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
        await findUser(user);
      }
    });
  }

  Future<void> findUser(User? user) async {
    if (user != null) {
      authUser = await UserRepository.findUserByUid(user.uid);
    }
    // 홈으로 보내기
    update();
  }

  Future<void> login(String email, String password) async {
    final newUser = await _authentication.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (newUser != null) {
      authUser = await UserRepository.findUserByUid(newUser.user!.uid);
    }
  }
}
