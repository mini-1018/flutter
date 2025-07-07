import 'package:app/shared/themes/app_colors.dart';
import 'package:app/shared/widgets/button.dart';
import 'package:app/shared/widgets/input.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 292,
      height: 338,
      padding: const EdgeInsets.symmetric(vertical: 61.0, horizontal: 18.0),
      margin: const EdgeInsets.all(39.0),
      constraints: const BoxConstraints(maxWidth: 292),
      decoration: BoxDecoration(
        color: AppColors.grey300,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Input(
            hintText: '아이디',
            keyboardType: TextInputType.text,
            width: 255,
            height: 55,
          ),
          const SizedBox(height: 16.0, width: 16,),
          const Input(
            hintText: '패스워드',
            obscureText: true,
            width: 255,
            height: 55,
          ),
          const SizedBox(height: 24.0),
          Button(text: '로그인', onPressed: ()=> Navigator.pushNamed(context, '/company'), width: 255, height: 48, variant: ButtonVariant.primary, isDisabled: false, isLoading: false),
        ],
      ),
    );
    }
  }
