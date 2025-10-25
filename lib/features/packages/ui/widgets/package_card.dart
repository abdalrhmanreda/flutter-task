import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/constant/app_constant.dart';
import 'package:flutter_task/core/helpers/spacing.dart';
import 'package:flutter_task/core/widgets/app_text.dart';
import 'package:flutter_task/core/widgets/custom_divider.dart';
import 'package:flutter_task/features/packages/data/models/package_model.dart';
import 'package:flutter_task/features/packages/ui/screens/packages_screen.dart';
import 'package:flutter_task/features/packages/ui/widgets/feature_item.dart';
import 'package:flutter_task/generate/assets.dart';

class PackageCard extends StatelessWidget {
  final PackageModel package;
  final bool isSelected;
  final VoidCallback onTap;

  const PackageCard({
    super.key,
    required this.package,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300, width: 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  border: Border.all(
                                    color: isSelected
                                        ? Colors.blue
                                        : Colors.grey,
                                    width: 2,
                                  ),
                                  color: isSelected
                                      ? Colors.blue
                                      : Colors.transparent,
                                ),
                                child: isSelected
                                    ? const Icon(
                                        Icons.check,
                                        size: 14,
                                        color: Colors.white,
                                      )
                                    : null,
                              ),
                              const SizedBox(width: 8),
                              MyTextApp(
                                title: package.name,

                                size: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: isSelected ? Colors.blue : Colors.black,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              MyTextApp(
                                title: 'ج.م',
                                size: 16.sp,
                                color: Colors.orange.shade700,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),

                              MyTextApp(
                                title: package.price,
                                size: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange.shade700,
                                decoration: TextDecoration.underline,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Spacing.verticalSpace(12),
                      myDivider(AppConstant.deviceWidth(context), 1.h),
                      Spacing.verticalSpace(12),
                      if (package.featuresCount > 0)
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: package.features
                                    .map(
                                      (feature) => FeatureItem(text: feature),
                                    )
                                    .toList(),
                              ),
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  package.featuresCount == 7
                                      ? Assets.assetsIcons7
                                      : package.featuresCount == 18
                                      ? Assets.assetsIcons18
                                      : Assets.assetsIcons24,
                                  width: 71,
                                  height: 42,
                                ),
                                SizedBox(height: 4.h),
                                MyTextApp(
                                  title: 'ضعف عدد\nالمشاهدات',
                                  size: 12.sp,
                                  color: Colors.black87,
                                  decoration: TextDecoration.underline,
                                ),
                              ],
                            ),
                          ],
                        )
                      else
                        ...package.features.map(
                          (feature) => FeatureItem(text: feature),
                        ),
                    ],
                  ),
                ),

                // Container(
                //   width: double.infinity,
                //   padding: const EdgeInsets.symmetric(vertical: 8),
                //   decoration: BoxDecoration(
                //     color: Colors.pink.shade50,
                //     borderRadius: const BorderRadius.only(
                //       bottomLeft: Radius.circular(12),
                //       bottomRight: Radius.circular(12),
                //     ),
                //   ),
                //   child: Text(
                //     package.badgeText!,
                //     textAlign: TextAlign.center,
                //     style: TextStyle(
                //       fontSize: 13,
                //       color: Colors.pink.shade400,
                //       fontWeight: FontWeight.w500,
                //     ),
                //   ),
                // ),
                // if (package.showMoreFeatures)
                //   Container(
                //     width: double.infinity,
                //     padding: const EdgeInsets.symmetric(vertical: 8),
                //     decoration: BoxDecoration(
                //       color: Colors.pink.shade50,
                //       borderRadius: const BorderRadius.only(
                //         bottomLeft: Radius.circular(12),
                //         bottomRight: Radius.circular(12),
                //       ),
                //     ),
                //     child: Text(
                //       'اعلى متشاهدات',
                //       textAlign: TextAlign.center,
                //       style: TextStyle(
                //         fontSize: 13,
                //         color: Colors.pink.shade400,
                //         fontWeight: FontWeight.w500,
                //       ),
                //     ),
                //   ),
              ],
            ),
          ),
          if (package.showBadge && package.badgeText != null)
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  Assets.assetsIconsRectagle,
                  width: 160,
                  height: 35,
                  fit: BoxFit.fill,
                ),
                MyTextApp(
                  title: package.badgeText!,
                  size: 12.sp,
                  color: Colors.red.withValues(alpha: .9),
                ),
              ],
            ),
          if (package.showMoreFeatures)
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  Assets.assetsIconsRectagle,
                  width: 160,
                  height: 35,
                  fit: BoxFit.fill,
                ),
                MyTextApp(
                  title: 'اعلى متشاهدات',
                  size: 12.sp,
                  color: Colors.red.withValues(alpha: .9),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
