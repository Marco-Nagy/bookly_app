import 'package:bookly/Features/Home/data/models/books_model/book_model.dart';
import 'package:bookly/Features/Home/presentation/viewModels/similar_books/similar_books_cubit.dart';
import 'package:bookly/Features/Home/presentation/views/home_view.dart';
import 'package:bookly/Features/Home/presentation/views/book_details_view.dart';
import 'package:bookly/Features/Splash/presentation/views/splash_view.dart';
import 'package:bookly/core/utils/services_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kDetailsView = '/detailsView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        name: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kDetailsView,
        name: kDetailsView,
        builder: (context, state) {
          // Map<String, Item> args = state.extra as Map<String, Item>;
          return BlocProvider(
              create: (context) => SimilarBooksCubit(getIt()),
              child: BookDetailsView(items:state.pathParameters.values.first as Item, position: state.pathParameters.values.last),
            );
        },
      ),
    ],
  );
}
