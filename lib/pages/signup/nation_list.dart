import 'package:flutter/material.dart';
import 'package:flutter_yaber/controllers/mypage_controller.dart';
import 'package:get/get.dart';

class NationList extends StatelessWidget {
  const NationList({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(''),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Flags-PNG-Pic.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        body: ListView.builder(
            itemCount: MypageController.to.nationList.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                decoration: BoxDecoration(
                  color: index % 2 == 0 ? Colors.white : Colors.grey[300],
                ),
                child: ListTile(
                  isThreeLine: false,
                  dense: true,
                  leading: Icon(
                    Icons.not_listed_location_outlined,
                    color: Theme.of(context).dividerColor,
                  ),
                  title: Text.rich(
                    TextSpan(
                        text: MypageController.to.nationList[index]['국가명(국문)'],
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          const TextSpan(text: ' '),
                          TextSpan(
                            text: MypageController.to.nationList[index]
                                ['국가명(영문)'],
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400),
                          )
                        ]),
                  ),
                  trailing: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 20),
                    ),
                    onPressed: () {
                      Get.back(result: MypageController.to.nationList[index]);
                    },
                    child: const Text('선택',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
