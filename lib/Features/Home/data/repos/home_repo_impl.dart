import 'package:bookly/Features/Home/data/models/books_model/book_model.dart';
import 'package:bookly/Features/Home/data/repos/home_repo.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, BookModel>> fetchNewestBooks() async {
    try {
      var data = await apiService.get(
          endPoint:
              'volumes?Filtering=free-ebooks&Sorting=newest &subject=Programming &q=computer science');
      BookModel bookModel = const BookModel();
      bookModel = BookModel.fromJson(data);
      return right(bookModel);
    }  catch (error) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, BookModel>> fetchFeaturedBooks() {
    throw UnimplementedError();
  }
}
