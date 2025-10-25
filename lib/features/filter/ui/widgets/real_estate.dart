import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/config/colors/app_colors.dart';
import 'package:flutter_task/config/themes/font_weight.dart';
import 'package:flutter_task/core/helpers/spacing.dart';
import 'package:flutter_task/core/widgets/app_text.dart';

class RealEstateCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData? iconData;
  final String? assetIcon;
  final VoidCallback? onTapChange;
  final VoidCallback? onTapMainIcon;

  const RealEstateCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.iconData,
    this.assetIcon,
    this.onTapChange,
    this.onTapMainIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (assetIcon != null)
          ImageIcon(
            AssetImage(assetIcon!),
            color: AppColors.kOrangeColor,
            size: 28.w,
          )
        else if (iconData != null)
          Icon(iconData, size: 28.w),
        Spacing.horizontalSpace(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyTextApp(
              title: title,
              size: 14.sp,
              fontWeight: FontWeightHelper.medium,
            ),
            MyTextApp(
              title: subtitle,
              size: 12.sp,
              color: AppColors.kGreyColor,
              fontWeight: FontWeightHelper.regular,
            ),
          ],
        ),
        const Spacer(),
        if (onTapMainIcon == null)
          TextButton(
            onPressed: onTapChange,
            child: MyTextApp(
              title: 'تغيير',
              size: 14.sp,
              fontWeight: FontWeightHelper.bold,
              color: AppColors.kPrimaryColor,
            ),
          ),
        if (onTapMainIcon != null)
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios_rounded, size: 24),
            onPressed: onTapMainIcon,
          ),
      ],
    );
  }
}
