import 'package:bookly/Features/Home/data/repos/home_repo.dart';
import 'package:bookly/Features/Home/data/repos/home_repo_impl.dart';
import 'package:bookly/Features/Home/presentation/viewModels/featured_books/featured_books_cubit.dart';
import 'package:bookly/Features/Home/presentation/viewModels/newest_books/newest_books_cubit.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;
void setupServiceLocator() {
  //? Cubits
  getIt.registerFactory<FeaturedBooksCubit>(() => FeaturedBooksCubit(getIt()));
  getIt.registerFactory<NewestBooksCubit>(() => NewestBooksCubit(getIt()));
  //! Data source
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt()));
  //! Repository
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepoImpl(getIt()));


// Alternatively you could write it if you don't like global variables

}