import 'package:bookly/Features/Home/presentation/viewModels/featured_books/featured_books_cubit.dart';
import 'package:bookly/Features/Home/presentation/viewModels/similar_books/similar_books_cubit.dart';
import 'package:bookly/Features/Home/presentation/views/book_details_view.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/custome_book_image.dart';
import 'package:bookly/Features/Splash/presentation/views/widgets/loader.dart';
import 'package:bookly/core/utils/services_locator.dart';
import 'package:bookly/core/widgets/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksListView extends StatefulWidget {
  const FeaturedBooksListView({super.key});

  @override
  State<FeaturedBooksListView> createState() => _FeaturedBooksListViewState();
}

class _FeaturedBooksListViewState extends State<FeaturedBooksListView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchData();
  }
  _fetchData() {
    BlocProvider.of<FeaturedBooksCubit>(context).fetchFeaturedBooks();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: RotatedBox(
              quarterTurns: 1,
              child: ListWheelScrollView.useDelegate(
                itemExtent: MediaQuery.of(context).size.height * .2,
                physics: const FixedExtentScrollPhysics(),
                squeeze: .9,
                diameterRatio: 1.5,
                childDelegate: ListWheelChildBuilderDelegate(
                    builder: (BuildContext context, int index) => InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BlocProvider(
  create: (context) => SimilarBooksCubit(getIt()),
  child: BookDetailsView(
                                          items: state.bookModel.items[index],
                                          position: 'FeaturedBooks$index',
                                        ),
)));
                          },
                          child: RotatedBox(
                              quarterTurns: 3,
                              child: CustomBookImage(
                                imageUrl:state.bookModel.items[index].volumeInfo.imageLinks.thumbnail,
                                position: 'FeaturedBooks$index',
                              )),
                        ),
                    childCount: state.bookModel.items.length),
              ),
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return ErrorScreen(errorMsg: state.errorMsg,onPress: ()=>_fetchData(),);
        }else{
          return const Loader();
        }

      },
    );
  }
}
