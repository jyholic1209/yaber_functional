import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_yaber/models/yaberuser_model.dart';

class UserRepository {
  static CollectionReference<Map<String, dynamic>> users =
      FirebaseFirestore.instance.collection('users');

  static Future<YUser?> findUserByUid(String uid) async {
    try {
      var user = await users.where('uid', isEqualTo: uid).get();
      if (user.size == 0) {
        return null;
      } else {
        return YUser.fromMap(user.docs[0].data());
      }
    } catch (e) {
      return null;
    }
  }

  static Future<bool> signup(YUser? user) async {
    if (user == null) return false;
    await users.doc(user.uid).set({
      "uid": user.uid,
      "nick_name": user.nickName,
      "email": user.email,
      "password": user.password,
      "nationality": user.nationality,
      "profile_thumb": user.profileThumb ?? '',
      "peek": user.peek ?? '',
      "bookmark": user.bookmark ?? '',
    });
    return true;
    // var drf = await users.add(user.toMap());
    // return drf.id;
  }

  static Future<void> updateUserData(YUser? user) async {
    if (user == null) return;
    await users.doc(user.uid).update(user.toMap());
  }
}
