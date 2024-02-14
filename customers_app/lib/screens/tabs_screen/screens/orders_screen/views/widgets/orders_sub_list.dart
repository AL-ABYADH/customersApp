import 'package:flutter/material.dart';

import '../../../../../../models/order.dart';
import '../../../../../../widgets/list_divider.dart';
import './order_list_item.dart';

class OrdersSubList extends StatelessWidget {
  final String label;
  final List<Order> orders;

  const OrdersSubList({
    required this.label,
    required this.orders,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: ListDivider(
            label: label,
          ),
        ),
        ...orders.map((order) {
          return Padding(
            padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
            child: OrderListItem(order: order),
          );
        }).toList(),
      ],
    );
  }
}
