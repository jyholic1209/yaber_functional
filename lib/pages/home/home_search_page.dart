import 'package:flutter/material.dart';

import '../../components/post_widget.dart';

class HomeSearchPage extends StatelessWidget {
  const HomeSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(
            top: 20,
            left: 10,
            right: 10,
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'input city',
              labelText: 'Search',
              labelStyle: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              suffixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.grey[400],
            ),
          ),
        ),
        const Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 5, left: 10, right: 10),
            child: PostWidget(),
          ),
        ),
      ],
    );
  }
}
