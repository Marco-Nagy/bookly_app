import 'package:bookly/Features/Home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/custome_book_image.dart';
import 'package:bookly/core/products_model.dart';
import 'package:bookly/core/utils/constant.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BestSellerListItem extends StatelessWidget {
  const BestSellerListItem({
    Key? key,
    required this.demoProduct,
  }) : super(key: key);
  final ProductModel demoProduct;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 150,
        width: MediaQuery.sizeOf(context).width - 20,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            color: kPrimaryColor,
            boxShadow: [
              BoxShadow(color: kWhite70Opacity, blurRadius: 15.0),
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomBookImage(
              productModel: demoProduct,
              position: 'BestSeller',
            ),
            const Expanded(child: SizedBox()),
            Expanded(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Harry Potter and the Goblet of Fire',
                      style: Styles.textStyle20.copyWith(color: Colors.white),
                      maxLines: 2,
                    ),
                    Text(
                      'J.K. Rowling',
                      style: Styles.textStyleNum14
                          .copyWith(color: kWhite70Opacity),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '19.99 €',
                            style: Styles.textStyleNum14,
                          ),
                        ),
                        const Expanded(
                          child: BookRating(),
                        )
                      ],
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
