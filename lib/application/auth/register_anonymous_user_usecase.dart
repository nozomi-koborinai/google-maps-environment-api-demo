import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_environment_api_demo/infrastructure/firebase/auth_repository.dart';

import '../common/mixin/run_usecase_mixin.dart';

/// [RegisterAnonymousUserUsecase] のインスタンスを提供する [Provider]
///
/// Presentation Layer にユースケースを注入するために使用され、匿名ユーザーを登録する
final registerAnonymousUserUsecaseProvider =
    Provider<RegisterAnonymousUserUsecase>(
  RegisterAnonymousUserUsecase.new,
);

/// 匿名認証のユーザーを登録する Usecase クラス
class RegisterAnonymousUserUsecase with RunUsecaseMixin {
  RegisterAnonymousUserUsecase(this.ref);

  /// 指定された [Ref] を使用して [RegisterAnonymousUserUsecase] を構築する
  ///
  /// [Ref] は必要な [Provider] を読み取るために使用される
  final Ref ref;

  /// 匿名ユーザーを登録するユースケースの実行
  Future<void> execute() async {
    await run(
      ref,
      () async {
        await ref.read(firebaseAuthRepositoryProvider).signinAnonymously();
      },
    );
  }
}
