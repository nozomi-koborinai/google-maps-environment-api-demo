import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/overlay_loading_provider.dart';

/// ユースケース実行のためのメソッドを備えた Mixin
mixin RunUsecaseMixin {
  Future<T> run<T>(
    Ref ref,
    Future<T> Function() action, {
    bool isLottieAnimation = false,
  }) async {
    final notifier = isLottieAnimation
        ? ref.read(overlayLottieProvider.notifier)
        : ref.read(overlayLoadingProvider.notifier);
    notifier.update((_) => true);
    try {
      return await action();
    } catch (e) {
      rethrow;
    } finally {
      notifier.update((_) => false);
    }
  }
}
