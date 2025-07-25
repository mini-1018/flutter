import 'package:flutter/material.dart';
import 'package:app/shared/themes/app_colors.dart';

class MainContentTitle extends StatelessWidget {
  final String title;

  const MainContentTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,
      height: 50,
      alignment: Alignment.center,
      color: secondary,
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}