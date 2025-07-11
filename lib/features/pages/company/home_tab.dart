import 'package:app/shared/themes/app_colors.dart';
import 'package:app/shared/widgets/payment_card.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  final int totalAmount;
  final int todayAmount;
  final int unpaidAmount;

  const HomeTab({
    super.key,
    required this.totalAmount,
    required this.todayAmount,
    required this.unpaidAmount,
  });

  @override
  Widget build(BuildContext context) {
    return _buildTabContent([
      Container(
        width: 300,
        height: 50,
        alignment: Alignment.center,
        color: AppColors.secondary, // 원하는 배경색
        child: Text(
          '음식물 수거차량 RFID 결제 시스템',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      SizedBox(height: 30),
      PaymentCard(
        title: '전체결제금액',
        amount: totalAmount,
        icon: 'assets/images/credit_card.png',
      ),
      SizedBox(height: 30),
      PaymentCard(
        title: '금일결제금액',
        amount: todayAmount,
        icon: 'assets/images/phone.png',
      ),
      SizedBox(height: 30),
      PaymentCard(
        title: '미납금',
        amount: unpaidAmount,
        icon: 'assets/images/calculator.png',
      ),
    ]);
  }

  Widget _buildTabContent(List<Widget> children) {
    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: children,
        ),
      ),
    );
  }
}