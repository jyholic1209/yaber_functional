import 'package:flutter/material.dart';
import 'package:flutter_yaber/controllers/auth_controller.dart';
import 'package:flutter_yaber/pages/home.dart';
import 'package:flutter_yaber/pages/login.dart';
import 'package:get/get.dart';

class CheckState extends StatelessWidget {
  const CheckState({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (controller) {
      if (controller.authUser == null) {
        return Login();
      } else {
        return const Home();
      }
    });
  }
}
