import 'package:flutter/material.dart';

import '../../../Splash/presentation/views/widgets/loader.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Loader(),);
  }
}
