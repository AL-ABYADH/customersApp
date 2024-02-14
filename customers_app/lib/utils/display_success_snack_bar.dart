import 'package:flutter/material.dart';

import '../theme/customers_theme.dart';
import '../widgets/my_snack_bar.dart';

void displaySuccessSnackBar(ctx, message) {
  if (!ctx.mounted) return;
  ScaffoldMessenger.of(ctx).hideCurrentSnackBar();
  ScaffoldMessenger.of(ctx).showSnackBar(
    SnackBar(
      content: MySnackBar(
        content: message,
        icon: Image.asset(
          'lib/assets/icons/success.png',
          width: 20,
          height: 20,
          color: const Color.fromARGB(255, 0, 109, 62),
        ),
        borderColor: const Color.fromARGB(255, 0, 109, 62),
      ),
      backgroundColor: CustomersTheme.colors.backgroundColor,
    ),
  );
}
