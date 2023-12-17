import 'package:bookly/Features/Home/presentation/viewModels/newest_books/newest_books_cubit.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/featured_books_list_view.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/newest_books_list_item.dart';
import 'package:bookly/Features/Home/presentation/views/widgets/newest_books_list_view.dart';
import 'package:bookly/Features/Splash/presentation/views/widgets/loader.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                    'Newest Books',
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
                    child:NewestBooksListView(scrollController: scrollController, topContainer: topContainer) ,
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
