import 'package:flutter/material.dart';
import '../themes/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;
  final Widget? leading;
  final bool centerTitle;
  final Color? backgroundColor;

  const CustomAppBar({
    super.key,
    this.actions,
    this.leading,
    this.centerTitle = true,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Image.asset('assets/images/jeju.png', width: 100,),
      centerTitle: centerTitle,
      backgroundColor: backgroundColor ?? white,
      elevation: 0,
      automaticallyImplyLeading: false,
      actions: actions,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          height: 1,
          color: grey200 // 원하는 색상으로 변경
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 1);
}