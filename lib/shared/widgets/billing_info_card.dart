import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:app/shared/themes/app_colors.dart';

class BillingInfoCard extends StatelessWidget {
  final String title;
  final int? amount;
  final String icon;
  final VoidCallback? onTap; // onTap 추가

  const BillingInfoCard({
    super.key,
    required this.title,
    this.amount,
    required this.icon,
    this.onTap, // onTap 추가
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector( // GestureDetector로 감싸기
      onTap: onTap,
      child: Container(
        width: 300,
        height: 120,
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: grey300,
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
                  if (amount != null) SizedBox(height: 9),
                  if (amount != null)
                    Text(
                      '${NumberFormat('#,###').format(amount!)}원',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: primary,
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              flex: 4,
              child: Align(
                alignment: Alignment.center,
                child: Image.asset(icon, width: 80, height: 60),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
