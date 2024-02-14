import 'package:flutter/material.dart';

import '../../../../../../models/order.dart';
import 'orders_sub_list.dart';

class OrdersList extends StatelessWidget {
  final List<Order> awaitingOrders;
  final List<Order> confirmedOrders;
  final List<Order> testingOrders;
  final List<Order> confirmingOrders;

  const OrdersList({
    required this.awaitingOrders,
    required this.confirmedOrders,
    required this.testingOrders,
    required this.confirmingOrders,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(
          height: 5,
        ),
        OrdersSubList(
          label: 'قيد الانتظار',
          orders: awaitingOrders,
        ),
        OrdersSubList(
          label: 'بانتظار التأكيد',
          orders: confirmingOrders,
        ),
        OrdersSubList(
          label: 'تم التأكيد',
          orders: confirmedOrders,
        ),
        OrdersSubList(
          label: 'قيد الفحص',
          orders: testingOrders,
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
