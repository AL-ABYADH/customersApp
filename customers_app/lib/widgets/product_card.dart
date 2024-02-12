import 'package:flutter/material.dart';

import '../models/product.dart';
import '../theme/customers_theme.dart';
import './rating.dart';
import '../screens/brand_product_items_screen/views/brand_product_items_screen.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    required this.product,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .pushNamed(BrandProductItemsScreen.routeName, arguments: {
        'productId': product.id,
        'productName': product.name,
      }),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(CustomersTheme.radius),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 150,
              width: 180,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(CustomersTheme.radius),
                  topRight: Radius.circular(CustomersTheme.radius),
                ),
                child: SizedBox(
                  height: 200,
                  child: Image.network(
                    product.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const Expanded(
              child: SizedBox(),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(product.name,
                  style: CustomersTheme.textStyles.titleLarge),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Rating(rating: product.rating),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
