import 'package:bookly/Features/Home/data/models/books_model/book_model.dart';
import 'package:bookly/core/utils/constant.dart';
import 'package:bookly/core/utils/img_assets.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key, required this.item});
final Item item;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Image.asset(
            ImgAssets.star,
            width: 10,
            height: 10,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            item.volumeInfo.averageRating.toString(),
            style: Styles.textStyleNum14.copyWith(color: kWhite70Opacity),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            '( ${item.volumeInfo.ratingsCount} )',
            style: Styles.textStyleNum14.copyWith(color: kWhite70Opacity),
          ),
        ),
      ],
    );
  }
}
