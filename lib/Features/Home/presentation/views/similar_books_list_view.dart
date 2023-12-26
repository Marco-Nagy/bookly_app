import 'package:bookly/Features/Home/presentation/viewModels/similar_books/similar_books_cubit.dart';
import 'package:bookly/Features/Home/presentation/views/book_details_view.dart';
import 'package:bookly/Features/Splash/presentation/views/widgets/loader.dart';
import 'package:bookly/core/utils/services_locator.dart';
import 'package:bookly/core/widgets/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/custome_book_image.dart';

class SimilarBooksListView extends StatefulWidget {
  const SimilarBooksListView({
    super.key,
  });

  @override
  State<SimilarBooksListView> createState() => _SimilarBooksListViewState();
}

class _SimilarBooksListViewState extends State<SimilarBooksListView> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess){
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BlocProvider(
                              create: (context) => SimilarBooksCubit(getIt()),
                              child: BookDetailsView(
                                items: state.bookModel.items[index],
                                position: 'SimilarBooks$index',
                              ),
                            )));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomBookImage(
                      imageUrl: state.bookModel.items[index].volumeInfo.imageLinks.thumbnail??'',
                      position: 'SimilarBooks$index',
                    ),
                    // child: SizedBox(),
                  ));
            },
            itemCount: state.bookModel.items.length,
          );
        }else if(state is SimilarBooksFailure){
          return ErrorScreen(errorMsg: state.errorMsg,);
        }else{
          return const Loader();
        }

      },
    );
  }
}
