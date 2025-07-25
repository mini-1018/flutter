import 'package:app/group/jeju/common/mainContentTitle.dart';
import 'package:flutter/material.dart';
import 'package:app/shared/themes/app_colors.dart';

class DriverMyTab extends StatelessWidget {
  final String driverId;
  final String vehicleNumber = '12마1234';

  const DriverMyTab({
    super.key,
    required this.driverId
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MainContentTitle(title: '마이페이지'),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 18),
          decoration: BoxDecoration(
            color: grey300,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              _buildInfoRow('ID', driverId),
              const SizedBox(height: 14),
              _buildInfoRow('차량번호', vehicleNumber),
            ],
          ),
        ),
        const SizedBox(height: 20),
        _buildLogoutButton(context),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Container(
      width: 255,
      constraints: BoxConstraints(minHeight: 55),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 70,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 16,
                color: textPrimary,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: 16,
                color: textPrimary,
                fontWeight: FontWeight.bold,
              ),
              maxLines: null,
              overflow: TextOverflow.visible,
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogoutButton(context) {
    return GestureDetector(
      onTap: () {
        // 로그아웃 로직을 여기에 추가
        Navigator.pushReplacementNamed(context, '/');
      },
      child: Container(
        width: 120,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: grey400),
        ),
        child: Center(
          child: Text(
            '로그아웃',
            style: TextStyle(fontSize: 16, color: textPrimary),
          ),
        ),
      ),
    );
  }
}

