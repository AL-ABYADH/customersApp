import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/my_order_provider.dart';
import 'widgets/orders_list.dart';
import 'widgets/section_title.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<MyOrdersProvider>(
        builder: (context, ordersProvider, child) {
          final orders = ordersProvider.orders;
          final awaitingOrders =
              orders.where((order) => order.status == 'awaiting').toList();
          final confirmedOrders =
              orders.where((order) => order.status == 'confirmed').toList();
          final testingOrders =
              orders.where((order) => order.status == 'testing').toList();
          final confirmingOrders =
              orders.where((order) => order.status == 'confirming').toList();
          final doneOrders =
              orders.where((order) => order.status == 'done').toList();
          final canceledOrders =
              orders.where((order) => order.status == 'canceled').toList();
          final returningOrders =
              orders.where((order) => order.status == 'returningItem').toList();

          return ListView(
            children: [
              // Lasting Orders Section
              SectionTitle(title: 'الطلبات قيد الإجراء'),
              if (awaitingOrders.isNotEmpty ||
                  testingOrders.isNotEmpty ||
                  confirmingOrders.isNotEmpty ||
                  confirmedOrders.isNotEmpty)
                OrdersList(orders: awaitingOrders),
              OrdersList(orders: confirmedOrders),
              OrdersList(orders: testingOrders),
              OrdersList(orders: confirmingOrders),

              if (awaitingOrders.isEmpty &&
                  testingOrders.isEmpty &&
                  confirmingOrders.isEmpty &&
                  confirmedOrders.isEmpty)
                const Center(child: Text('لا توجد طلبات قيد الإجراء')),

              // Done Orders Section
              SectionTitle(title: 'الطلبات المكتملة'),
              if (doneOrders.isNotEmpty ||
                  canceledOrders.isNotEmpty ||
                  returningOrders.isNotEmpty)
              OrdersList(orders: doneOrders),
              OrdersList(orders: canceledOrders),
              OrdersList(orders: returningOrders),
              if (doneOrders.isEmpty && 
              canceledOrders.isEmpty &&
                  returningOrders.isEmpty)
                const Center(child: Text('لا توجد طلبات مكتملة')),
            ],
          );
        },
      ),
    );
  }
}
