import 'package:bookly/Features/Home/presentation/views/widgets/best_seller_list_item.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Best Seller',
          style: Styles.titleMedium18.copyWith(color: Colors.white),

        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => const BestSellerListItem(),
            itemCount: 30,
          ),
        ),
      ],
    );
  }
}
