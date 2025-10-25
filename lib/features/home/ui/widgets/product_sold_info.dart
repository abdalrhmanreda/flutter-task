import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/config/colors/app_colors.dart';
import 'package:flutter_task/core/helpers/spacing.dart';
import 'package:flutter_task/core/widgets/app_text.dart';
import 'package:flutter_task/gen/locale_keys.g.dart';

/// Custom widget for displaying sold information
class ProductSoldInfo extends StatelessWidget {
  final String soldCount;

  const ProductSoldInfo({
    super.key,
    required this.soldCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          Icons.local_fire_department,
          color: AppColors.kGrayColor,
          size: 15.sp,
        ),
        Spacing.horizontalSpace(4),
        MyTextApp(
          title: "${LocaleKeys.sold.tr()} $soldCount",
          size: 10.sp,
          color: AppColors.kGrayColor,
        ),
      ],
    );
  }
}
