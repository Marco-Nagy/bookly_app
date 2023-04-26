import 'package:bookly/Features/Home/presentation/views/widgets/best_seller_list_item.dart';
import 'package:bookly/Features/Home/presentation/views/book_details_view.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/featured_books_list_view.dart';
import 'package:bookly/core/products_model.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  ScrollController scrollController = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      double value = scrollController.offset / 120;
      setState(() {
        topContainer = value;
        closeTopContainer = scrollController.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize:
                Size.fromHeight(MediaQuery.of(context).size.height * .05),
            child: const CustomAppBar()),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: closeTopContainer ? 0 : 1,
                child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: size.width,
                    height: closeTopContainer ? 0 : size.height * .25,
                    child: const FeaturedBooksListView()),
              ),
              const SizedBox(
                height: 50,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Best Seller',
                    style: Styles.titleMedium18.copyWith(color: Colors.white),
                  ),
                  Expanded(
                    // child: Container(
                    //   width: MediaQuery.sizeOf(context).width,
                    //   padding: const EdgeInsets.only(right: 2,left: 15,top: 10),
                    //   decoration: const BoxDecoration(
                    //       color: Colors.white,
                    //       borderRadius: BorderRadius.only(
                    //           topLeft: Radius.circular(50),
                    //           topRight: Radius.circular(5))),
                      child: ListView.builder(
                        controller: scrollController,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          double scale = 1.0;
                          if (topContainer > 0.5) {
                            scale = index + 0.5 - topContainer;
                            if (scale < 0) {
                              scale = 0;
                            } else if (scale > 1) {
                              scale = 1;
                            }
                          }
                          return Opacity(
                            opacity: scale,
                            child: Transform(
                              transform: Matrix4.identity()..scale(scale, scale),
                              alignment: Alignment.bottomCenter,
                              child:  Align(
                                  heightFactor: 0.7,
                                  alignment: Alignment.topCenter,
                                  child: GestureDetector(onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => BookDetailsView(productModel: demoProducts[index], position: 'BestSeller',)));
                                  },child: BestSellerListItem(demoProduct: demoProducts[index],))),
                            ),
                          );
                        },
                        itemCount: demoProducts.length,
                      ),
                    // ),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
