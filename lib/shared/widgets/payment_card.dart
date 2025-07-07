import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:app/shared/themes/app_colors.dart';

class PaymentCard extends StatelessWidget {
  final String title;
  final int? amount;
  final String icon;

  const PaymentCard({
    super.key,
    required this.title,
    this.amount,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 120,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppColors.grey300,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title),
                amount != null ? SizedBox(height: 9) : SizedBox.shrink(),
                amount != null
                    ? Text(
                        '${NumberFormat('#,###').format(amount!)}원',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            flex: 4,
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(icon, width: 60, height: 60),
            ),
          ),
        ],
      ),
    );
  }
}
