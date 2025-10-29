import 'package:bookia/core/contants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBarWithBack extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWithBack({super.key, this.action});
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: false,
      title: GestureDetector(
        onTap: () {
          pop(context);
        },
        child: SvgPicture.asset(AppImages.backSvg),
      ),
      actions: [action ?? const SizedBox.shrink()],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
