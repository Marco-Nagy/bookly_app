import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bookly/Features/presentation/views/widgets/loader.dart';
import 'package:bookly/core/utils/fonts_assets.dart';
import 'package:bookly/core/utils/img_assets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashViewBody extends StatefulWidget {
  SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  bool isLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: (50)),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Lottie.asset(
          ImgAssets.splash,
          controller: _controller,
          height: MediaQuery.of(context).size.height * .5,
          animate: true,
          onLoaded: (composition) {
            _controller
              ..duration = composition.duration
              ..forward().whenComplete(
                () {
                  setState(() {
                    isLoaded = true;
                  });
                },
              );
          },
        ),
        Image.asset(
          ImgAssets.logo,
        ),
        if (isLoaded == true)
          Center(
            child: DefaultTextStyle(
              style: const TextStyle(
                fontSize: 14.0,
                fontFamily: FontAssets.agne,
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText('Feed Your Brain Now \n\nRead Free Books',
                      speed: const Duration(milliseconds: 100),
                      textAlign: TextAlign.center),
                ],
                totalRepeatCount: 1,
                onFinished: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  const Loader(),
                    )),
              ),
            ),
          ),
      ],
    );
  }
}
