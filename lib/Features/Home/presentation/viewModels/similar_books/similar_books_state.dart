part of 'similar_books_cubit.dart';

abstract class SimilarBooksState extends Equatable {
  const SimilarBooksState();
  @override
  List<Object> get props => [];
}

class SimilarBooksInitial extends SimilarBooksState {}
class SimilarBooksLoading extends SimilarBooksState {}
class SimilarBooksFailure extends SimilarBooksState {
  final String errorMsg;
  const SimilarBooksFailure(this.errorMsg);
}

class SimilarBooksSuccess extends SimilarBooksState {
  BookModel bookModel;

  SimilarBooksSuccess(this.bookModel);
}

