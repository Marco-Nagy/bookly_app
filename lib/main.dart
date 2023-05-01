import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'Features/Splash/presentation/views/splash_view.dart';

void main() {
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: kPrimaryColor),
      // home: const SplashView(),
    );
  }
}


