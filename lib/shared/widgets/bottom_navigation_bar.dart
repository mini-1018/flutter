import 'package:app/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class BottomNavigationAppBar extends StatelessWidget {

  const BottomNavigationAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
        color: AppColors.secondary,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/home.png', width: 24, height: 24),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/my_page.png', width: 24, height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}