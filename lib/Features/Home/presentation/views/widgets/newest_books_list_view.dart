import 'package:bookly/Features/Home/presentation/viewModels/newest_books/newest_books_cubit.dart';
import 'package:bookly/Features/Home/presentation/views/book_details_view.dart';
import 'package:bookly/Features/Splash/presentation/views/widgets/loader.dart';

import 'package:bookly/core/widgets/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'newest_books_list_item.dart';

class NewestBooksListView extends StatefulWidget {
  const NewestBooksListView(
      {super.key, required this.scrollController, required this.topContainer});

  final ScrollController scrollController;

  final double topContainer;

  @override
  State<NewestBooksListView> createState() => _NewestBooksListViewState();
}

class _NewestBooksListViewState extends State<NewestBooksListView> {
  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  _fetchData() {
    BlocProvider.of<NewestBooksCubit>(context).fetchNewestBooks();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return ListView.builder(
            controller: widget.scrollController,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              double scale = 1.0;
              if (widget.topContainer > 0.5) {
                scale = index + 0.5 - widget.topContainer;
                if (scale < 0) {
                  scale = 0;
                } else if (scale > 1) {
                  scale = 1;
                }
              }
              return Opacity(
                opacity: scale,
                child: Transform(
                  transform: Matrix4.identity()..scale(scale, scale),
                  alignment: Alignment.bottomCenter,
                  child: Align(
                      heightFactor: 0.7,
                      alignment: Alignment.topCenter,
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BookDetailsView(
                                          items: state.bookModel.items[index],
                                          position: 'NewestBooks$index',
                                        )));
                            print('NewestBooks$index');
                          },
                          child: NewestBooksListItem(
                            items: state.bookModel.items[index],
                            index: index,
                          ))),
                ),
              );
            },
            itemCount: state.bookModel.items.length,
          );
        } else if (state is NewestBooksFailure) {
          return ErrorScreen(
            errorMsg: state.errorMsg,
            onPress: () => _fetchData(),
          );
        } else {
          return const Loader();
        }
      },
    );
  }
}
