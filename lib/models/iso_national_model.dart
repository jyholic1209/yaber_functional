// To parse this JSON data, do
//
//     final nationCode = nationCodeFromMap(jsonString);

import 'dart:convert';

IsoNationalCode nationCodeFromMap(String str) =>
    IsoNationalCode.fromMap(json.decode(str));

String nationCodeToMap(IsoNationalCode data) => json.encode(data.toMap());

class IsoNationalCode {
  int? currentCount;
  List<Nation>? data;
  int? matchCount;
  int? page;
  int? perPage;
  int? totalCount;

  IsoNationalCode({
    this.currentCount,
    this.data,
    this.matchCount,
    this.page,
    this.perPage,
    this.totalCount,
  });

  IsoNationalCode copyWith({
    int? currentCount,
    List<Nation>? data,
    int? matchCount,
    int? page,
    int? perPage,
    int? totalCount,
  }) =>
      IsoNationalCode(
        currentCount: currentCount ?? this.currentCount,
        data: data ?? this.data,
        matchCount: matchCount ?? this.matchCount,
        page: page ?? this.page,
        perPage: perPage ?? this.perPage,
        totalCount: totalCount ?? this.totalCount,
      );

  factory IsoNationalCode.fromMap(Map<String, dynamic> json) => IsoNationalCode(
        currentCount: json["currentCount"],
        data: json["data"] == null
            ? []
            : List<Nation>.from(json["data"]!.map((x) => Nation.fromMap(x))),
        matchCount: json["matchCount"],
        page: json["page"],
        perPage: json["perPage"],
        totalCount: json["totalCount"],
      );

  Map<String, dynamic> toMap() => {
        "currentCount": currentCount,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
        "matchCount": matchCount,
        "page": page,
        "perPage": perPage,
        "totalCount": totalCount,
      };
}

class Nation {
  String? iso2;
  String? iso3;
  String? iso;
  String? nationKR;
  String? nationEN;

  Nation({
    this.iso2,
    this.iso3,
    this.iso,
    this.nationKR,
    this.nationEN,
  });

  Nation copyWith({
    String? iso2,
    String? iso3,
    String? iso,
    String? nationKR,
    String? nationEN,
  }) =>
      Nation(
        iso2: iso2 ?? this.iso2,
        iso3: iso3 ?? this.iso3,
        iso: iso ?? this.iso,
        nationKR: nationKR ?? this.nationKR,
        nationEN: nationEN ?? this.nationEN,
      );

  factory Nation.fromMap(Map<String, dynamic> json) => Nation(
        iso2: json["ISO(2자리)"],
        iso3: json["ISO(3자리)"],
        iso: json["ISO(숫자)"],
        nationKR: json["국가명(국문)"],
        nationEN: json["국가명(영문)"],
      );

  Map<String, dynamic> toMap() => {
        "ISO(2자리)": iso2,
        "ISO(3자리)": iso3,
        "ISO(숫자)": iso,
        "국가명(국문)": nationKR,
        "국가명(영문)": nationEN,
      };
}
