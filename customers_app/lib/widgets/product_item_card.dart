import 'package:flutter/material.dart';

import '../models/product_item.dart';
import '../theme/customers_theme.dart';
import './product_condition.dart';
import './rating.dart';
import '../screens/product_item_details_screen/views/product_item_details_screen.dart';

class ProductItemCard extends StatelessWidget {
  final ProductItem item;

  const ProductItemCard({
    required this.item,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String currencyDisplay = '';
    switch (item.price.currency) {
      case 'USD':
        currencyDisplay = '\$';
        break;
      case 'YER':
        currencyDisplay = 'ريال يمني';
        break;
      case 'SAR':
        currencyDisplay = 'ريال سعودي';
        break;
    }

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(ProductItemDetailsScreen.routeName);
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 170,
              width: 200,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(CustomersTheme.radius),
                ),
                child: SizedBox(
                  height: 200,
                  child: Image.network(
                    item.primImageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(item.productName,
                  style: CustomersTheme.textStyles.titleLarge),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text('${item.price.price} $currencyDisplay',
                  style: CustomersTheme.textStyles.titleMedium),
            ),
            Row(
              children: [
                Rating(rating: item.rating),
                ProductCondition(
                    condition: item.usedProductCondition,
                    used: item.usedProduct),
              ],
            )
          ],
        ),
      ),
    );
  }
}
