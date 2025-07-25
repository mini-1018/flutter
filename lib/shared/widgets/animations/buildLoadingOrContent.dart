import 'package:flutter/material.dart';
import 'package:app/shared/widgets/animations/trail_loading_widget.dart';

mixin LoadingMixin<T extends StatefulWidget> on State<T> {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool loading) {
    if (mounted) {
      setState(() => _isLoading = loading);
    }
  }

  Future<void> executeWithLoading(Future<void> Function() action) async {
    setLoading(true);
    try {
      // throw Exception('예외');
      await action();
    } catch (error) {
      print('API 호출 실패: $error');
      showErrorSnackBar();
    } finally {
      setLoading(false);
    }
  }

  void showErrorSnackBar([String? message]) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message ?? '데이터를 불러오는데 실패했습니다.'),
        backgroundColor: Colors.red,
        action: SnackBarAction(
          label: '재시도',
          onPressed: () => _retry(),
          textColor: Colors.white,
        ),
      ),
    );
  }

  // 재시도 함수 (각 페이지에서 오버라이드)
  void _retry() {
  }

  // 로딩 또는 콘텐츠를 조건부로 표시
  Widget buildLoadingOrContent({
    required Widget content,
    String? loadingMessage,
    double? loadingHeight,
    double loadingWidth = 120,
    double loadingAnimationSize = 120,
  }) {
    if (isLoading) {
      Widget loadingWidget = TrailLoadingWidget(
        width: loadingAnimationSize,
        height: loadingAnimationSize,
      );

      if (loadingHeight != null) {
        return Container(
          height: loadingHeight,
          child: Center(child: loadingWidget),
        );
      }

      return Center(child: loadingWidget);
    }

    return content;
  }
}