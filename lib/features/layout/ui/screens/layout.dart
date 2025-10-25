import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/config/themes/font_weight.dart';
import 'package:flutter_task/features/layout/logic/cubit/layout_cubit.dart';
import 'package:flutter_task/features/layout/logic/cubit/layout_state.dart';
import 'package:flutter_task/gen/locale_keys.g.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: context
              .read<LayoutCubit>()
              .screen[context.read<LayoutCubit>().currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,

            currentIndex: context.read<LayoutCubit>().currentIndex,
            onTap: (index) {
              context.read<LayoutCubit>().changeIndex(index);
            },
            // want make labale style font size 12
            selectedLabelStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeightHelper.medium,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeightHelper.medium,
            ),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: LocaleKeys.home.tr(),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat_outlined),
                label: LocaleKeys.chat.tr(),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_box_outlined),
                label: LocaleKeys.add_ads.tr(),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.grid_view_outlined),
                label: LocaleKeys.my_ads.tr(),
              ),

              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined),
                label: LocaleKeys.my_account.tr(),
              ),
            ],
          ),
        );
      },
    );
  }
}
