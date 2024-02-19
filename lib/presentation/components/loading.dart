import 'package:flutter/material.dart';

/// 二度押しを防止したいときなどのオーバーレイローディング
class OverlayLoading extends StatelessWidget {
  const OverlayLoading({
    super.key,
    this.backgroundColor = Colors.black26,
  });

  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: backgroundColor,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
