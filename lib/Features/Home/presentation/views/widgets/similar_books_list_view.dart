import 'package:bookly/Features/Home/presentation/views/book_details_view.dart';
import 'package:bookly/core/products_model.dart';
import 'package:flutter/material.dart';

import 'custome_book_image.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {
              // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BookDetailsView(productModel: demoProducts[index], position: 'SimilarBooks',)));
            },
            child:  Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomBookImage(
                imageUrl:'https://imgv3.fotor.com/images/gallery/Fiction-Book-Covers.jpg',
                position: 'SimilarBooks$index',
              ),
              // child: SizedBox(),
            ));
      },
      itemCount: items.length,
    );
  }
}
