import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/config/colors/app_colors.dart';
import 'package:flutter_task/config/routes/routes_path.dart';
import 'package:flutter_task/config/themes/font_weight.dart';
import 'package:flutter_task/core/methods/responsive_text.dart';
import 'package:flutter_task/core/widgets/app_text.dart';
import 'package:flutter_task/features/home/logic/cubit/home_cubit.dart';
import 'package:flutter_task/features/home/ui/widgets/categories_list.dart';
import 'package:flutter_task/gen/locale_keys.g.dart';

class ExploreOffersAndShowAll extends StatelessWidget {
  const ExploreOffersAndShowAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 87.h),
      child: Column(
        children: [
          Row(
            children: [
              MyTextApp(
                title: LocaleKeys.explore_offers.tr(),
                size: 16.sp,
                fontWeight: FontWeightHelper.medium,
              ),
              const Spacer(),
              MyTextApp(
                title: LocaleKeys.all.tr(),
                size: getResponsiveFontSize(context, fontSize: 16),
                color: AppColors.kGreyColor,
                fontWeight: FontWeightHelper.bold,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RoutePath.filter);
                },
                child: Icon(
                  Icons.arrow_forward_outlined,
                  color: AppColors.kGreyColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          CategoriesList(),
        ],
      ),
    );
  }
}
