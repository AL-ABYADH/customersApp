import 'package:flutter/material.dart';

import '../theme/customers_theme.dart';

class LoadingError extends StatelessWidget {
  final String message;
  final void Function() refresh;

  const LoadingError({
    required this.message,
    required this.refresh,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style: CustomersTheme.textStyles.display,
          ),
          TextButton(
            onPressed: refresh,
            child: Text(
              'بتحديث الصفحة',
              style: CustomersTheme.textStyles.display.copyWith(
                color: CustomersTheme.colors.primaryColor,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
          )
        ],
      ),
    );
  }
}
