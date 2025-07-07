import 'package:app/features/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:app/shared/themes/app_colors.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 80, bottom: 60),
                child: Image.asset(
                  'assets/images/jeju.png',
                  width: 129,
                  height: 53,
                ),
              ),
              const Text(
                '차량용 RFID\n 음식물 회수 수수료 결제확인',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const LoginForm(),
              Image.asset(
                'assets/images/gtech.png',
                width: 129,
                height: 47,
              )
            ],
          ),
        ),
      ),
    );
  }
}