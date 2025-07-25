import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TrailLoadingWidget extends StatelessWidget {
  final double width;
  final double height;

  const TrailLoadingWidget({
    super.key,
    this.width = 100,
    this.height = 100,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(
          'assets/animations/loading_dots.json',
          // 'assets/animations/insider_loading.json',
          width: width,
          height: height,
          repeat: true,
          animate: true,
        ),
      ],
    );
  }
}