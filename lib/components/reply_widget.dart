import 'package:flutter/material.dart';

class ReplyWidget extends StatelessWidget {
  final String userName;
  final String national;
  final String ago;
  const ReplyWidget({
    super.key,
    required this.userName,
    required this.national,
    required this.ago,
  });

  @override
  Widget build(BuildContext context) {
    String reply =
        'Providers allow you to not only expose a value, but also create, listen, and dispose of it. To expose a newly created object, use the default constructor of a provider. Do not use the .value constructor if you want to create an object, or you may otherwise have undesired side effects.';
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(TextSpan(
                    text: userName,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    children: [
                      TextSpan(
                          text: ' from $national',
                          style: const TextStyle(
                              fontSize: 13, color: Colors.grey)),
                    ])),
                Text(
                  ago,
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ],
            ),
            Text(
              reply,
              style: const TextStyle(fontSize: 13, color: Colors.black),
              maxLines: 3,
            )
          ],
        )
      ],
    );
  }
}
