import 'package:bookly/Features/Home/data/models/books_model/book_model.dart';
import 'package:bookly/Features/Home/data/repos/home_repo.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, BookModel>> fetchNewestBooks() async {
    try {
      var data = await apiService.get(
          endPoint:
              'volumes?Filtering=free-ebooks&Sorting=newest &q=computer science');
      BookModel bookModel =  BookModel(totalItems: 0, kind: '', items: []);
      bookModel = BookModel.fromJson(data);
      debugPrint('$data');

      return right(bookModel);
    }  catch (error) {
      debugPrint('error $error');


      if(error is DioException) {
        return Left(ServerFailure.fromDioException(error));
      }
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, BookModel>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.get(
          endPoint:
          'volumes?Filtering=free-ebooks&subject=programing&q=computer');
      BookModel bookModel =  BookModel(totalItems: 0, kind: '', items: []);
      bookModel = BookModel.fromJson(data);
      return right(bookModel);
    }  catch (error) {
      if(error is DioException) {
        return Left(ServerFailure.fromDioException(error));
      }
      return Left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, BookModel>> fetchSimilarBooks({required String category}) async {
    try {
      var data = await apiService.get(
          endPoint:
          'volumes?Filtering=free-ebooks&Sorting=relevance &q=$category');
      BookModel bookModel =  BookModel(totalItems: 0, kind: '', items: []);
      bookModel = BookModel.fromJson(data);
      return right(bookModel);
    }  catch (error) {
      if(error is DioException) {
        return Left(ServerFailure.fromDioException(error));
      }
      return Left(ServerFailure(error.toString()));
    }
  }
}
