import 'package:bloc/bloc.dart';
import 'package:bookly/Features/Home/data/models/books_model/book_model.dart';
import 'package:bookly/Features/Home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  final HomeRepo homeRepo;
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());
  Future<void> fetchSimilarBooks({required String category})async{
    emit(SimilarBooksLoading());
    var result =await  homeRepo.fetchSimilarBooks(category: category);
    result.fold((failure) {
      emit(SimilarBooksFailure(failure.errorMsg));
    }, (books) {
      emit(SimilarBooksSuccess(books));
    });
  }

}
