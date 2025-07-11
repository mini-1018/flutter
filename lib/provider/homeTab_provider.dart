import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CompanyState extends ChangeNotifier {
  // 금액 관련 상태
  int _totalAmount = 0;
  int _todayAmount = 0;
  int _unpaidAmount = 0;

  // 결제 내역
  List<PaymentHistory> _paymentHistory = [];

  // 탭 인덱스
  int _currentTabIndex = 0;

  // RFID 상태
  bool _isRfidReading = false;
  String _rfidData = '';

  // Getters
  int get totalAmount => _totalAmount;
  int get todayAmount => _todayAmount;
  int get unpaidAmount => _unpaidAmount;
  List<PaymentHistory> get paymentHistory => _paymentHistory;
  int get currentTabIndex => _currentTabIndex;
  bool get isRfidReading => _isRfidReading;
  String get rfidData => _rfidData;

  // 생성자에서 초기값 설정
  CompanyState() {
    _loadInitialData();
  }

  // 초기 데이터 로드
  void _loadInitialData() {
    _totalAmount = 1000000;
    _todayAmount = 1000000;
    _unpaidAmount = 10000;
    notifyListeners();
  }

  // 탭 변경
  void changeTab(int index) {
    _currentTabIndex = index;
    notifyListeners();
  }

  // RFID 읽기 시작
  void startRfidReading() {
    _isRfidReading = true;
    notifyListeners();

    // 시뮬레이션
    Future.delayed(Duration(seconds: 2), () {
      _completeRfidReading('J0000000');
    });
  }

  // RFID 읽기 완료
  void _completeRfidReading(String data) {
    _rfidData = data;
    _isRfidReading = false;

    // 새로운 결제 내역 추가
    _addPayment(1000000);

    // 결제내역조회 탭으로 자동 이동
    changeTab(1);
  }

  // 결제 추가
  void _addPayment(int amount) {
    final payment = PaymentHistory(
      date: DateTime.now(),
      amount: amount,
      rfidData: _rfidData,
      status: '결제완료',
    );

    _paymentHistory.insert(0, payment);

    // 금액 업데이트
    _totalAmount += amount;
    _todayAmount += amount;

    notifyListeners();
  }

  // 미납금 결제
  void payUnpaidAmount() {
    if (_unpaidAmount > 0) {
      _totalAmount += _unpaidAmount;
      _todayAmount += _unpaidAmount;
      _unpaidAmount = 0;
      notifyListeners();
    }
  }
}

class PaymentHistory {
  final DateTime date;
  final int amount;
  final String rfidData;
  final String status;

  PaymentHistory({
    required this.date,
    required this.amount,
    required this.rfidData,
    required this.status,
  });
}