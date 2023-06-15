import 'package:flutter/material.dart';

import '../../components/post_widget.dart';

class HomeBookMarkPage extends StatelessWidget {
  const HomeBookMarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 5, left: 10, right: 10),
      child: PostWidget(isBookmark: true),
    );
  }
}
