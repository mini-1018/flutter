import 'package:app/group/jeju/pages/company/company_home_tab.dart';
import 'package:app/group/jeju/pages/company/company_my_tab.dart';
import 'package:app/group/jeju/pages/company/company_pay_log_tab.dart';
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
          CompanyHomeTab(),
          CompanyPayLogTab(),
          CompanyMyTab(),
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
