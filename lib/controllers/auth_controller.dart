import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_yaber/models/yaberuser_model.dart';
import 'package:flutter_yaber/repository/user_repository.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();
  final _authentication = FirebaseAuth.instance;
  YUser? authUser;
  File? userPickedImage;

  @override
  void onInit() {
    super.onInit();
    _checklogin();
  }

  void _checklogin() {
    _authentication.authStateChanges().listen((User? user) async {
      if (user == null) {
        return;
      } else {
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
    try {
      final credential = await _authentication.signInWithEmailAndPassword(
          email: email, password: password);
      authUser = await UserRepository.findUserByUid(credential.user!.uid);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      } else {
        print(e.message);
      }
    }
  }

  Future<void> logout() async {
    await _authentication.signOut();
    authUser = null;
  }

  Future<void> sendTempPassword({required String email}) async {
    try {
      var result = await _authentication.fetchSignInMethodsForEmail(email);
      if (result.isNotEmpty) {
        try {
          await _authentication.sendPasswordResetEmail(email: email);
        } on FirebaseAuthException catch (e) {
          print('${e.code} : ${e.message}');
        } catch (e) {
          print(e.toString());
        }
      } else {
        print('no result');
      }
    } on FirebaseAuthException catch (e) {
      print('${e.code} : ${e.message}');
    } catch (e) {
      print(e.toString());
    }
  }

  void signUp() {}
}
