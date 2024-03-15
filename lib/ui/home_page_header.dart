// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

class HomePageHeader extends StatelessWidget {
  const HomePageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Image(
            image: AssetImage('assets/tvsimage.png'),
            width: 170,
          ),
          Container(
            padding: const EdgeInsets.only(right: 20),
            alignment: Alignment.centerRight,
            width: 200,
            child: const Text(
              'Kshitij',
              style: TextStyle(fontSize: 24),
            ),
          )
        ],
      ),
    );
  }
}
