import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/config/colors/app_colors.dart';
import 'package:flutter_task/config/themes/font_weight.dart';
import 'package:flutter_task/core/helpers/spacing.dart';
import 'package:flutter_task/core/widgets/app_text.dart';

class FliterAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FliterAppBar({
    super.key,
    required this.title,
    this.onClose,
    this.onReset,
  });
  final String title;
  final VoidCallback? onClose;
  final VoidCallback? onReset;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      title: Row(
        children: [
          IconButton(
            icon: Icon(Icons.close, color: Colors.black),
            onPressed: onClose,
          ),
          Spacing.horizontalSpace(12),
          MyTextApp(
            title: title,
            size: 24.sp,
            fontWeight: FontWeightHelper.medium,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            onReset?.call();
          },
          child: MyTextApp(
            title: 'رجوع للافتراضي',
            size: 16.sp,
            fontWeight: FontWeightHelper.bold,
            color: AppColors.kPrimaryColor,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
