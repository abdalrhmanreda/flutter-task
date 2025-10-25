import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/config/colors/app_colors.dart';
import 'package:flutter_task/config/themes/font_weight.dart';
import 'package:flutter_task/core/methods/responsive_text.dart';
import 'package:flutter_task/core/widgets/app_text.dart';
import 'package:flutter_task/features/home/logic/cubit/home_cubit.dart';
import 'package:flutter_task/features/home/logic/cubit/home_state.dart';
import 'package:flutter_task/gen/locale_keys.g.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> offers = [
      LocaleKeys.all_offers.tr(),
      LocaleKeys.clothes.tr(),
      LocaleKeys.accessories.tr(),
      LocaleKeys.electronics.tr(),
      LocaleKeys.furniture.tr(),
      LocaleKeys.jewelry.tr(),
      LocaleKeys.shoes.tr(),
      LocaleKeys.man_fashion.tr(),
      LocaleKeys.watches.tr(),
      LocaleKeys.mobiles.tr(),
      LocaleKeys.beauty_products.tr(),
    ];

    return SizedBox(
      height: 41.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: offers.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              context.read<HomeCubit>().changeOfferIndex(index);
            },
            child: Container(
              margin: EdgeInsets.only(left: 8.w),
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: context.read<HomeCubit>().offerIndex == index
                    ? AppColors.kOrangeColor.withOpacity(0.09)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(4.r),
                border: Border.all(color: AppColors.kGrayColor),
              ),
              child: MyTextApp(
                title: offers[index],
                size: getResponsiveFontSize(context, fontSize: 16),
                color: context.read<HomeCubit>().offerIndex == index
                    ? AppColors.kOrangeColor
                    : AppColors.kGreyColor,
              ),
            ),
          );
        },
      ),
    );
  }
}
