import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bookly/Features/Home/presentation/views/home_view.dart';
import 'package:bookly/core/utils/constant.dart';
import 'package:bookly/core/utils/fonts_assets.dart';
import 'package:bookly/core/utils/img_assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

class SplashViewBody extends StatefulWidget {
  SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with TickerProviderStateMixin {
  late AnimationController lottieController;
  late AnimationController logoController;

  late Animation<Offset> slideAnimation;
  bool isLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    initAnimation();
  }

  @override
  void dispose() {
    super.dispose();
    lottieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Lottie.asset(
          ImgAssets.splash,
          controller: lottieController,
          height: MediaQuery.of(context).size.height * .5,
          animate: true,
          onLoaded: (composition) {
            lottieController.duration = composition.duration;
            lottieController.forward().whenComplete(() {});
          },
        ),
        AnimatedBuilder(
          animation: slideAnimation,
          builder: (_, child) => SlideTransition(
            position: slideAnimation,
            child: Image.asset(
              ImgAssets.logo,
            ),
          ),
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
                onFinished:()=>Get.to( const HomeView(),transition: Transition.circularReveal,duration: kTransitionDuration),
              ),
            ),
          ),
      ],
    );
  }

  void initAnimation() async {
    lottieController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );
    logoController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    slideAnimation = Tween(begin: const Offset(0, 100), end: Offset.zero)
        .animate(logoController);
    lottieController.addListener(() {
      setState(() {
        if (lottieController.isAnimating) {
          logoController.forward();
        }
      });
    });
    logoController.addListener(() {
      setState(() {
        if (logoController.isCompleted) {
          setState(() {
            isLoaded = true;
          });
        }
      });
    });
  }
}
