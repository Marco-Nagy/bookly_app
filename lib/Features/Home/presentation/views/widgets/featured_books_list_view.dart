import 'package:bookly/Features/Home/presentation/views/widgets/custome_list_view_item.dart';
import 'package:flutter/material.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: RotatedBox(
        quarterTurns: 1,
        child: ListWheelScrollView.useDelegate(
          itemExtent: MediaQuery.of(context).size.height * .2,
          physics: const FixedExtentScrollPhysics(),
          squeeze: .9,
          diameterRatio: 1.5,
          childDelegate: ListWheelChildBuilderDelegate(
              builder: (BuildContext context, int index) => const RotatedBox(
                  quarterTurns: 3, child: CustomListViewItem()),
              childCount: 30),
        ),
      ),
    );
  }
}
