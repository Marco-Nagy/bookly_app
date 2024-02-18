import 'package:bookly/Features/Home/data/models/books_model/book_model.dart';
import 'package:bookly/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BookActions extends StatelessWidget {
  const BookActions({super.key, required this.item});
  final Item item;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Expanded(
            child: CustomButton(
          text: item.saleInfo.listPrice.amount.toDouble()==0.0?'Free':'${item.saleInfo.listPrice.amount} ${item.saleInfo.listPrice.currencyCode}',
          textColor: Colors.black,
          backGroundColor: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
        )),
         Expanded(
            child: CustomButton(
          text: 'Preview',
          onPressed: () async {
            Uri url = Uri.parse(item.volumeInfo.previewLink);
            if(await launchUrl(url)) {
              await launchUrl(url);
            }
          },
          textColor: Colors.white,
          backGroundColor: const Color.fromRGBO(239, 130, 98, 1),
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(12), bottomRight: Radius.circular(12)),
        )),
      ],
    );
  }
}
