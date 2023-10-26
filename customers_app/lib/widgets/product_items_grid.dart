import 'package:flutter/material.dart';

import './product_item_card.dart';
import '../models/product_item.dart';
import '../theme/customers_theme.dart';

class ProductsItemsGrid extends StatelessWidget {
  final List<ProductItem> items;
  final void Function() onItemClick;

  const ProductsItemsGrid({
    required this.items,
    required this.onItemClick,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return items.isNotEmpty
        ? GridView.builder(
            padding: const EdgeInsets.all(10.0),
            itemCount: items.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1 / 1.70,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
            ),
            itemBuilder: (ctx, i) => ProductItemCard(
              item: items[i],
              onClick: onItemClick,
            ),
          )
        : Center(
            child: Text(
              'لا يوجد منتجات بعد',
              style: CustomersTheme.textStyles.display,
            ),
          );
  }
}
