import 'package:bookly/core/utils/constant.dart';
import 'package:bookly/core/utils/img_assets.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BestSellerListItem extends StatelessWidget {
  const BestSellerListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 150,
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
            SizedBox(
              height: MediaQuery.of(context).size.height * .15,
              child: AspectRatio(
                aspectRatio: 2.5 / 4,
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Image.network(
                    'https://imgv3.fotor.com/images/gallery/Fiction-Book-Covers.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
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
                      style:
                          Styles.textStyle14.copyWith(color: kWhite70Opacity),
                    ),
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            '19.99 €',
                            style: Styles.textStyleNum14,
                          ),
                        ),

                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Image.asset(
                                  ImgAssets.star,
                                  width: 10,
                                  height: 10,
                                ),
                              ),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  '4.5',
                                  style: Styles.textStyleNum14
                                      .copyWith(color: kWhite70Opacity),
                                ),
                              ),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  '( 2390 )',
                                  style: Styles.textStyle14
                                      .copyWith(color: kWhite70Opacity),
                                ),
                              ),
                            ],
                          ),
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
