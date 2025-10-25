import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/config/colors/app_colors.dart';
import 'package:flutter_task/config/themes/font_weight.dart';
import 'package:flutter_task/core/helpers/spacing.dart';
import 'package:flutter_task/core/widgets/app_text.dart';

class SpecificPackages extends StatelessWidget {

  const SpecificPackages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: double.infinity,
      height: 79.h,
      decoration: BoxDecoration(
        color: AppColors.kGrayColor.withValues(alpha: .1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyTextApp(
                 title:    'باقات محددة مخصصة لك',
              size: 14.sp,
              fontWeight: FontWeightHelper.medium,
              color: AppColors.kBlackColor,
            
          ),
          Spacing.verticalSpace(4),
          MyTextApp(
            title: 'تواصل معنا لأختيار الباقة المناسبة لك',
            size: 12.sp,
            fontWeight: FontWeightHelper.regular,
            color: AppColors.kGrayColor,
          ),
                   Spacing.verticalSpace(4),

          MyTextApp(title: 'فريق المبيعات', size: 16.sp, fontWeight: FontWeightHelper.bold, color: AppColors.kPrimaryColor,),
        ],
      ),

    ) ; }
}
