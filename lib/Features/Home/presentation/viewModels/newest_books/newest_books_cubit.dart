import 'package:bloc/bloc.dart';
import 'package:bookly/Features/Home/data/models/books_model/book_model.dart';
import 'package:bookly/Features/Home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());
 final HomeRepo homeRepo;
 Future<void> fetchNewestBooks()async{
   emit(NewestBooksLoading());
 var result =await  homeRepo.fetchNewestBooks();
 result.fold((failure) {
   emit(NewestBooksFailure(failure.errorMsg));
 }, (books) {
   emit(NewestBooksSuccess(books));
 });
 }
}
