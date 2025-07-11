import 'package:app/features/pages/driver/driver_home_tab.dart';
import 'package:app/features/pages/driver/driver_my_tab.dart';
import 'package:app/shared/widgets/bottom_navigation_bar.dart';
import 'package:app/shared/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class DriverPage extends StatefulWidget {

  const DriverPage({super.key});

  @override
  State<DriverPage> createState() => _DriverPageState();
}

class _DriverPageState extends State<DriverPage> with SingleTickerProviderStateMixin {
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
          Center(child: Text('운전사 페이지')),
          DriverHomeTab(driverLogs: [{
            'date': DateTime.now(),
            'weight': 30,
            'tag': 'J000000',
            'companyName': '길동치킨',
          },{
            'date': DateTime.now(),
            'weight': 30,
            'tag': 'J000000',
            'companyName': '길동치킨',
          },{
            'date': DateTime.now(),
            'weight': 30,
            'tag': 'J000000',
            'companyName': '길동치킨',
          },{
            'date': DateTime.now(),
            'weight': 30,
            'tag': 'J000000',
            'companyName': '길동치킨',
          },{
            'date': DateTime.now(),
            'weight': 30,
            'tag': 'J000000',
            'companyName': '길동치킨',
          }]),
          DriverMyTab(driverId: 'gtech21'),
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