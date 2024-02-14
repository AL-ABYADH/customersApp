import 'package:flutter/material.dart';

import '../widgets/my_snack_bar.dart';
import '../theme/customers_theme.dart';

void displayErrorSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: MySnackBar(
        content: message,
        icon: Image.asset(
          'lib/assets/icons/error.png',
          width: 20,
          height: 20,
          color: CustomersTheme.colors.errorColor,
        ),
        borderColor: CustomersTheme.colors.errorColor,
      ),
      backgroundColor: CustomersTheme.colors.backgroundColor,
    ),
  );
}
