import 'package:bookly/Features/Home/presentation/views/home_view.dart';
import 'package:bookly/Features/Home/presentation/views/book_details_view.dart';
import 'package:bookly/Features/Splash/presentation/views/splash_view.dart';
import 'package:bookly/core/products_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter  {
  static const kHomeView= '/homeView';
  static const kDetailsView= '/detailsView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      // GoRoute(
      //   path: kDetailsView,
      //   builder: (context, state) =>  BookDetailsView(productModel: demoProducts[0],),
      // ),
    ],
  );
}
