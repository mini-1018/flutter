import 'package:app/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class BottomNavigationAppBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int)? onTap;

  const BottomNavigationAppBar({super.key, this.currentIndex = 0, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        color: white,
        border: Border(
          top: BorderSide(
            color: grey200,
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: InkWell(
              onTap: () => onTap?.call(0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/home.png', width: 24, height: 24,
                    color: currentIndex == 0 ? primary : null),
                  Text('홈', style: TextStyle(
                    fontSize: 12,
                    color: currentIndex == 0 ? primary : null,
                  )),
                ],
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () => onTap?.call(1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/analyze.png', width: 24, height: 24,
                      color: currentIndex == 1 ? primary : null),
                  Text('결제내역조회', style: TextStyle(
                    fontSize: 12,
                    color: currentIndex == 1 ? primary : null,
                  )),
                ],
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () => onTap?.call(2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/my_page.png', width: 24, height: 24,
                    color: currentIndex == 2 ? primary : null),
                  Text('마이페이지', style: TextStyle(
                    fontSize: 12,
                    color: currentIndex == 2 ? primary : null,
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}