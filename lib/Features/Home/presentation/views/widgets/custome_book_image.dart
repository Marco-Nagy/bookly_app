import 'package:bookly/core/utils/img_assets.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage(
      {super.key, required this.imageUrl, required this.position});
  final String imageUrl;
  final String position;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.5 / 4,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Hero(
            tag: position,
            flightShuttleBuilder: (flightContext, animation, flightDirection,
                    fromHeroContext, toHeroContext) =>
                RotationTransition(
                  turns: animation,
                  child:FadeInImage.assetNetwork(
                    fit: BoxFit.fill,
                    placeholderFit: BoxFit.scaleDown,
                    placeholder: ImgAssets.logo,
                    imageErrorBuilder:  (context, error, stackTrace) {
                      return const Image(
                        image: AssetImage(ImgAssets.logo),
                        height: 60,
                        width: 60,
                        fit: BoxFit.contain,
                      );
                    },
                    image: imageUrl,
                  ),
                ),
            child:  FadeInImage.assetNetwork(
              fit: BoxFit.fill,
              placeholderFit: BoxFit.scaleDown,
              placeholder: ImgAssets.logo,
              image: imageUrl,
              imageErrorBuilder:  (context, error, stackTrace) {
                return const Image(
                  image: AssetImage(ImgAssets.logo),
                  height: 60,
                  width: 60,
                  fit: BoxFit.contain,
                );
              },

            )),
      ),
    );
  }
}
