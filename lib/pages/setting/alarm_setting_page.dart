import 'package:flutter/material.dart';

class AlarmSettingPage extends StatefulWidget {
  const AlarmSettingPage({super.key});

  @override
  State<AlarmSettingPage> createState() => _AlarmSettingPageState();
}

class _AlarmSettingPageState extends State<AlarmSettingPage> {
  bool isAllAlarm = false;
  bool isAllNoAlarm = false;
  bool isMyCntAlarm = false;
  bool isMyRlyAlarm = false;
  bool isMegAlarm = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //색변경
        ),
        title: const Text('알림',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
                color: Colors.black)),
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
          padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                      value: isAllAlarm,
                      onChanged: (value) {
                        setState(() {
                          isAllAlarm = value!;
                        });
                      }),
                  const Text('모든 알람 받기'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                      value: isAllNoAlarm,
                      onChanged: (value) {
                        setState(() {
                          isAllNoAlarm = value!;
                        });
                      }),
                  const Text('모든 알람 받지 않기'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                      value: isMyCntAlarm,
                      onChanged: (value) {
                        setState(() {
                          isMyCntAlarm = value!;
                        });
                      }),
                  const Text('내 게시물의 좋아요 알람 받기'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                      value: isMyRlyAlarm,
                      onChanged: (value) {
                        setState(() {
                          isMyRlyAlarm = value!;
                        });
                      }),
                  const Text('내 게시물의 댓글 알람 받기'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                      value: isMegAlarm,
                      onChanged: (value) {
                        setState(() {
                          isMegAlarm = value!;
                        });
                      }),
                  const Text('메세지 수신 알람 받기'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('저장'),
                  ),
                  const SizedBox(width: 30),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('취소'),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Text(
                  '*모든 알람 받지 않기를 선택해도 게세글 규제 정책 위반으로 내 게세물과 내 댓글 삭제시에는 알람이 수신됩니다'),
            ],
          )),
    );
  }
}
