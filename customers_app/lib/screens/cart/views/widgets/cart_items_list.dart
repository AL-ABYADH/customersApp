import 'package:flutter/material.dart';

import '../../../../models/product_item.dart';
import '../../../../theme/customers_theme.dart';
import './cart_list_item.dart';

class CartItemsList extends StatelessWidget {
  final List<ProductItem> cartProductItems;

  const CartItemsList({
    required this.cartProductItems,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return cartProductItems.isNotEmpty
        ? ListView(
            children: [
              const SizedBox(
                height: 5,
              ),
              ...cartProductItems.map((cartProductItem) {
                return Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
                  child: CartListItem(cartProductItem: cartProductItem),
                );
              }).toList(),
              const SizedBox(
                height: 30,
              ),
            ],
          )
        : Center(
            child: Text(
              'لا يوجد منتجات في السلة',
              style: CustomersTheme.textStyles.display,
            ),
          );
  }
}
