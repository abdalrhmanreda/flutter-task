import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/config/colors/app_colors.dart';
import 'package:flutter_task/config/themes/font_weight.dart';

/// Custom widget for displaying product prices with favorite icon
class ProductPriceRow extends StatelessWidget {
  final String newPrice;
  final String oldPrice;
  final VoidCallback? onFavoriteTap;

  const ProductPriceRow({
    super.key,
    required this.newPrice,
    required this.oldPrice,
    this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RichText(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
              children: [
                TextSpan(
                  text: '$newPrice ج.م/',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 14.sp,
                    fontWeight: FontWeightHelper.medium,
                  ),
                ),
                TextSpan(
                  text: oldPrice,
                  style: TextStyle(
                    color: AppColors.kGrayColor,
                    fontSize: 12.sp,
                    decoration: TextDecoration.lineThrough,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: onFavoriteTap,
          child: Icon(
            Icons.favorite_border_outlined,
            color: AppColors.kGrayColor,
            size: 20.sp,
          ),
        ),
      ],
    );
  }
}
