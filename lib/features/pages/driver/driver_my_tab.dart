import 'package:flutter/material.dart';
import 'package:app/shared/themes/app_colors.dart';

class DriverMyTab extends StatelessWidget {
  final String driverId;

  const DriverMyTab({
    super.key,
    required this.driverId
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Text(
          '마이페이지',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 14),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 18.5),
          decoration: BoxDecoration(
            color: AppColors.grey300,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              _buildInfoRow('ID', driverId),
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
        color: AppColors.white,
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
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.textPrimary,
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
          border: Border.all(color: AppColors.grey400),
        ),
        child: const Center(
          child: Text(
            '로그아웃',
            style: TextStyle(fontSize: 16, color: AppColors.textPrimary),
          ),
        ),
      ),
    );
  }
}

