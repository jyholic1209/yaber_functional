import 'package:flutter/material.dart';
import 'package:flutter_yaber/pages/home.dart';
import 'package:flutter_yaber/pages/signup/signup_page.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(80, 300, 80, 50),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Yaber',
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 32),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Please enter your email',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(style: BorderStyle.solid)),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Please enter your password',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(style: BorderStyle.solid)),
                ),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  Get.to(const Home());
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(800, 40),
                ),
                child: Text('log_in'.tr),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () {
                  _showConfirmDialog(context);
                },
                child: Text('find_pass'.tr),
              ),
              TextButton(
                onPressed: () {
                  Get.to(const SignupPage());
                },
                child: Text('sing_up'.tr),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> _showConfirmDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('infomation_email'.tr),
              const SizedBox(height: 10),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Please enter your email',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(style: BorderStyle.solid)),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // TO DO : email 발송
                    },
                    child: const Text('발송'),
                  ),
                  const SizedBox(width: 30),
                  ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text('취소'),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
