import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task/config/colors/app_colors.dart';
import 'package:flutter_task/core/helpers/spacing.dart';
import 'package:flutter_task/core/widgets/app_text.dart';
import 'package:flutter_task/features/home/data/models/categories_image_model.dart';
import 'package:flutter_task/features/home/logic/cubit/home_cubit.dart';
import 'package:flutter_task/gen/locale_keys.g.dart';

import '../../../../generate/assets.dart';

class CategoriesImages extends StatelessWidget {
  const CategoriesImages({super.key});

  @override
  Widget build(BuildContext context) {
    List<CategoriesImageModel> categoriesImages = context
        .read<HomeCubit>()
        .categoriesImages;
    return SizedBox(
      height: 95.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoriesImages.length,
        itemBuilder: (context, index) {
          return SizedBox(
            width: 78.w,
            height: 78.h,
            child: Column(
              children: [
                Container(
                  height: 56.h,
                  width: 73.w,
                  margin: EdgeInsets.only(left: 12.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    image: DecorationImage(
                      image: AssetImage(categoriesImages[index].image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Spacing.verticalSpace(8),
                MyTextApp(title: categoriesImages[index].title, size: 12.sp),
              ],
            ),
          );
        },
      ),
    );
  }
}
