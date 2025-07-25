import 'package:app/group/jeju/common/mainContentTitle.dart';
import 'package:app/shared/widgets/billing_info_card.dart';
import 'package:app/shared/widgets/animations/trail_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:app/shared/widgets/animations/buildLoadingOrContent.dart';

enum PaymentType { monthly, daily, unpaid }

class CompanyHomeTab extends StatefulWidget {
  const CompanyHomeTab({super.key});

  @override
  State<CompanyHomeTab> createState() => _CompanyHomeTabState();
}

class _CompanyHomeTabState extends State<CompanyHomeTab> with LoadingMixin {
  // Scaffold 상태 관리 GlobalKey
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // 더미 데이터
  int totalAmount = 1000000;
  int todayAmount = 50000;
  int unpaidAmount = 20000;

  PaymentType? _currentPaymentType;
  List<PaymentData>? _paymentData;
  bool _isDrawerLoading = false;

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

  // 각 카드 클릭 시 호출되는 함수
  Future<void> _showPaymentDetail(PaymentType type) async {
    setState(() {
      _currentPaymentType = type;
      _isDrawerLoading = true;
      _paymentData = null;
    });

    // Drawer 먼저 열기
    _scaffoldKey.currentState?.openEndDrawer();

    // API 호출
    try {
      List<PaymentData> data;
      switch (type) {
        case PaymentType.monthly:
          data = await _getMonthlyPayments();
          break;
        case PaymentType.daily:
          data = await _getDailyPayments();
          break;
        case PaymentType.unpaid:
          data = await _getUnpaidPayments();
          break;
      }

      setState(() {
        _paymentData = data;
        _isDrawerLoading = false;
      });
    } catch (e) {
      setState(() {
        _isDrawerLoading = false;
      });
      print('Error loading payment data: $e');
    }
  }

  // 각 API 호출 함수들
  Future<List<PaymentData>> _getMonthlyPayments() async {
    await Future.delayed(Duration(seconds: 1)); // 더미 지연
    return [
      PaymentData(title: '음식물 수거료', date: '2024-01-15', amount: 15000),
      PaymentData(title: '음식물 수거료', date: '2024-01-20', amount: 20000),
      PaymentData(title: '음식물 수거료', date: '2024-01-25', amount: 18000),
    ];
  }

  Future<List<PaymentData>> _getDailyPayments() async {
    await Future.delayed(Duration(seconds: 1));
    return [
      PaymentData(title: '음식물 수거료', date: '오늘 09:30', amount: 5000),
    ];
  }

  Future<List<PaymentData>> _getUnpaidPayments() async {
    await Future.delayed(Duration(seconds: 1));
    return [
      PaymentData(title: '음식물 수거료 (미납)', date: '2024-01-10', amount: 2000),
    ];
  }

  String get _drawerTitle {
    switch (_currentPaymentType) {
      case PaymentType.monthly:
        return '당월결제내역';
      case PaymentType.daily:
        return '금일결제내역';
      case PaymentType.unpaid:
        return '전체미납내역';
      default:
        return '결제내역';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.transparent,
      endDrawer: _buildPaymentDetailDrawer(),
      body: Column(
        children: [
          MainContentTitle(title: '음식물 수거차량 RFID 결제 시스템'),
          buildLoadingOrContent(
            loadingMessage: '결제 데이터를 불러오는 중...',
            loadingHeight: 400,
            content: _buildTabContent(),
          ),
        ],
      ),
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
          onTap: () => _showPaymentDetail(PaymentType.monthly),
        ),
        SizedBox(height: 20),
        BillingInfoCard(
          title: '금일결제금액',
          amount: todayAmount,
          icon: 'assets/images/phone.png',
          onTap: () => _showPaymentDetail(PaymentType.daily),
        ),
        SizedBox(height: 20),
        BillingInfoCard(
          title: '전체 미납금',
          amount: unpaidAmount,
          icon: 'assets/images/calculator.png',
          onTap: () => _showPaymentDetail(PaymentType.unpaid),
        ),
      ],
    );
  }

  Widget _buildPaymentDetailDrawer() {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: AppBar(
              title: Text(_drawerTitle),
              automaticallyImplyLeading: false,
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              actions: [
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
          Expanded(
            child: _isDrawerLoading
                ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TrailLoadingWidget(),
                ],
              ),
            )
                : _paymentData == null
                ? Center(child: Text('데이터를 불러올 수 없습니다.'))
                : _paymentData!.isEmpty
                ? Center(child: Text('결제 내역이 없습니다.'))
                : ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: _paymentData!.length,
              itemBuilder: (context, index) {
                final payment = _paymentData![index];
                return Card(
                  margin: EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    title: Text(payment.title),
                    subtitle: Text(payment.date),
                    trailing: Text(
                      '${payment.amount.toString().replaceAllMapped(
                          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                              (Match m) => '${m[1]},'
                      )}원',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// 결제 데이터 모델
class PaymentData {
  final String title;
  final String date;
  final int amount;

  PaymentData({
    required this.title,
    required this.date,
    required this.amount,
  });
}

