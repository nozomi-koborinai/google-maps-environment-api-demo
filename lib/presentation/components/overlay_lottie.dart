import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

/// [Lottie] アニメーション
class OverlayLottie extends StatelessWidget {
  const OverlayLottie({
    super.key,
    this.backgroundColor = Colors.black26,
  });

  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: backgroundColor,
      child: Center(
        child: Lottie.asset(
          'assets/lottie/hospital.json',
          repeat: true,
          reverse: false,
          animate: true,
        ),
      ),
    );
  }
}
