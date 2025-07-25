import 'package:app/group/jeju/common/mainContentTitle.dart';
import 'package:app/shared/widgets/billing_info_card.dart';
import 'package:app/shared/widgets/animations/trail_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:app/shared/widgets/animations/buildLoadingOrContent.dart';

class CompanyHomeTab extends StatefulWidget {
  const CompanyHomeTab({super.key});

  @override
  State<CompanyHomeTab> createState() => _CompanyHomeTabState();
}

class _CompanyHomeTabState extends State<CompanyHomeTab> with LoadingMixin {
  // 더미 데이터
  int totalAmount = 1000000;
  int todayAmount = 50000;
  int unpaidAmount = 20000;

  @override
  void initState() {
    super.initState();
    loadPaymentData();
  }

  // API 호출 함수
  Future<void> loadPaymentData() async {
    await executeWithLoading(() async {
      // 실제 API 호출
      // 더미 API
      await Future.delayed(Duration(seconds: 3));
      print('API 호출 완료');
      setState(() {
        totalAmount = 100000;
        todayAmount = 5000;
        unpaidAmount = 2000;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MainContentTitle(title: '음식물 수거차량 RFID 결제 시스템'),
        buildLoadingOrContent(
          loadingMessage: '결제 데이터를 불러오는 중...',
          loadingHeight: 400,
          content:_buildTabContent(),
        ),
      ],
    );
  }

  Widget _buildTabContent() {
    if (isLoading) {
      return SizedBox(
        height: 400,
        child: Center(
          child: TrailLoadingWidget(
            width: 120,
            height: 120,
          ),
        ),
      );
    }

    return Column(
      children: [
        BillingInfoCard(
          title: '당월결제금액',
          amount: totalAmount,
          icon: 'assets/images/credit_card.png',

        ),
        SizedBox(height: 20),
        BillingInfoCard(
          title: '금일결제금액',
          amount: todayAmount,
          icon: 'assets/images/phone.png',
        ),
        SizedBox(height: 20),
        BillingInfoCard(
          title: '전체 미납금',
          amount: unpaidAmount,
          icon: 'assets/images/calculator.png',
        ),
      ],
    );
  }
}