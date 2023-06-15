import 'package:cloud_firestore/cloud_firestore.dart';
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

  static Future<String?> signup(YUser? user) async {
    if (user == null) return null;
    var drf = await users.add(user.toMap());
    return drf.id;
  }

  static Future<void> updateUserData(YUser? user) async {
    if (user == null) return;
    await users.doc(user.uid).update(user.toMap());
  }
}
