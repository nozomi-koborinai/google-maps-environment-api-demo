import 'package:flutter_riverpod/flutter_riverpod.dart';

/// [OverlayLoading] の表示状態を管理する [StateProvider]
final overlayLoadingProvider = StateProvider.autoDispose<bool>((_) => false);
final overlayLottieProvider = StateProvider((_) => false);
