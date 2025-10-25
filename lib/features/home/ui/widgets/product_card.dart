import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/config/colors/app_colors.dart';
import 'package:flutter_task/core/helpers/spacing.dart';
import 'package:flutter_task/features/home/data/models/product_model.dart';
import 'package:flutter_task/features/home/ui/widgets/product_action_row.dart';
import 'package:flutter_task/features/home/ui/widgets/product_image_widget.dart';
import 'package:flutter_task/features/home/ui/widgets/product_price_row.dart';
import 'package:flutter_task/features/home/ui/widgets/product_sold_info.dart';
import 'package:flutter_task/features/home/ui/widgets/product_title_row.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(color: AppColors.kGrayColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          ProductImageWidget(imageUrl: product.image),

          Padding(
            padding: EdgeInsets.all(8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                ProductTitleRow(title: product.title),

                Spacing.verticalSpace(8),

                // Price Row
                ProductPriceRow(
                  newPrice: product.newPrice,
                  oldPrice: product.oldPrice,
                  onFavoriteTap: () {
                    // Handle favorite tap
                  },
                ),

                Spacing.verticalSpace(8),

                // Sold Info
                ProductSoldInfo(soldCount: "3.3k"),

                // Date and Discount
                Spacing.verticalSpace(31),

                // Action Row
                ProductActionRow(
                  onAddToCart: () {
                    // Handle add to cart
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
