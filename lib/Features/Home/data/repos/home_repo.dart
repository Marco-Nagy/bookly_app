import 'package:bookly/Features/Home/data/models/books_model/book_model.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, BookModel>> fetchNewestBooks();

  Future<Either<Failure, BookModel>>  fetchFeaturedBooks();
  Future<Either<Failure, BookModel>>  fetchSimilarBooks({required String category});
}
