import 'package:app/group/default/pages/login/login_page.dart';
import 'package:app/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
        scaffoldBackgroundColor: white,
      ),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      supportedLocales: const [
        Locale('ko'),
        Locale('en'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: LoginPage(),
    );
  }
}
