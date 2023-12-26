import 'package:bookly/Features/Home/data/models/books_model/book_model.dart';
import 'package:bookly/Features/Home/presentation/viewModels/similar_books/similar_books_cubit.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/book_actions.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/custom_details_app_bar.dart';
import 'package:bookly/Features/Home/presentation/views/similar_books_list_view.dart';
import 'package:bookly/core/utils/img_assets.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView(
      {super.key, required this.items, required this.position});
  final Item items;
  final String position;

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchData();
  }

  _fetchData() {
    BlocProvider.of<SimilarBooksCubit>(context).fetchSimilarBooks(category: widget.items.volumeInfo.categories.first.toString());
    print('======${widget.items.volumeInfo.categories.first}');
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomDetailsAppBar(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * .2),
                child: AspectRatio(
                  aspectRatio: 2.5 / 4,
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Hero(
                      tag: widget.position,
                      child: FadeInImage.assetNetwork(
                        fit: BoxFit.fill,
                        placeholderFit: BoxFit.scaleDown,
                        placeholder: ImgAssets.logo,
                        image: widget.items.volumeInfo .imageLinks .thumbnail??'',
                        imageErrorBuilder:  (context, error, stackTrace) {
                          return const Image(
                            image: AssetImage(ImgAssets.logo),
                            height: 60,
                            width: 60,
                            fit: BoxFit.contain,
                          );
                        },

                      ),
                      flightShuttleBuilder: (flightContext,
                              animation,
                              flightDirection,
                              fromHeroContext,
                              toHeroContext) =>
                          RotationTransition(
                        turns: animation,
                        child: FadeInImage.assetNetwork(
                          fit: BoxFit.fill,
                          placeholderFit: BoxFit.scaleDown,
                          placeholder: ImgAssets.logo,
                          image: widget.items.volumeInfo.imageLinks .thumbnail??'',
                          imageErrorBuilder:  (context, error, stackTrace) {
                            return const Image(
                              image: AssetImage(ImgAssets.logo),
                              height: 60,
                              width: 60,
                              fit: BoxFit.contain,
                            );
                          },
                        ),
                      ),

                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
               Text(
                widget.items.volumeInfo.title,
                style: Styles.textStyle30,
                 maxLines: 1,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                widget.items.volumeInfo.authors.toString().replaceAll('[', '').replaceAll(']', '')??'-',
                style: Styles.titleMedium18.copyWith(
                    fontWeight: FontWeight.w900,
                    color: Colors.white.withOpacity(.7),
                    fontStyle: FontStyle.italic),
              ),
              const SizedBox(
                height: 16,
              ),
               Center(
                child: BookRating(item: widget.items,),
              ),
              const SizedBox(
                height: 37,
              ),
               BookActions(item: widget.items ),
              const SizedBox(
                height: 50,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'You can also like',
                  textAlign: TextAlign.left,
                  style: Styles.titleMedium18.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              const Expanded(
                child: SimilarBooksListView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
