import 'package:flutter/material.dart';

import '../../../../../../models/product_item.dart';
import '../../../../../../theme/customers_theme.dart';
import '../../../../../../widgets/product_item_card.dart';
import '../../../../../../screens/product_item_details_screen/views/product_item_details_screen.dart';

class ProductItemsRow extends StatelessWidget {
  final List<ProductItem> productItems;
  final String label;
  final bool isLoading;

  const ProductItemsRow({
    required this.productItems,
    required this.label,
    required this.isLoading,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];
    for (final item in productItems) {
      items.add(ProductItemCard(
        item: item,
        onClick: () =>
            Navigator.of(context).pushNamed(ProductItemDetailsScreen.routeName),
      ));
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
        isLoading
            ? SizedBox(
                height: 270,
                child: Center(
                  child: CircularProgressIndicator(
                    color: CustomersTheme.colors.primaryColor,
                  ),
                ),
              )
            : SingleChildScrollView(
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
