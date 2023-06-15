// To parse this JSON data, do
//
//     final yUserModel = yUserModelFromMap(jsonString);

import 'dart:convert';

YUser yUserModelFromMap(String str) => YUser.fromMap(json.decode(str));

String yUserModelToMap(YUser data) => json.encode(data.toMap());

class YUser {
  String? uid;
  String? nickName;
  String? email;
  String? password;
  String? nationality;
  String? porfileThumb;
  String? peek;
  String? bookmark;

  YUser({
    this.uid,
    this.nickName,
    this.email,
    this.password,
    this.nationality,
    this.porfileThumb,
    this.peek,
    this.bookmark,
  });

  YUser copyWith({
    String? uid,
    String? nickName,
    String? email,
    String? password,
    String? nationality,
    String? porfileThumb,
    String? peek,
    String? bookmark,
  }) =>
      YUser(
        uid: uid ?? this.uid,
        nickName: nickName ?? this.nickName,
        email: email ?? this.email,
        password: password ?? this.password,
        nationality: nationality ?? this.nationality,
        porfileThumb: porfileThumb ?? this.porfileThumb,
        peek: peek ?? this.peek,
        bookmark: bookmark ?? this.bookmark,
      );

  factory YUser.fromMap(Map<String, dynamic> json) => YUser(
        uid: json["uid"] == null ? '' : json["uid"] as String,
        nickName: json["nick_name"] == null ? '' : json["nick_name"] as String,
        email: json["email"] == null ? '' : json["email"] as String,
        password: json["password"] == null ? '' : json["password"] as String,
        nationality:
            json["nationality"] == null ? '' : json["nationality"] as String,
        porfileThumb: json["porfile_thumb"] == null
            ? ''
            : json["porfile_thumb"] as String,
        peek: json["peek"] == null ? '' : json["peek"] as String,
        bookmark: json["bookmark"] == null ? '' : json["bookmark"] as String,
      );

  Map<String, dynamic> toMap() => {
        "uid": uid,
        "nick_name": nickName,
        "email": email,
        "password": password,
        "nationality": nationality,
        "porfile_thumb": porfileThumb,
        "peek": peek,
        "bookmark": bookmark,
      };
}
