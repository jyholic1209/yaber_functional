import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yaber/pages/home/reply_page.dart';
import 'package:get/get.dart';

class PostWidget extends StatelessWidget {
  final bool isBookmark;
  final bool isMyPage;
  final Function()? deleteCallback;
  final Function()? moreCallback;
  const PostWidget({
    super.key,
    this.isBookmark = false,
    this.isMyPage = false,
    this.deleteCallback,
    this.moreCallback,
  });

  Widget _contentsImage(String imageUrl) {
    IconButton icon = isMyPage
        ? IconButton(
            onPressed: deleteCallback,
            icon: const Icon(Icons.delete_outline_outlined))
        : IconButton(
            onPressed: moreCallback,
            icon: const Icon(Icons.more_vert_outlined));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 300,
          child: TextButton(
            style: TextButton.styleFrom(padding: const EdgeInsets.all(0)),
            onPressed: () {
              Get.to(ReplyPage(
                  imageUrl: imageUrl,
                  posterNation: 'Seoul, Korea',
                  postingTime: '2025. 5. 4. 09:28'));
            },
            child: Text(
              imageUrl,
              style: const TextStyle(color: Colors.blue),
              maxLines: 1,
            ),
          ),
        ),
        CachedNetworkImage(
          imageUrl: imageUrl,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const [
                Icon(Icons.chat),
                Text('45'),
              ],
            ),
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
            Visibility(
                visible: isBookmark, child: const Icon(Icons.bookmark_added)),
            icon,
          ],
        ),
      ],
    );
  }

  Widget _contentsText(String postMessage) {
    return ExpandableText(
      postMessage,
      expandText: '더보기', // 접혀진 텍스트를 펼칠때 버튼 텍스트
      collapseText: '접기', // 펼쳐진 텍스트를 접을때 버튼 텍스트
      maxLines: 3, // 3번째 줄부터 접힘
      expandOnTextTap: false, // 텍스트 영역을 탭하여 펼침
      collapseOnTextTap: true, // 텍스트 영역을 탭하여 접기
      linkColor: Colors.red, // 더보기, 접기 텍스트 색
    );
  }

  Widget _userInfo(
      {required String userName,
      required String national,
      required String ago}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text.rich(TextSpan(
            text: userName,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            children: [
              TextSpan(
                  text: ' from $national',
                  style: const TextStyle(fontSize: 13, color: Colors.grey)),
            ])),
        Text(
          ago,
          style: const TextStyle(fontSize: 13, color: Colors.grey),
        ),
      ],
    );
  }

  final String longText =
      '''광화문(光化門)은 서울특별시 종로구의 조선왕조 법궁인 경복궁의 남쪽에 있는 정문이다. "임금의 큰 덕(德)이 온 나라를 비춘다"는 의미이다.[1] 1395년에 세워졌으며, 2층 누각 구조로 되어 있다. 경복궁의 정전인 근정전으로 가기 위해 지나야 하는 문 3개 중에서 첫째로 마주하는 문이며, 둘째는 흥례문, 셋째는 근정문이다.
광화문 앞에는 지금은 도로 건설로 사라진 월대가 자리잡고 있었으며, 양쪽에는 한 쌍의 해태 조각상이 자리잡고 있다.[주해 1] 광화문의 석축부에는 세 개의 홍예문(虹霓門, 아치문)이 있다. 가운데 문은 임금이 다니던 문이고, 나머지 좌우의 문은 신하들이 다니던 문이었는데, 왼쪽 문은 무신이, 오른쪽 문은 문신이 출입했다. 광화문의 가운데 문 천장에는 주작이 그려져 있고, 왼쪽 문에는 거북이가, 오른쪽 문에는 천마가 그려져 있다.[2]
1392년 태조 시기에 경복궁과 함께 지어진 광화문은 조선의 주요 관청이 밀집한 육조거리의 기준점으로 자리잡았다. 1592년 선조 대에 이르러 임진왜란으로 경복궁 전체의 소실과 함께 파괴되어 한동안 폐허로 남아 있었다가, 1865년 흥선대원군의 경복궁 중건으로 복원되었다.
일제강점기에는 1926년 완공된 조선총독부 청사 조성 과정에서 총독부에 의해 철거가 계획되었으나, 각계의 반발에 부딪혀 경복궁 동쪽 건춘문 쪽으로 이전하였다. 해방 후 한국 전쟁으로 목조 부분이 소실되어 석축만 남아 있었다가, 1968년 중앙청 앞 원래 자리에 철근 콘크리트로 재건하였다. 이후 2006년부터 목조 복원을 통한 고종 대 모습으로의 회귀를 위해 기존 건물을 해체하였으며, 월대와 해태 등을 제외한 일부 복원공사가 완료되어 2010년 8월 15일에 공개되었다. 2022년부터는 문앞 월대와 해태상의 복원공사가 진행되고 있다.
광화문은 오늘날 서울를 넘어 대한민국을 상징하는 대표 건축물로 남아 있다. 광화문 앞의 육조거리는 일제강점기와 해방 후 경제성장을 거치며 세종로라는 최대 규모의 도로가 건설되어 중대한 교통로로 기능하였으며, 이후 광화문광장이 조성되어 서울 도심 속 대표 집회·휴식 공간으로 자리잡았다.''';

  final String url =
      'https://korean.visitseoul.net/data/kukudocs/seoul2133/20220829/202208291317416161.jpg';
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _userInfo(userName: 'Ahnpro', national: 'Korea', ago: '25m'),
          _contentsText(longText),
          _contentsImage(url),
        ],
      ),
    );
  }
}
