import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../config/colors/app_colors.dart';

class CustomSmoothIndicator extends StatelessWidget {
  const CustomSmoothIndicator({
    super.key,
    required this.pageController,
    required this.count,
  });
  final PageController pageController;
  final int count;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: pageController,
      count: count,
      effect: ExpandingDotsEffect(
        dotColor: AppColors.kGrayColor,
        activeDotColor: (AppColors.kPrimaryColor),
        dotHeight: 9.h,
        dotWidth: 8.w,
        expansionFactor: 4.0,
        spacing: 5,
      ),
    );
  }
}
