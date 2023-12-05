import 'package:bookly/core/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class Styles {
  static TextStyle titleMedium18 = GoogleFonts.montserrat(
    fontSize: 18,
    fontWeight: FontWeight.w900,
  );

  static const textStyle20 = TextStyle(
    fontSize: 20,
    fontFamily: gtSectra,
  );
  static const textStyle30 = TextStyle(
    fontSize: 30,
    fontFamily: gtSectra,
  );
  static TextStyle textStyleNum14 = GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.w900,
    color: Colors.white,
    // shadows: [
    //   const Shadow(
    //     color: Colors.white,
    //     offset: Offset(1, -0.51),
    //   ),
    //
    // ]
  );
  static TextStyle textStyle16 = GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.w900,
    color: kWhite70Opacity,
  );
}
