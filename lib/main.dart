import 'package:app/features/pages/company_page.dart';
import 'package:app/features/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:app/shared/themes/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RFID APP',
      theme: ThemeData(
        fontFamily: 'Pretendard',
      ),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => LoginPage(),
        '/company': (context) => CompanyPage(),
      },
    );
  }
}
