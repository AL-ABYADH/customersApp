import 'package:flutter/material.dart';

import './product_card.dart';
import '../models/product.dart';
import '../theme/customers_theme.dart';

class ProductsGrid extends StatelessWidget {
  final List<Product> products;

  const ProductsGrid({
    required this.products,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return products.isNotEmpty
        ? GridView.builder(
            padding: const EdgeInsets.all(10.0),
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1 / 1.3,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
            ),
            itemBuilder: (ctx, i) => ProductCard(
              product: products[i],
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
