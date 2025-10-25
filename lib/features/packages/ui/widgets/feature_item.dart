import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/config/themes/font_weight.dart';
import 'package:flutter_task/core/widgets/app_text.dart';

class FeatureItem extends StatelessWidget {
  final String text;

  const FeatureItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    IconData icon = Icons.access_time;

    if (text.contains('رفع')) {
      icon = Icons.arrow_upward;
    } else if (text.contains('تثبيت')) {
      icon = Icons.push_pin_outlined;
    } else if (text.contains('ظهور')) {
      icon = Icons.public;
    } else if (text.contains('اعلى مميز')) {
      icon = Icons.verified_outlined;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
             Icon(icon, size: 16, color: Colors.black87),
                       const SizedBox(width: 3),

          MyTextApp(
        title:     text,
            align: TextAlign.right,
            fontWeight: FontWeightHelper.medium,
              size: 14.sp,
              color: text.contains('خلال') ? Colors.red : Colors.black,
            
          ),
       
        ],
      ),
    );
  }
}
