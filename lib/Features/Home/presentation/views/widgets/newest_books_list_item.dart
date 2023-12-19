import 'package:bookly/Features/Home/data/models/books_model/book_model.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/custome_book_image.dart';
import 'package:bookly/core/utils/constant.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class NewestBooksListItem extends StatelessWidget {
  const NewestBooksListItem({
    super.key,
    required this.items, this.index,
  });
  final Item items;

  final index;
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
              imageUrl:  items.volumeInfo.imageLinks.thumbnail,
              position: 'NewestBooks$index',
            ),
            const Expanded(child: SizedBox()),
            Expanded(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      items.volumeInfo.title,
                      style: Styles.textStyle20.copyWith(color: Colors.white),
                      maxLines: 2,
                    ),
                    Text(
                      items.volumeInfo.authors.toString().replaceAll('[', '').replaceAll(']', '')??'-',
                      style: Styles.textStyleNum14
                          .copyWith(color: kWhite70Opacity),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '${items.saleInfo.listPrice.amount } ${items.saleInfo.retailPrice.currencyCode}',
                            style: Styles.textStyleNum14,
                          ),
                        ),
                         Expanded(
                          child: BookRating(item: items,),
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
