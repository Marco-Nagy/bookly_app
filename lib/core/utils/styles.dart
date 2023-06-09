import 'package:bookly/core/utils/constant.dart';
import 'package:flutter/material.dart';

abstract class Styles {
  static const titleMedium18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w900,
    fontFamily: montserrat,
  );
  static const textStyle20 = TextStyle(
    fontSize: 20,
    fontFamily: gtSectra,
  );
  static const textStyleNum14 = TextStyle(
      fontSize: 14,
      fontFamily: montserrat,
      fontWeight: FontWeight.w900,
      color: Colors.white,
      shadows: [
        const Shadow(
          color: Colors.white,
          offset: Offset(1, -0.51),
        ),

      ]);
  static const textStyle14 = TextStyle(
      fontSize: 14,
      fontFamily: montserrat,
      fontWeight: FontWeight.w900,
      color: kWhite70Opacity,);
}
