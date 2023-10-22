import 'package:flutter/material.dart';

import '../theme/customers_theme.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomersTheme.colors.backgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            'جار التحميل...',
            style: CustomersTheme.textStyles.display,
          ),
        ),
      ),
    );
  }
}
