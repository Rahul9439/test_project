import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class CommonButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  const CommonButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: Colors.blueAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ).paddingSymmetric(horizontal: 20));
  }
}
