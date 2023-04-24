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
            ImgAssets.logo,
            height: MediaQuery.of(context).size.height * .05,
            width: MediaQuery.of(context).size.width * .2,
          ),
          Lottie.asset(
            ImgAssets.loader,
            height: MediaQuery.of(context).size.height * .09,
            width: MediaQuery.of(context).size.width * .17,
            fit: BoxFit.cover
          )
        ],
      ),
    );
  }
}
