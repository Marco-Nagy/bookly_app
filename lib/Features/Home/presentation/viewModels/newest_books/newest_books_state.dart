part of 'newest_books_cubit.dart';

abstract class NewestBooksState extends Equatable {
  @override
  List<Object> get props => [];
  const NewestBooksState();
}

class NewestBooksInitial extends NewestBooksState {

}
 class NewestBooksLoading extends NewestBooksState {}
 class NewestBooksFailure extends NewestBooksState {
   final String errorMsg;
   const NewestBooksFailure(this.errorMsg);
 }

 class NewestBooksSuccess extends NewestBooksState {
  BookModel bookModel;

  NewestBooksSuccess(this.bookModel);
}
