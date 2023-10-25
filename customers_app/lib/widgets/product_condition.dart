import 'package:flutter/material.dart';

import '../theme/customers_theme.dart';

class ProductCondition extends StatelessWidget {
  final String? condition;
  final bool used;

  const ProductCondition({
    required this.condition,
    required this.used,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String usedCondition = '';
    if (used) {
      switch (condition) {
        case 'excellent':
          usedCondition = 'ممتازة';
          break;
        case 'good':
          usedCondition = 'جيدة جداً';
          break;
        case 'normal':
          usedCondition = 'جيدة';
          break;
        case 'bad':
          usedCondition = 'مقبولة';
          break;
        case 'terrible':
          usedCondition = 'سيئة';
          break;
      }
    }

    return Container(
      decoration: BoxDecoration(
        color: CustomersTheme.colors.primaryColorTransparent,
        borderRadius: const BorderRadius.all(Radius.circular(7)),
      ),
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      child: Text(used ? 'مستخدم بحالة $usedCondition' : 'جديد',
          style: CustomersTheme.textStyles.display),
    );
  }
}
