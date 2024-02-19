import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_environment_api_demo/presentation/app.dart';
import 'package:package_info/package_info.dart';

import 'domain/app_info.dart';
import 'domain/env.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase の初期化
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // .env ファイルの読み込み
  await dotenv.load();

  // 画面の向きを縦に固定
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );

  // パッケージ情報
  final packageInfo = await PackageInfo.fromPlatform();

  // アプリケーションの実行
  runApp(
    ProviderScope(
      overrides: [
        // 環境変数を上書き
        envProvider.overrideWithValue(
          Env(
            googleMapsApiKey: dotenv.get('GOOGLE_MAPS_API_KEY'),
          ),
        ),

        // アプリ情報の上書き
        appInfoProvider.overrideWith(
          (ref) => AppInfo(
            appName: packageInfo.appName,
            packageName: packageInfo.packageName,
            version: 'v${packageInfo.version}',
            buildNumber: packageInfo.buildNumber,
            copyRight: '(C)2024 Cloud Ace, Inc.',
            iconImagePath: '',
            privacyPolicyUrl: Uri.parse(''),
            termsOfServiceUrl: Uri.parse(''),
          ),
        ),
      ],
      child: const App(),
    ),
  );
}
