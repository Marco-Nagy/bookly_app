import 'package:flutter/material.dart';

import '../utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.backGroundColor,
      required this.textColor,
      this.borderRadius,
      required this.text})
      : super(key: key);
  final Color backGroundColor;
  final Color textColor;
  final BorderRadius? borderRadius;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: borderRadius ?? BorderRadius.circular(16)),
              backgroundColor: backGroundColor),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          onPressed: () {},
          child: Text(
            text,
            style: Styles.titleMedium18.copyWith(color: textColor),
          )),
    );
  }
}
