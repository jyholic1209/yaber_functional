import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yaber/components/reply_widget.dart';
import 'package:get/get.dart';

// https://stackoverflow.com/questions/63540425/flutter-singlechildscrollview-with-expanded-column-child
// https://flutteragency.com/how-to-use-expanded-in-a-singlechildscrollview/

class ReplyPage extends StatelessWidget {
  final String imageUrl;
  final String posterNation;
  final String postingTime;
  const ReplyPage({
    super.key,
    required this.imageUrl,
    required this.posterNation,
    required this.postingTime,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: Builder(
          builder: (context) {
            return IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(
                  Icons.close,
                  color: Colors.black,
                ));
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CachedNetworkImage(imageUrl: imageUrl),
                    const SizedBox(height: 10),
                    Text(posterNation,
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey)),
                    Text(postingTime,
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey)),
                    const Divider(
                      height: 10,
                      thickness: 1,
                      color: Colors.black,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.sentiment_satisfied),
                            Text('1000'),
                          ],
                        ),
                        Row(
                          children: const [
                            Icon(Icons.sentiment_dissatisfied),
                            Text('200'),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: const [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: ReplyWidget(
                              userName: 'Marco Caw',
                              national: 'Japan',
                              ago: '45m'),
                        ),
                        Divider(
                          height: 10,
                          thickness: 0.5,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    Column(
                      children: const [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: ReplyWidget(
                              userName: 'Green ket',
                              national: 'Korea',
                              ago: '45m'),
                        ),
                        Divider(
                          height: 10,
                          thickness: 0.5,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const ReplyInput(),
          ],
        ),
      ),
    );
  }
}

class ReplyInput extends StatelessWidget {
  const ReplyInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('USER NAME',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
          const SizedBox(height: 10),
          SizedBox(
            height: 60,
            child: TextField(
              maxLines: 1,
              decoration: InputDecoration(
                labelText: 'Talk your reply',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              ),
            ),
          ),
          // const SizedBox(height: 10),
        ],
      ),
    );
  }
}
