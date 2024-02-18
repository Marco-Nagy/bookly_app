import 'package:flutter/material.dart';

import '../utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.backGroundColor,
      required this.textColor,
       this.onPressed,
      this.borderRadius,
      required this.text});
  final Color backGroundColor;
  final Color textColor;
  final BorderRadius? borderRadius;
  final String text;
  final Function? onPressed;

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
          onPressed: ()=> onPressed!(),
          child: Text(
            text,
            style: Styles.titleMedium18.copyWith(color: textColor),
          )),
    );
  }
}
