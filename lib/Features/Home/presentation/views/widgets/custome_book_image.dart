import 'package:bookly/core/products_model.dart';
import 'package:bookly/core/utils/img_assets.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
   const CustomBookImage({Key? key,required this.productModel, required this.position}) : super(key: key);
final ProductModel productModel;
final String position;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.5/4,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration:  BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Hero(
          tag: '$position${(productModel.id).toString()}',
          flightShuttleBuilder: (flightContext, animation, flightDirection, fromHeroContext, toHeroContext) =>  RotationTransition(turns: animation,child: FadeInImage.assetNetwork(
            fit: BoxFit.fill,
            placeholderFit: BoxFit.scaleDown,
            placeholder: ImgAssets.logo,
            image:
            productModel.images[0],
          ) ,) ,
          child: FadeInImage.assetNetwork(
            fit: BoxFit.fill,
            placeholderFit: BoxFit.scaleDown,
            placeholder: ImgAssets.logo,
            image:
            productModel.images[0],
          )
        ),
      ),
    );
  }
}
