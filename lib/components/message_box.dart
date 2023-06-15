import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageBox extends StatelessWidget {
  final String? title;
  final String message;
  final String buttonText1;
  final String? buttonText2;
  final Function()? okCallback;
  final Function()? cancelCallback;
  const MessageBox({
    super.key,
    required this.title,
    required this.message,
    required this.buttonText1,
    required this.okCallback,
    this.buttonText2,
    this.cancelCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            // 화면의 넓이를 가져와 70%만 사용
            width: Get.width * 0.7,
            child: Column(
              children: [
                Text(
                  title!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                Text(
                  message,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: okCallback,
                      child: Text(buttonText1),
                    ),
                    if (buttonText2 != null) const SizedBox(width: 10),
                    if (buttonText2 != null)
                      ElevatedButton(
                        onPressed: cancelCallback,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                        ),
                        child: Text(buttonText2!),
                      ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
