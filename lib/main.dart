import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yaber/binding/init_bindings.dart';
import 'package:flutter_yaber/check_state.dart';
import 'package:flutter_yaber/controllers/my_location_controller.dart';
import 'package:flutter_yaber/firebase_options.dart';
import 'package:flutter_yaber/locale/languages.dart';
import 'package:flutter_yaber/pages/login.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  bool _determineLocale() {
    Get.put(MyLocationController(), permanent: true);
    if (MyLocationController.to.address.isoCountryCode != 'KR') {
      print('english');
      return false;
    }
    print('korea');
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Languages(),
      locale: _determineLocale()
          ? const Locale('ko', 'KR')
          : const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'), // 영어, 한국어 외 지역에는 영어
      title: 'YABER',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.white, brightness: Brightness.light),
      ),
      debugShowCheckedModeBanner: false,
      initialBinding: InitBinding(),
      home: const CheckState(),
    );
  }
}
