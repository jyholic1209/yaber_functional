import 'package:flutter/material.dart';
import 'package:flutter_yaber/controllers/auth_controller.dart';
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
                onPressed: () async {
                  await AuthController.to
                      .login(emailController.text, passwordController.text);
                  if (AuthController.to.authUser != null) {
                    emailController.clear();
                    passwordController.clear();
                    Get.to(const Home());
                  }
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
    final TextEditingController tmpEmailController = TextEditingController();
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('information_email'.tr),
              const SizedBox(height: 10),
              TextField(
                controller: tmpEmailController,
                decoration: const InputDecoration(
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
                    onPressed: () async {
                      print(tmpEmailController.text);
                      await AuthController.to
                          .sendTempPassword(email: tmpEmailController.text);
                      tmpEmailController.clear();
                      Get.back();
                    },
                    child: Text('send'.tr),
                  ),
                  const SizedBox(width: 30),
                  ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text('cancel'.tr),
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
