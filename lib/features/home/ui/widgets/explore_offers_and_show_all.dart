import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/config/colors/app_colors.dart';
import 'package:flutter_task/config/themes/font_weight.dart';
import 'package:flutter_task/core/methods/responsive_text.dart';
import 'package:flutter_task/core/widgets/app_text.dart';
import 'package:flutter_task/gen/locale_keys.g.dart';

class ExploreOffersAndShowAll extends StatelessWidget {
  const ExploreOffersAndShowAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 87.h, right: 16.w, left: 16.w),
      child: Column(
        children: [
          Row(
            children: [
              MyTextApp(
                title: LocaleKeys.explore_offers.tr(),
                size: getResponsiveFontSize(context, fontSize: 16),
              ),
              const Spacer(),
              MyTextApp(
                title: LocaleKeys.all.tr(),
                size: getResponsiveFontSize(context, fontSize: 16),
                color: AppColors.kGreyColor,
                fontWeight: FontWeightHelper.bold,
              ),
              Icon(Icons.arrow_forward_outlined, color: AppColors.kGreyColor),
            ],
          ),
          OfferList(),
        ],
      ),
    );
  }
}

class OfferList extends StatelessWidget {
  const OfferList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
