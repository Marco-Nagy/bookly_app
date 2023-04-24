import 'package:bookly/core/utils/img_assets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/BOOKLY.png',
            width: MediaQuery.of(context).size.width * .2,
            height: MediaQuery.of(context).size.height*.05,
            fit: BoxFit.scaleDown,
          ),
          Lottie.asset(
            ImgAssets.loader,
            width: 70,
            height: 50,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
