import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../../../../../../models/order.dart';
import '../../../../../../providers/user_provider.dart';
import '../../../../../../theme/customers_theme.dart';

class OrderListItem extends StatelessWidget {
  final Order order;

  const OrderListItem({
    required this.order,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
      onTap: () {
        // Handle order click
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(CustomersTheme.radius),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: ListTile(
            title: Row(
              children: [
                Text(
                  order.sellerName,
                  style: CustomersTheme.textStyles.titleLarge,
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                Text(
                  '${order.totalPrice.price.toStringAsFixed(2)} $currencyDisplay',
                  style: CustomersTheme.textStyles.displayLarge,
                ),
              ],
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text(
                DateFormat('yyyy/MM/dd - HH:mm').format(order.date),
                style: CustomersTheme.textStyles.labelSmall.copyWith(
                  color: CustomersTheme.colors.secondSecondaryColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
