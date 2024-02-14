import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../models/product_item.dart';
import '../../../../providers/user_provider.dart';
import '../../../../../../theme/customers_theme.dart';
import '../../../product_item_details_screen/views/product_item_details_screen.dart';
import '../../providers/cart_provider.dart';

class CartListItem extends StatelessWidget {
  final ProductItem cartProductItem;

  const CartListItem({
    required this.cartProductItem,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final token = Provider.of<UserProvider>(context, listen: false).token!;

    String currencyDisplay = '';
    switch (Provider.of<UserProvider>(context).preferredCurrency) {
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
      onTap: () => Navigator.of(context).pushNamed(
        ProductItemDetailsScreen.routeName,
        arguments: {'productItem': cartProductItem, 'category': 'cart'},
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(CustomersTheme.radius),
        ),
        child: Row(
          children: [
            Hero(
              tag: '${cartProductItem.id}cart',
              child: SizedBox(
                width: 70,
                height: 70,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(CustomersTheme.radius),
                    bottomRight: Radius.circular(CustomersTheme.radius),
                  ),
                  child: Image.network(
                    cartProductItem.primImageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartProductItem.productName,
                  style: CustomersTheme.textStyles.titleLarge,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '${cartProductItem.price.price.toStringAsFixed(2)} $currencyDisplay',
                  style: CustomersTheme.textStyles.display,
                ),
              ],
            ),
            const Expanded(
              child: SizedBox(),
            ),
            Consumer<CartProvider>(builder: (context, cartConsumer, _) {
              return IconButton(
                onPressed: cartConsumer.isRemoving
                    ? () {}
                    : () async => await cartConsumer.removeItemFromCart(
                          token: token,
                          productItem: cartProductItem,
                          ctx: context,
                        ),
                icon: Icon(
                  Icons.delete,
                  color: CustomersTheme.colors.errorColor,
                ),
              );
            }),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}
