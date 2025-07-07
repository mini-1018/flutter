import 'package:app/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  /// 버튼 텍스트
  final String text;

  /// 버튼 클릭 이벤트
  final VoidCallback? onPressed;

  /// 버튼 너비
  final double? width;

  /// 버튼 높이
  final double? height;

  /// 배경색
  final Color? backgroundColor;

  /// 텍스트 색상
  final Color? textColor;

  /// 버튼 variant (primary, secondary, outline)
  final ButtonVariant variant;

  /// 비활성화 여부
  final bool isDisabled;

  /// 아이콘 (선택사항)
  final IconData? icon;

  /// 로딩 상태
  final bool isLoading;

  /// 커스텀 버튼을 생성합니다.
  ///
  /// [text]와 [onPressed]는 필수 매개변수입니다.
  ///
  /// Example:
  /// ```dart
  /// CustomButton(
  ///   text: '로그인',
  ///   onPressed: () => print('버튼 클릭'),
  ///   variant: ButtonVariant.primary,
  /// )
  /// ```
  const Button({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height = 50,
    this.backgroundColor,
    this.textColor,
    this.variant = ButtonVariant.primary,
    this.isDisabled = false,
    this.icon,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: (isDisabled || isLoading) ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: _getBackgroundColor(),
          foregroundColor: _getTextColor(),
          side: _getBorderSide(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: variant == ButtonVariant.outline ? 0 : 2,
        ),
        child: _buildButtonContent(),
      ),
    );
  }

  /// 버튼 내용을 구성합니다 (텍스트, 아이콘, 로딩)
  Widget _buildButtonContent() {
    if (isLoading) {
      return SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          color: _getTextColor(),
          strokeWidth: 2,
        ),
      );
    }

    if (icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      );
    }

    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  /// variant에 따른 배경색 반환
  Color _getBackgroundColor() {
    if (backgroundColor != null) return backgroundColor!;

    switch (variant) {
      case ButtonVariant.primary:
        return AppColors.primary;
      case ButtonVariant.secondary:
        return Colors.grey[300]!;
      case ButtonVariant.outline:
        return Colors.transparent;
      case ButtonVariant.danger:
        return Colors.red;
    }
  }

  /// variant에 따른 텍스트 색상 반환
  Color _getTextColor() {
    if (textColor != null) return textColor!;

    switch (variant) {
      case ButtonVariant.primary:
        return Colors.white;
      case ButtonVariant.secondary:
        return Colors.black87;
      case ButtonVariant.outline:
        return Colors.blue;
      case ButtonVariant.danger:
        return Colors.white;
    }
  }

  /// outline variant용 테두리 설정
  BorderSide? _getBorderSide() {
    if (variant == ButtonVariant.outline) {
      return BorderSide(
        color: backgroundColor ?? Colors.blue,
        width: 1.5,
      );
    }
    return null;
  }
}

/// 버튼 스타일 variant enum
enum ButtonVariant {
  primary,
  secondary,
  outline,
  danger,
}