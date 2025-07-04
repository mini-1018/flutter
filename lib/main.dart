import 'package:flutter/material.dart';
import 'package:app/shared/themes/app_theme.dart';
import 'package:app/features/pages/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RFID APP',
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.system,
      home: MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
