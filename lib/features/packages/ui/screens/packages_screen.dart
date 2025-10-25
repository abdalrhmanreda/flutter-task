import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/config/colors/app_colors.dart';
import 'package:flutter_task/config/themes/font_weight.dart';
import 'package:flutter_task/core/cache/sql_helper.dart';
import 'package:flutter_task/core/helpers/spacing.dart';
import 'package:flutter_task/core/widgets/app_text.dart';
import 'package:flutter_task/features/packages/data/models/package_model.dart';
import 'package:flutter_task/features/packages/logic/cubit/packages_cubit.dart';
import 'package:flutter_task/features/packages/logic/cubit/packages_state.dart';
import 'package:flutter_task/features/packages/ui/widgets/package_card.dart';
import 'package:flutter_task/features/packages/ui/widgets/specific_packages.dart';

class PackagesPlanScreen extends StatelessWidget {
  const PackagesPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PackageCubit(SqlHelper())..initializePackages(),
      child: const PackagesPlanView(),
    );
  }
}

class PackagesPlanView extends StatelessWidget {
  const PackagesPlanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 24,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: MyTextApp(
          title: 'اختر الباقات اللى تناسبك',
          color: Colors.black,
          size: 22.sp,
          fontWeight: FontWeightHelper.medium,
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<PackageCubit, PackageState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = context.read<PackageCubit>();

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyTextApp(
                    title:
                        'اختار من مئات الفئات التمييز بل اسفل اللى تناسب احتياجاتك',
                    color: Colors.grey,
                    size: 14.sp,
                  ),
                  Spacing.verticalSpace(20),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: cubit.packages.length,
                    itemBuilder: (context, index) {
                      final package = cubit.packages[index];
                      final isSelected =
                          cubit.selectedPackage?.name == package.name;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: PackageCard(
                          package: package,
                          isSelected: isSelected,
                          onTap: () => cubit.selectPackage(package.name),
                        ),
                      );
                    },
                  ),
                  Spacing.verticalSpace(20),
                  SpecificPackages(),
                  Spacing.verticalSpace(150),
                  Center(
                    child: SizedBox(
                      width: 328.w,
                      height: 46.h,
                      child: ElevatedButton(
                        onPressed: cubit.selectedPackage != null
                            ? () {
                                final selectedPackage = cubit
                                    .getSelectedPackage();
                                print(
                                  'Selected package: ${selectedPackage?.name}',
                                );
                                // Navigator.push(context, MaterialPageRoute(...));
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:AppColors.kPrimaryColor,
                          disabledBackgroundColor: Colors.grey.shade300,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                        
                            MyTextApp(
                      title:         'التالى',
                              
                                size: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: cubit.selectedPackage != null
                                    ? Colors.white
                                    : Colors.grey.shade500,
                              
                            ),
                            Spacing.horizontalSpace(4),
                                Icon(
                              Icons.arrow_forward,
                              color: cubit.selectedPackage != null
                                  ? Colors.white
                                  : Colors.grey.shade500,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                                  Spacing.verticalSpace(20),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
