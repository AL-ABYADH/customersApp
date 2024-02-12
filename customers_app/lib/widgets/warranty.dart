import 'package:flutter/material.dart';

import '../theme/customers_theme.dart';

class Warranty extends StatelessWidget {
  final String warranty;

  const Warranty({
    required this.warranty,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomersTheme.colors.primaryColorTransparent,
        borderRadius: const BorderRadius.all(Radius.circular(7)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          Icon(
            Icons.done,
            size: 30,
            color: CustomersTheme.colors.primaryColor,
          ),
          const SizedBox(
            width: 10,
          ),
          Text('ضمان $warranty',
              style: CustomersTheme.textStyles.displayLarger),
        ],
      ),
    );
  }
}
