import 'package:flutter/material.dart';

import '../../../../../../models/product_item.dart';
import '../../../../../../theme/customers_theme.dart';
import '../../../../../../widgets/product_item_card.dart';

class ProductItemsRow extends StatelessWidget {
  final List<ProductItem> productItems;
  final String label;

  const ProductItemsRow({
    required this.productItems,
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<ProductItemCard> items = [];
    for (final item in productItems) {
      items.add(ProductItemCard(item: item));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 10, bottom: 7, left: 15, right: 15),
          child: Text(
            label,
            style: CustomersTheme.textStyles.titleLarge,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Row(
              children: [
                ...items,
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
