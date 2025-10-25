import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/helpers/spacing.dart';
import 'package:flutter_task/features/home/logic/cubit/home_cubit.dart';
import 'package:flutter_task/features/home/logic/cubit/home_state.dart';
import 'package:flutter_task/features/home/ui/widgets/categories_images.dart';
import 'package:flutter_task/features/home/ui/widgets/categories_list.dart';
import 'package:flutter_task/features/home/ui/widgets/explore_offers_and_show_all.dart';
import 'package:flutter_task/features/home/ui/widgets/free_shiping.dart';
import 'package:flutter_task/features/home/ui/widgets/products_grid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(right: 16.w, left: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ExploreOffersAndShowAll(),
                  Spacing.verticalSpace(33),
                  CategoriesImages(),
                  Spacing.verticalSpace(33),
                  FreeShiping(),
                  ProductsGrid(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
