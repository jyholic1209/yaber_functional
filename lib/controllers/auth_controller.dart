import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yaber/models/yaberuser_model.dart';
import 'package:flutter_yaber/pages/login.dart';
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

  void signUp(YUser user, File? pickedFile) async {
    var uid = await _createSignup(user);
    var updateUser = user.copyWith(uid: uid);
    if (pickedFile == null) {
      _submitSignUp(updateUser);
    } else {
      var task = uploadProfile(pickedFile,
          '${updateUser.uid}/profile.${pickedFile.path.split('.').last}');
      task.snapshotEvents.listen((event) async {
        if (event.bytesTransferred == event.totalBytes &&
            event.state == TaskState.success) {
          var downloadUrl = await event.ref.getDownloadURL();
          var updatedUserData = updateUser.copyWith(profileThumb: downloadUrl);
          _submitSignUp(updatedUserData);
        }
      });
    }
    // 앱 다시 시작시 로그인 상태가 유지됨
    // logout();
  }

  UploadTask uploadProfile(File? profileImage, String filename) {
    final refImage =
        FirebaseStorage.instance.ref().child('users').child(filename);
    final metadata = SettableMetadata(
        contentType: 'image/${filename.split('.').last}',
        customMetadata: {'picked-file-path': profileImage!.path});
    return refImage.putFile(profileImage, metadata);
  }

  void _submitSignUp(YUser user) async {
    try {
      await UserRepository.signup(user);
    } catch (e) {
      ScaffoldMessenger.of(Get.context!)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  Future<String?> _createSignup(YUser user) async {
    try {
      final userCredential =
          await _authentication.createUserWithEmailAndPassword(
              email: user.email!, password: user.password!);
      return userCredential.user!.uid;
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(Get.context!)
          .showSnackBar(SnackBar(content: Text(e.message!)));
    } catch (e) {
      ScaffoldMessenger.of(Get.context!)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}
