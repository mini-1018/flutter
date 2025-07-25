import 'package:app/group/jeju/pages/company/company_page.dart';
import 'package:flutter/material.dart';
import 'package:app/shared/themes/app_colors.dart';
import 'package:app/group/jeju/pages/driver/driver_page.dart';
import 'package:app/shared/widgets/button.dart';
import 'package:app/shared/widgets/input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  @override
  void dispose() {
    _idController.dispose();
    _pwController.dispose();
    super.dispose();
  }

  void _login(BuildContext context) {
    final id = _idController.text.trim();
    if (id == 'a1') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => CompanyPage()),
      );
    } else if (id == 'a2') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DriverPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('아이디를 확인하세요.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Image.asset(
                'assets/images/jeju.png',
                width: 129,
                height: 53,
              ),
              const SizedBox(height: 20),
              Text(
                '차량용 RFID\n 음식물 회수 수수료 결제확인',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: textPrimary,
                ),
              ),
              Container(
                width: 292,
                height: 338,
                margin: const EdgeInsets.symmetric(vertical: 20,horizontal: 0),
                constraints: const BoxConstraints(maxWidth: 292),
                decoration: BoxDecoration(
                  color: grey300,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Input(
                      controller: _idController,
                      hintText: '아이디',
                      keyboardType: TextInputType.text,
                      width: 255,
                      height: 55,
                    ),
                    const SizedBox(height: 16.0),
                    Input(
                      controller: _pwController,
                      hintText: '패스워드',
                      obscureText: true,
                      width: 255,
                      height: 55,
                    ),
                    const SizedBox(height: 16.0),
                    Button(
                      text: '로그인',
                      onPressed: () => _login(context),
                      width: 255,
                      height: 48,
                      variant: ButtonVariant.primary,
                      isDisabled: false,
                      isLoading: false,
                    ),
                  ],
                ),
              ),
              Image.asset('assets/images/gtech.png', width: 129, height: 47),
            ],
          ),
        ),
      ),
    );
  }
}
