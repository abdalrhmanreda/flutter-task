import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_task/features/home/ui/widgets/explore_offers_and_show_all.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Column(children: [ExploreOffersAndShowAll()]),
      ),
    );
  }
}
