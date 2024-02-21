import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_maps_environment_api_demo/presentation/auth/root_page.dart';
import 'package:google_maps_environment_api_demo/presentation/theme.dart';

import '../application/common/state/overlay_loading_provider.dart';
import 'components/dialog.dart';
import 'components/loading.dart';

/// Google Maps Platform の Environment API を活用した Demo App
class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeData = ref.watch(themeProvider);
    return MaterialApp(
      title: 'Google Maps Environment API Demo',
      debugShowCheckedModeBanner: false,
      theme: themeData,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ja', 'JP'),
      ],
      home: const RootPage(),
      builder: (context, child) => Consumer(
        builder: (context, ref, _) {
          final isLoading = ref.watch(overlayLoadingProvider);
          // final isLottie = ref.watch(overlayLottieProvider);
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
            child: Navigator(
              key: ref.watch(navigatorKeyProvider),
              onPopPage: (route, dynamic _) => false,
              pages: [
                MaterialPage<Widget>(
                  child: Stack(
                    children: [
                      child!,
                      if (isLoading) const OverlayLoading(),
                      // if (isLottie) const OverlayLottie(),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
