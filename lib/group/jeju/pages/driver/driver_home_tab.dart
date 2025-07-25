import 'package:app/group/jeju/common/mainContentTitle.dart';
import 'package:app/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DriverHomeTab extends StatefulWidget {

  const DriverHomeTab({super.key});

  @override
  State<DriverHomeTab> createState() => _DriverHomeTabState();
}

class _DriverHomeTabState extends State<DriverHomeTab> {
  // 결제 내역 상태
  List<Map<String, dynamic>> logs = [
    {
      'date': '2025.07.14 10:00:00',
      'weight': '12 Kg',
      'companyName': '제주환경센터',
      'amount': 1000000,
    },
    {
      'date': '2025.07.13 09:30:00',
      'weight': '8 Kg',
      'companyName': '한라복지재단',
      'amount': 1000000,
    },
    {
      'date': '2025.07.13 09:30:00',
      'weight': '8 Kg',
      'companyName': '한라치킨',
      'amount': 1000000,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          MainContentTitle(title: '음식물 수거차량 RFID 결제 시스템'),
          _buildTabContent(),
        ],
      ),
    );
  }

  Widget _buildTabContent() {
    return Column(
      children: [
        SizedBox(height: 10),
        Container(
          width: 300,
          height: 80,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
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
                    Text('차량번호'),
                    Text(
                      '12마1234',
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
                  child: Image.asset(
                    'assets/images/car.png',
                    width: 80,
                    height: 60,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Text(
          '최근 결제 내역',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: textPrimary),
        ),
        SizedBox(height: 20),
        _buildPaymentCard(logs[0], isFirst: true),
        _buildPaymentCard(logs[1], isFirst: false),
        _buildPaymentCard(logs[2], isFirst: false),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildPaymentCard(Map<String, dynamic> payment, {bool isFirst = false}) {
    final formatter = NumberFormat('#,###');

    return Container(
      width: 300,
      height: isFirst ? 126 : 94,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isFirst ? primary : grey400,
          width: isFirst ? 2 : 1,
        ),
      ),
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                payment['date'] ?? '',
                style: TextStyle(fontSize: 16, fontWeight: isFirst ? FontWeight.bold : FontWeight.normal, color: textPrimary),
              ),
              Text(
                payment['weight'] ?? '',
                style: TextStyle(fontSize: 16, color: primary, fontWeight: isFirst ? FontWeight.bold : FontWeight.normal),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            payment['companyName'] ?? '',
            style: TextStyle(fontSize: 16, color: textPrimary, fontWeight: isFirst ? FontWeight.bold : FontWeight.normal),
          ),
          if (isFirst) ...[
            SizedBox(height: 8),
            Text(
              '${formatter.format(payment['amount'] ?? 0)}원',
              style: TextStyle(fontSize: 16, color: textPrimary, fontWeight: FontWeight.bold),
            ),
          ],
        ],
      ),
    );
  }
}
