import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadPage extends StatelessWidget {
  const UploadPage({super.key});

  @override
  Widget build(BuildContext context) {
    var imageSize = 100.0;
    return Scaffold(
      appBar: AppBar(
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
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
              child: const Text(
                '게시',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
          )
        ],
        elevation: 1,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Ahnpro님의 여행 이야기를 해주세요',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.grey),
                    )),
                maxLines: 10,
                textAlign: TextAlign.start,
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.newline,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: imageSize,
                    height: imageSize,
                    // color: Colors.amberAccent,
                    child: CachedNetworkImage(
                        imageUrl:
                            'https://source.unsplash.com/random/300×300/?people'),
                  ),
                  SizedBox(
                    width: imageSize,
                    height: imageSize,
                    // color: Colors.blueAccent,
                    child: CachedNetworkImage(
                        imageUrl:
                            'https://source.unsplash.com/random/300×300/?baby'),
                  ),
                  SizedBox(
                    width: imageSize,
                    height: imageSize,
                    // color: Colors.redAccent,
                    child: CachedNetworkImage(
                        imageUrl:
                            'https://source.unsplash.com/random/300×300/?woman'),
                  )
                ],
              ),
              const SizedBox(height: 10),
              const Divider(
                height: 2,
                thickness: 1,
                color: Colors.black,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.photo_outlined,
                        size: 40,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.camera_alt_outlined,
                        size: 40,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.animation_outlined,
                        size: 40,
                      )),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(
                height: 2,
                thickness: 1,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
