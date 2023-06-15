import 'package:flutter/material.dart';
import 'package:flutter_yaber/pages/setting/notice_detail_page.dart';
import 'package:get/get.dart';

class NoticesPage extends StatelessWidget {
  const NoticesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Notice> noticeList = [
      Notice('첫번째 공지사항 입니다.', '2022.5.20'),
      Notice('두번째 공지사항 입니다.', '2022.5.21'),
      Notice('세번째 공지사항 입니다.', '2022.5.22'),
    ];
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //색변경
        ),
        title: const Text('공지사항',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
                color: Colors.black)),
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: ListView.separated(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                child: GestureDetector(
                    onTap: () => Get.to(NoticeDetailPage(
                          title: noticeList[index].noticeTitle,
                        )),
                    child: noticeTile(noticeList[index])),
              );
            },
            separatorBuilder: (context, index) => const Divider(
                  height: 5,
                ),
            itemCount: noticeList.length),
      ),
    );
  }
}

class Notice {
  late String noticeTitle;
  late String noticeTime;
  Notice(String title, String time) {
    noticeTitle = title;
    noticeTime = time;
  }
}

Widget noticeTile(Notice notice) {
  return SizedBox(
    height: 40,
    child: Row(
      children: [
        Text(notice.noticeTitle),
        const Spacer(),
        Text(notice.noticeTime),
      ],
    ),
  );
}
