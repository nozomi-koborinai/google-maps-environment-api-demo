import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_colors.dart';

/// [ThemeData] を提供する [Provider]
final themeProvider = Provider(
  (ref) {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: AppColors.blue,
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: AppColors.grey),
        bodyMedium: TextStyle(color: AppColors.grey),
        bodySmall: TextStyle(color: AppColors.grey),
      ),
      fontFamily: 'Noto Sans JP',
      fontFamilyFallback: const ['Noto Sans JP'],
      sliderTheme: SliderThemeData(
        overlayShape: SliderComponentShape.noOverlay,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
      ),
    );
  },
);
