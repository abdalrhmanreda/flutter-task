import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/config/themes/font_weight.dart';
import 'package:flutter_task/core/widgets/app_text.dart';
import 'package:flutter_task/generate/assets.dart';

/// Custom widget for displaying product title with offer icon
class ProductTitleRow extends StatelessWidget {
  final String title;

  const ProductTitleRow({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: MyTextApp(
            title: title,
            size: 14.sp,
            maxLines: 1,
            fontWeight: FontWeightHelper.medium,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        ImageIcon(
          AssetImage(Assets.assetsIconsOffer),
          size: 20.sp,
          color: Colors.red,
        ),
      ],
    );
  }
}
