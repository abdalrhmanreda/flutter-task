import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/config/colors/app_colors.dart';
import 'package:flutter_task/config/themes/font_weight.dart';
import 'package:flutter_task/core/widgets/app_text.dart';

/// Section title widget for filter screen
class FilterSectionTitle extends StatelessWidget {
  final String title;

  const FilterSectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return MyTextApp(
      title: title,
      size: 16.sp,
      fontWeight: FontWeightHelper.medium,
      color: AppColors.kGreyColor,
    );
  }
}
