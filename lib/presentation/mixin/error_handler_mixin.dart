import 'package:flutter/material.dart';

import '../../domain/app_exception.dart';
import '../components/snackbars.dart';

/// プレゼンテーション層用のエラーハンドリングをラップした共通処理 Mixin
mixin ErrorHandlerMixin {
  Future<void> run(
    BuildContext context, {
    required Future<void> Function() action,
    String successMessage = '',
  }) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    try {
      await action();
      if (successMessage.isEmpty) return;
      return SuccessSnackBar.show(
        scaffoldMessenger,
        message: successMessage,
      );
    } on AppException catch (e) {
      FailureSnackBar.show(
        scaffoldMessenger,
        message: e.toString(),
      );
    }
  }
}
