import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.leading,
    this.actions,
    this.color,
    this.isCenter,
  });

  final Widget? title;
  final List<Widget>? actions;
  final Widget? leading;
  final Color? color;
  final bool? isCenter;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: color,
      title: title,
      actions: actions,
      leading: Transform(
        alignment: Alignment.center,
        transform: Directionality.of(context) == TextDirection.rtl
            ? Matrix4.rotationY(3.1416)
            : Matrix4.identity(),
        child: leading ??
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                IconlyBroken.arrow_left_2,
              ),
            ),
      ),
      centerTitle: isCenter ?? false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
