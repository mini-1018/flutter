import 'package:app/group/jeju/common/mainContentTitle.dart';
import 'package:app/shared/themes/app_colors.dart';
import 'package:app/shared/widgets/date_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DriverPayLogTab extends StatefulWidget {
  const DriverPayLogTab({super.key});

  @override
  State<DriverPayLogTab> createState() => _DriverPayLogTabState();
}

class _DriverPayLogTabState extends State<DriverPayLogTab> {
  DateTime? startDate;
  DateTime? endDate;

  final List<Map<String, dynamic>> driverLogs = [
    {
      'date': "2025-07-10 12:00:00",
      'weight': 30,
      'amount': 100000000,
      'companyName': '길동치킨',
    },
    {
      'date': "2025-07-10 12:00:00",
      'weight': 30,
      'amount': 100000,
      'companyName': '길동치킨',
    },
    {
      'date': "2025-07-10 12:00:00",
      'weight': 30,
      'amount': 1000000,
      'companyName': '길동치킨',
    },
    {
      'date': "2025-07-10 12:00:00",
      'weight': 30,
      'amount': 1000000,
      'companyName': '길동치킨',
    },
    {
      'date': "2025-07-10 12:00:00",
      'weight': 30,
      'amount': 1000,
      'companyName': '길동치킨',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [MainContentTitle(title: '결제내역조회'), _buildTabContent()],
    );
  }

  Widget _buildTabContent() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DatePicker(
                  label: '시작일',
                  value: startDate,
                  onChanged: (date) => setState(() => startDate = date),
                  firstDate: DateTime(2020),
                  lastDate: endDate ?? DateTime.now(),
                  locale: const Locale('ko'),
                ),
                const SizedBox(width: 8),
                DatePicker(
                  label: '종료일',
                  value: endDate,
                  onChanged: (date) => setState(() => endDate = date),
                  firstDate: startDate ?? DateTime(2020),
                  lastDate: DateTime.now(),
                  locale: const Locale('ko'),
                ),
                SizedBox(width: 6),
                SizedBox(
                  width: 40,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      // 검색 버튼 클릭 시 동작
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primary,
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Image.asset(
                      'assets/images/search.png',
                      width: 24,
                      height: 24,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: driverLogs.length,
                itemBuilder: (context, index) {
                  final log = driverLogs[index];
                  final formatter = NumberFormat('#,###');

                  return Container(
                    width: 300,
                    height: 126,
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 24,
                    ),
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: grey400, width: 1),
                    ),
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${log['date']}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '${log['companyName']}',
                          style: TextStyle(
                            fontSize: 16,
                            color: textPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${formatter.format(log['amount'] ?? 50000)}원',
                              style: TextStyle(
                                fontSize: 16,
                                color: textPrimary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${log['weight']}kg',
                              style: TextStyle(
                                fontSize: 16,
                                color: primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
