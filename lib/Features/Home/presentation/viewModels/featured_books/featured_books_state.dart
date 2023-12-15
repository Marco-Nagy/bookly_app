part of 'featured_books_cubit.dart';

abstract class FeaturedBooksState extends Equatable {
  @override
  List<Object> get props => [];
  const FeaturedBooksState();
}

class FeaturedBooksInitial extends FeaturedBooksState {

}
 class FeaturedBooksLoading extends FeaturedBooksState {}
 class FeaturedBooksFailure extends FeaturedBooksState {
   final String errorMsg;
   const FeaturedBooksFailure(this.errorMsg);
 }

 class FeaturedBooksSuccess extends FeaturedBooksState {
  BookModel bookModel;

  FeaturedBooksSuccess(this.bookModel);
}
