import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'env.freezed.dart';

/// 環境変数を提供する [Provider]
final envProvider = Provider<Env>(
  (ref) => throw UnimplementedError('Provider was not initialized'),
);

/// 環境変数の値オブジェクト
@freezed
class Env with _$Env {
  const factory Env({
    required String googleMapsApiKey,
  }) = _Env;

  const Env._();
}
