import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonText extends StatelessWidget {
  final String title;
  final String subtitle;
  const CommonText({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
        children: <TextSpan>[
          TextSpan(
            text: '$title: ',
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
          ),
          TextSpan(
            text: subtitle,
            style: const TextStyle(color: Colors.black, fontSize: 15),
          ),
        ],
      ),
    ).paddingOnly(bottom: 10);
  }
}
