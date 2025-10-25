import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/config/colors/app_colors.dart';
import 'package:flutter_task/core/helpers/spacing.dart';
import 'package:flutter_task/generate/assets.dart';

/// Custom widget for displaying product actions (store badge, add to cart, etc.)
class ProductActionRow extends StatelessWidget {
  final VoidCallback? onAddToCart;

  const ProductActionRow({
    super.key,
    this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 15.r,
              backgroundColor: AppColors.kSkipButtonColor.withValues(alpha: 0.1),
              child: ImageIcon(
                AssetImage(Assets.assetsIconsIcRoundCorporateFare),
                size: 16.sp,
                color: AppColors.kSkipButtonColor,
              ),
            ),
            Positioned(
              top: 0,
              right: -1,
              child: Icon(
                Icons.check_circle,
                color: AppColors.kSkipButtonColor,
                size: 12.sp,
              ),
            ),
          ],
        ),
        Spacer(),
        GestureDetector(
          onTap: onAddToCart,
          child: Container(
            height: 24.h,
            width: 32.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              border: Border.all(color: AppColors.kGrayColor),
            ),
            child: Icon(Icons.add_shopping_cart, size: 15.sp),
          ),
        ),
        Spacing.horizontalSpace(12),
        Image(
          image: AssetImage(Assets.assetsIconsTm),
          height: 22.h,
          width: 15.w,
        ),
      ],
    );
  }
}
