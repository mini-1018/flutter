import 'package:app/shared/themes/app_colors.dart';
import 'package:app/shared/widgets/date_picker.dart';
import 'package:flutter/material.dart';

class DriverPayLogTab extends StatefulWidget {
  final List<Map<String, dynamic>> driverLogs;

  const DriverPayLogTab({super.key, required this.driverLogs});

  @override
  State<DriverPayLogTab> createState() => _DriverPayLogTabState();
}

class _DriverPayLogTabState extends State<DriverPayLogTab> {
  DateTime? startDate;
  DateTime? endDate;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text(
                '결제내역조회',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),Text('차량번호 : 12마3456')],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: DatePicker(
                    label: '시작일',
                    value: startDate,
                    onChanged: (date) => setState(() => startDate = date),
                    firstDate: DateTime(2020),
                    lastDate: endDate ?? DateTime.now(),
                    locale: const Locale('ko'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: DatePicker(
                    label: '종료일',
                    value: endDate,
                    onChanged: (date) => setState(() => endDate = date),
                    firstDate: startDate ?? DateTime(2020),
                    lastDate: DateTime.now(),
                    locale: const Locale('ko'),
                  ),
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
                      backgroundColor: AppColors.primary,
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
            SizedBox(height: 5),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: widget.driverLogs.length,
              itemBuilder: (context, index) {
                final log = widget.driverLogs[index];
                return Container(
                  width: 300,
                  height: 94,
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.grey200, width: 1),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 11),
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
                            ),
                          ),
                          Text(
                            '${log['tagId']}',
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.grey200,
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
                              color: AppColors.grey200,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            '${log['amount']}원',
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}