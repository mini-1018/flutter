import 'package:app/shared/widgets/bottom_navigation_bar.dart';
import 'package:app/shared/widgets/custom_app_bar.dart';
import 'package:app/shared/widgets/payment_card.dart';
import 'package:flutter/material.dart';

class CompanyPage extends StatefulWidget {
  const CompanyPage({super.key});

  @override
  State<CompanyPage> createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  int totalAmount = 1000000;
  int todayAmount = 1000000;
  int unpaidAmount = 500000;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    setState(() => isLoading = true);
    // API
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: '차량용 RFID 음식물 회수 수수료 결제확인'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PaymentCard(title:'전체결제금액', amount: totalAmount, icon: 'assets/images/credit_card.png'),
            SizedBox(height: 30),
            PaymentCard(title:'금일결제금액', amount: todayAmount, icon: 'assets/images/phone.png'),
            SizedBox(height: 30),
            PaymentCard(title:'미납금액', amount: unpaidAmount, icon: 'assets/images/calculator.png'),
            SizedBox(height: 30),
            PaymentCard(title: '결제내역조회', icon: 'assets/images/next_btn.png'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationAppBar()
    );
  }
}
