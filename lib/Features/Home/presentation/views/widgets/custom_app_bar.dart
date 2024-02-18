import 'package:bookly/core/utils/img_assets.dart';
import 'package:flutter/material.dart';
class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  CustomAppBarState createState() => CustomAppBarState();
}

class CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            ImgAssets.logo,
            width: MediaQuery.of(context).size.width * .2,
            height: MediaQuery.of(context).size.height * .1,
            fit: BoxFit.scaleDown,
          ),
          const Spacer(),
          // Center(
          //   child: IconButton(
          //       onPressed: () {},
          //       icon: const Icon(
          //         FontAwesomeIcons.magnifyingGlass,
          //         size: 24,
          //       )),
          // ),
        ],
      ),
    );
  }
}
