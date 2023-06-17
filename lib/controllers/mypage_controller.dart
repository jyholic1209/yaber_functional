import 'package:dio/dio.dart';
import 'package:get/get.dart';

class MypageController extends GetxController {
  static MypageController get to => Get.find();
  final List<Map<String, dynamic>> nationList = [];

  Future<bool> getIsoCode() async {
    const iosUrl =
        'https://api.odcloud.kr/api/15076566/v1/uddi:b003548e-3d28-42f4-8f82-e64766b055bc?page=1&perPage=237&serviceKey=IPesnI3k2MuwHqBF08Pli3NRTzp9eNoihEOC0tnHCOHFhr4Y2NOqS6O75xeTxFf9H4qQp5tPMYjeH2U81QgxcA==';

    final dio = Dio();
    final response = await dio.get(iosUrl);

    Map<String, dynamic> nation;
    for (nation in response.data['data']) {
      nationList.add(nation);
    }
    if (nationList.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
