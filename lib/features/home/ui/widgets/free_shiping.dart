import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/config/colors/app_colors.dart';
import 'package:flutter_task/core/helpers/spacing.dart';
import 'package:flutter_task/core/widgets/app_text.dart';
import 'package:flutter_task/gen/locale_keys.g.dart';

import '../../../../generate/assets.dart';

class FreeShiping extends StatelessWidget {
  const FreeShiping({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      height: 32.h,
      width: 328.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        color: AppColors.kOrangeColor.withValues(alpha: 0.1),
      ),
      child: Row(
        children: [
          Icon(Icons.done_sharp, color: AppColors.kGreenColor, size: 24.sp),
          Spacing.horizontalSpace(4),
          MyTextApp(
            title: LocaleKeys.free_shipping.tr(),
            size: 13.sp,
            color: AppColors.kGreenColor,
          ),
          const Spacer(),
          MyTextApp(
            title: '${LocaleKeys.for_any_offer_you_order_now.tr()} !',
            size: 11.sp,
          ),
        ],
      ),
    );
  }
}
