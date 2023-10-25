import 'package:flutter/material.dart';

import '../models/product_item.dart';
import '../theme/customers_theme.dart';

class ProductItemCard extends StatelessWidget {
  final ProductItem item;

  const ProductItemCard({
    required this.item,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 170,
              width: 130,
              child: Image.network(
                item.primImageUrl,
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            Text(item.productName, style: CustomersTheme.textStyles.titleLarge),
            Text('\$${item.price.price} ${item.price.currency}',
                style: CustomersTheme.textStyles.display),
            // _buildRatingStars(rating),
            item.usedProduct
                ? Text('Used (${item.usedProductCondition})',
                    style: CustomersTheme.textStyles.display)
                : Text('New', style: CustomersTheme.textStyles.display),
          ],
        ),
      ),
    );
  }
}
