import 'package:flutter/material.dart';

import '../app_colors.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.blue,
      title: Image.asset(
        'assets/images/ca_logo_white_big.png',
        width: 180,
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 56.0);
}
