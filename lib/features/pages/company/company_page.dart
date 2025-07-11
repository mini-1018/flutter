import 'package:app/features/pages/company/home_tab.dart';
import 'package:app/features/pages/company/my_tab.dart';
import 'package:app/features/pages/company/pay_log_tab.dart';
import 'package:app/shared/widgets/bottom_navigation_bar.dart';
import 'package:app/shared/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class CompanyPage extends StatefulWidget {
  const CompanyPage({super.key});

  @override
  State<CompanyPage> createState() => _CompanyPageState();
}
class _CompanyPageState extends State<CompanyPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool isLoading = false;

  // 샘플 데이터(실제 데이터로 교체 필요)
  int totalAmount = 1000000;
  int todayAmount = 100000;
  int unpaidAmount = 50000;
  String companyName = '길동식당';
  String companyOwner = '홍길동';
  String phoneNumber = '010-1234-5678';
  String address = '서울특별시 강남구';
  String tagInfo = 'RFID-123456';
  String cardInfo = '1234-5678-****-****';

  @override
  void initState() {
    super.initState();
    loadData();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _switchToTab(int index) {
    _tabController.animateTo(index);
  }

  void loadData() async {
    setState(() => isLoading = true);
    // API
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: [
          HomeTab(
            totalAmount: totalAmount,
            todayAmount: todayAmount,
            unpaidAmount: unpaidAmount,
          ),
          PayLogTab(
            payLogs: [
              {
                'date': '2025-07-10 12:00:00',
                'message': '단독승인 정상',
                'amount': '1000000',
                'tagId': 'J0000000',
              },
              {
                'date': '2025-07-10 12:00:00',
                'message': '단독승인 정상',
                'amount': '1000000',
                'tagId': 'J0000000',
              },
              {
                'date': '2025-07-10 12:00:00',
                'message': '단독승인 정상',
                'amount': '1000000',
                'tagId': 'J0000000',
              },
              {
                'date': '2025-07-10 12:00:00',
                'message': '단독승인 정상',
                'amount': '1000000',
                'tagId': 'J0000000',
              },
              {
                'date': '2025-07-10 12:00:00',
                'message': '단독승인 정상',
                'amount': '1000000',
                'tagId': 'J0000000',
              },
              {
                'date': '2025-07-10 12:00:00',
                'message': '단독승인 정상',
                'amount': '1000000',
                'tagId': 'J0000000',
              },
              {
                'date': '2025-07-10 12:00:00',
                'message': '단독승인 정상',
                'amount': '1000000',
                'tagId': 'J0000000',
              },
            ],
          ),
          MyTab(
            companyName: companyName,
            companyOwner: companyOwner,
            phoneNumber: phoneNumber,
            address: address,
            tagInfo: tagInfo,
            cardInfo: cardInfo,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationAppBar(
        currentIndex: _tabController.index,
        onTap: (index) {
          _switchToTab(index);
        },
      ),
    );
  }
}
