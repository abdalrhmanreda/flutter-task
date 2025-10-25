import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/config/colors/app_colors.dart';
import 'package:flutter_task/config/themes/font_weight.dart';
import 'package:flutter_task/core/constant/app_constant.dart';
import 'package:flutter_task/core/helpers/spacing.dart';
import 'package:flutter_task/core/widgets/custom_divider.dart';
import 'package:flutter_task/features/filter/logic/cubit/filter_cubit.dart';
import 'package:flutter_task/features/filter/logic/cubit/filter_state.dart';
import 'package:flutter_task/features/filter/ui/widgets/filter_chip_widget.dart';
import 'package:flutter_task/features/filter/ui/widgets/filter_section_title.dart';
import 'package:flutter_task/features/filter/ui/widgets/filter_text_field.dart';
import 'package:flutter_task/core/widgets/app_text.dart';
import 'package:flutter_task/features/filter/ui/widgets/fliter_app_bar.dart';
import 'package:flutter_task/features/filter/ui/widgets/real_estate.dart';
import 'package:flutter_task/generate/assets.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FilterCubit, FilterState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = context.read<FilterCubit>();
        return Scaffold(
          appBar: FliterAppBar(
            title: 'فلترة',
            onClose: () => Navigator.pop(context),
            onReset: () => cubit.resetFilter(),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Category Section
                FilterSectionTitle(title: 'الفئة'),
                Spacing.verticalSpace(12),
                RealEstateCard(
                  title: 'عقارات',
                  subtitle: 'فلل للبيع',
                  assetIcon:
                      Assets.assetsIconsMaterialSymbolsRealEstateAgentRounded,
                  onTapChange: () {
                    // نفّذ الإجراء عند الضغط على "تغيير"
                  },
                ),
                Spacing.verticalSpace(20),
                myDivider(AppConstant.deviceHeight(context), 1.h),
                Spacing.verticalSpace(20),
                RealEstateCard(
                  title: 'الموقع',
                  subtitle: 'مصر',
                  iconData: Icons.location_on_outlined,
                  onTapMainIcon: () {},
                ),

                Spacing.verticalSpace(20),
                myDivider(AppConstant.deviceHeight(context), 1.h),
                Spacing.verticalSpace(20),
                // Monthly Payments Section
                FilterSectionTitle(title: 'الأقساط الشهرية'),
                Spacing.verticalSpace(12),
                Row(
                  children: [
                    Expanded(child: FilterTextField(hint: '')),
                    Spacing.horizontalSpace(12),
                    Expanded(child: FilterTextField(hint: '')),
                  ],
                ),

                Spacing.verticalSpace(20),

                // Type Section
                FilterSectionTitle(title: 'النوع'),
                Spacing.verticalSpace(12),
                Wrap(
                  spacing: 8.w,
                  runSpacing: 8.h,
                  children: [
                    FilterChipWidget(
                      label: 'الكل',
                      isSelected: cubit.filterModel.type == 'all',
                      onTap: () => cubit.updateType('all'),
                    ),
                    FilterChipWidget(
                      label: 'بيوت هاوس',
                      isSelected: cubit.filterModel.type == 'house',
                      onTap: () => cubit.updateType('house'),
                    ),
                    FilterChipWidget(
                      label: 'فيلا منفصلة',
                      isSelected: cubit.filterModel.type == 'villa',
                      onTap: () => cubit.updateType('villa'),
                    ),
                    FilterChipWidget(
                      label: 'تاون هاوس',
                      isSelected: cubit.filterModel.type == 'townhouse',
                      onTap: () => cubit.updateType('townhouse'),
                    ),
                  ],
                ),

                Spacing.verticalSpace(20),

                // Room Count Section
                FilterSectionTitle(title: 'عدد الغرف'),
                Spacing.verticalSpace(12),
                Wrap(
                  spacing: 5.w,
                  runSpacing: 8.h,
                  children: [
                    FilterChipWidget(
                      label: '5 غرف+',
                      isSelected: cubit.filterModel.roomCount == '5+',
                      onTap: () => cubit.updateRoomCount('5+'),
                    ),
                    FilterChipWidget(
                      label: '4 غرف',
                      isSelected: cubit.filterModel.roomCount == '4',
                      onTap: () => cubit.updateRoomCount('4'),
                    ),
                    FilterChipWidget(
                      label: 'الكل',
                      isSelected: cubit.filterModel.roomCount == 'all',
                      onTap: () => cubit.updateRoomCount('all'),
                    ),
                    FilterChipWidget(
                      label: 'غرفتين',
                      isSelected: cubit.filterModel.roomCount == '2',
                      onTap: () => cubit.updateRoomCount('2'),
                    ),
                    FilterChipWidget(
                      label: '3 غرف',
                      isSelected: cubit.filterModel.roomCount == '3',
                      onTap: () => cubit.updateRoomCount('3'),
                    ),
                  ],
                ),

                Spacing.verticalSpace(20),

                // Price Range Section
                FilterSectionTitle(title: 'السعر'),
                Spacing.verticalSpace(12),
                Row(
                  children: [
                    Expanded(
                      child: FilterTextField(
                        hint: 'أقل سعر',
                        onTap: () => cubit.updatePriceRange('min'),
                      ),
                    ),
                    Spacing.horizontalSpace(12),
                    Expanded(
                      child: FilterTextField(
                        hint: 'أقصى سعر',
                        onTap: () => cubit.updatePriceRange('max'),
                      ),
                    ),
                  ],
                ),

                Spacing.verticalSpace(20),

                // Payment Method Section
                FilterSectionTitle(title: 'طريقة الدفع'),
                Spacing.verticalSpace(12),
                Wrap(
                  spacing: 8.w,
                  runSpacing: 8.h,
                  children: [
                    FilterChipWidget(
                      label: 'كاش',
                      isSelected: cubit.filterModel.paymentMethod == 'cash',
                      onTap: () => cubit.updatePaymentMethod('cash'),
                    ),
                    FilterChipWidget(
                      label: 'تقسيط',
                      isSelected:
                          cubit.filterModel.paymentMethod == 'installment',
                      onTap: () => cubit.updatePaymentMethod('installment'),
                    ),
                    FilterChipWidget(
                      label: 'أي',
                      isSelected: cubit.filterModel.paymentMethod == 'any',
                      onTap: () => cubit.updatePaymentMethod('any'),
                    ),
                  ],
                ),

                Spacing.verticalSpace(20),

                // Property Status Section
                FilterSectionTitle(title: 'حالة العقار'),
                Spacing.verticalSpace(12),
                Wrap(
                  spacing: 8.w,
                  runSpacing: 8.h,
                  children: [
                    FilterChipWidget(
                      label: 'جاهز',
                      isSelected: cubit.filterModel.propertyStatus == 'ready',
                      onTap: () => cubit.updatePropertyStatus('ready'),
                    ),
                    FilterChipWidget(
                      label: 'قيد الانشاء',
                      isSelected:
                          cubit.filterModel.propertyStatus ==
                          'under_construction',
                      onTap: () =>
                          cubit.updatePropertyStatus('under_construction'),
                    ),
                    FilterChipWidget(
                      label: 'أي',
                      isSelected: cubit.filterModel.propertyStatus == 'any',
                      onTap: () => cubit.updatePropertyStatus('any'),
                    ),
                  ],
                ),

                Spacing.verticalSpace(78),
                SizedBox(
                  width: 328.w,
                  height: 47.h,
                  child: ElevatedButton(
                    onPressed: () {
                      // Apply filter and navigate back
                      Navigator.pop(context, cubit.filterModel);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.kPrimaryColor,
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.r),
                      ),
                    ),
                    child: Text(
                      'شاهد +${cubit.getResultCount()} نتائج',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeightHelper.bold,
                      ),
                    ),
                  ),
                ),
                Spacing.verticalSpace(24),
              ],
            ),
          ),
        );
      },
    );
  }
}
