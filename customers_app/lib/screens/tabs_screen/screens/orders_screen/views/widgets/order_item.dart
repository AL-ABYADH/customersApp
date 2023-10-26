import 'package:flutter/material.dart';

import '../../../../../../models/order.dart';
import '../../../../../../theme/customers_theme.dart';
import '../../../../../../utils/format_date.dart';
import '../../../../../../utils/format_time.dart';
import '../../../../../../utils/get_order_status.dart';
class OrderItem extends StatelessWidget {
  final Order order;

  // ignore: use_key_in_widget_constructors
  const OrderItem({required this.order});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle order click
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(5), // Add padding here
          child: ListTile(
            title: Text(
              order.sellerName,
              style: CustomersTheme.textStyles.titleLarge,
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'الحالة: ${getOrderStatus(order.status)}',
                      style: CustomersTheme.textStyles.labelSmall.copyWith(
                        color: CustomersTheme.colors.secondSecondaryColor,
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    Text(
                      formatDate(order.date),
                      style: CustomersTheme.textStyles.labelSmall.copyWith(
                        color: CustomersTheme.colors.secondSecondaryColor,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'السعر: ${order.price}',
                      style: CustomersTheme.textStyles.labelSmall.copyWith(
                        color: CustomersTheme.colors.secondSecondaryColor,
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    Text(
                      formatTime(order.date),
                      style: CustomersTheme.textStyles.labelSmall.copyWith(
                        color: CustomersTheme.colors.secondSecondaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
