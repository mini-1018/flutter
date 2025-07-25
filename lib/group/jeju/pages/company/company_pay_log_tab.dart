import 'package:app/group/jeju/common/mainContentTitle.dart';
import 'package:app/shared/themes/app_colors.dart';
import 'package:app/shared/widgets/date_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CompanyPayLogTab extends StatefulWidget {
  const CompanyPayLogTab({super.key});

  @override
  State<CompanyPayLogTab> createState() => _CompanyPayLogTabState();
}

class _CompanyPayLogTabState extends State<CompanyPayLogTab> {
  DateTime? startDate;
  DateTime? endDate;

  // 더미 결제 내역 데이터
  List<Map<String, dynamic>> payLogs = [
    {
      'date': '2025-07-10 12:00:00',
      'message': '단독승인 정상',
      'amount': 1000000,
      'tagId': 'J0000000',
    },
    {
      'date': '2025-07-10 12:00:00',
      'message': '단독승인 정상',
      'amount': 1000000,
      'tagId': 'J0000000',
    },
    {
      'date': '2025-07-10 12:00:00',
      'message': '단독승인 정상',
      'amount': 1000000,
      'tagId': 'J0000000',
    },
    {
      'date': '2025-07-10 12:00:00',
      'message': '단독승인 정상',
      'amount': 1000000,
      'tagId': 'J0000000',
    },
    {
      'date': '2025-07-10 12:00:00',
      'message': '단독승인 정상',
      'amount': 1000000,
      'tagId': 'J0000000',
    },
    {
      'date': '2025-07-10 12:00:00',
      'message': '단독승인 정상',
      'amount': 1000000,
      'tagId': 'J0000000',
    },
    {
      'date': '2025-07-10 12:00:00',
      'message': '단독승인 정상',
      'amount': 1000000,
      'tagId': 'J0000000',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MainContentTitle(title: '결제내역조회'),
        _buildTabContent(),
      ],
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
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: payLogs.length,
                itemBuilder: (context, index) {
                  final log = payLogs[index];
                  return Container(
                    width: 300,
                    height: 94,
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: grey200, width: 1),
                    ),
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${log['date']}',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: primary,
                              ),
                            ),
                            Text(
                              '${log['tagId']}',
                              style: TextStyle(
                                fontSize: 16,
                                color: textPrimary,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${log['message']}',
                              style: TextStyle(
                                fontSize: 16,
                                color: textPrimary,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              '${NumberFormat('#,###').format(log['amount'])}원',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: primary,
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
