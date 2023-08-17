import 'package:bookly/Features/Home/presentation/views/widgets/book_actions.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/custom_details_app_bar.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:bookly/core/products_model.dart';
import 'package:bookly/core/utils/img_assets.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView(
      {Key? key, required this.productModel, required this.position})
      : super(key: key);
  final ProductModel productModel;
  final String position;

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
                        tag: '$position${(productModel.id).toString()}',
                        child: FadeInImage.assetNetwork(
                          fit: BoxFit.fill,
                          placeholderFit: BoxFit.scaleDown,
                          placeholder: ImgAssets.logo,
                          image: productModel.images[0],
                        ),    flightShuttleBuilder: (flightContext,
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
                            image: productModel.images[0],
                          ),
                        ),),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                'The Jungle Book',
                style: Styles.textStyle30,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Rudyard Kipling',
                style: Styles.titleMedium18.copyWith(
                    fontWeight: FontWeight.w900,
                    color: Colors.white.withOpacity(.7),
                    fontStyle: FontStyle.italic),
              ),
              const SizedBox(
                height: 16,
              ),
              const Center(
                child: BookRating(),
              ),
              const SizedBox(
                height: 37,
              ),
              const BookActions(),
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
