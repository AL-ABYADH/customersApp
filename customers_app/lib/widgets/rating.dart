import 'package:flutter/material.dart';

import '../theme/customers_theme.dart';

class Rating extends StatelessWidget {
  final double rating;

  const Rating({
    required this.rating,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomersTheme.colors.primaryColorTransparent,
        borderRadius: const BorderRadius.all(Radius.circular(7)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      child: Row(
        children: [
          const Icon(
            Icons.star,
            size: 15,
            color: Colors.amber,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(rating.toString(), style: CustomersTheme.textStyles.display),
        ],
      ),
    );
  }
}
