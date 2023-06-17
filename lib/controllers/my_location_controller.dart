import 'dart:async';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class MyLocationController extends GetxController {
  static MyLocationController get to => Get.find();
  // Geo instance
  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;
  Placemark address = Placemark();
  Timer? timer;

  @override
  void onInit() async {
    super.onInit();
    await _getCurrentPosition();
  }

  void reloadPosition() {
    timer = Timer.periodic(const Duration(minutes: 10), (timer) async {
      await _getCurrentPosition();
      // TODO : home화면 갱신
      // update();를 하려면 홈 화면을에 바인딩 필요
    });
  }

  // 현재 경도, 위도를 받아옴
  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handlePermission();
    if (!hasPermission) {
      return;
    }

    var position = await _geolocatorPlatform.getCurrentPosition();
    // List[0]에 모두 한꺼번에 담김.
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    // Placemark 클래스에 담아줌.
    address = placemarks.first;
  }

  // GPS 퍼미션
  Future<bool> _handlePermission() async {
    bool serviceEnabled;
    LocationPermission permission;
    // GPS 서비스 체크
    serviceEnabled = await _geolocatorPlatform.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // GPS 서비스가 안켜져 있으면
      return false;
    }
    // 퍼미션 체크
    permission = await _geolocatorPlatform.checkPermission();
    // 퍼미션이 없으면
    if (permission == LocationPermission.denied) {
      permission = await _geolocatorPlatform.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return false;
    }
    return true;
  }
}
