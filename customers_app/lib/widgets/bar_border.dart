import 'package:flutter/material.dart';

import '../theme/customers_theme.dart';

class BarBorder extends StatelessWidget {
  const BarBorder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1.0,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: CustomersTheme.colors.primaryColor.withOpacity(0.2),
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
