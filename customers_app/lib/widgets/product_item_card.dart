import 'package:flutter/material.dart';

import '../models/product_item.dart';
import '../theme/customers_theme.dart';
import './product_condition.dart';
import './rating.dart';

class ProductItemCard extends StatelessWidget {
  final ProductItem item;
  final void Function() onClick;

  const ProductItemCard({
    required this.item,
    required this.onClick,
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
      onTap: onClick,
      child: SizedBox(
        height: 305,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: 170,
                width: 150,
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
              const Expanded(child: SizedBox()),
              ProductCondition(
                  condition: item.usedProductCondition, used: item.usedProduct),
              Padding(
                padding: const EdgeInsets.only(left: 8, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Rating(rating: item.rating),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
