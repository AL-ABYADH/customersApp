// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

import '../../providers/my_order_provider.dart';
import 'package:intl/intl.dart';

class OrdersList extends StatelessWidget {
  final List<Order> orders;

  OrdersList({required this.orders});

  String formatDate(String dateString) {
    final dateTime = DateTime.parse(dateString);
    final formattedDate = DateFormat('yyyy/M/d').format(dateTime);
    return formattedDate;
  }
  String formatTime(String timeString) {
    final dateTime = DateTime.parse(timeString);
    final formattedTime = DateFormat('h:mm a').format(dateTime);
    return formattedTime;
  }

  String getOrderStatus(String status) {
    switch (status) {
      case "awaiting":
        return "جاري الانتظار";
      case "confirming":
        return "قيد التأكيد";
      case "done":
        return "تم الانتهاء";
      case "confirmed":
        return "تم التأكيد";
      case "testing":
        return "جاري الاختبار";
      case "canceled":
        return "تم الإلغاء";
      case "returningItem":
        return "مسترجع";
      default:
        return "غير معروف"; // You can customize this message
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: orders.map((order) {
        return GestureDetector(
          onTap: () {
            // Handle order click
          },
          child: Card(
            child: ListTile(
              title: Text(order.sellerName),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'الحالة: ${getOrderStatus(order.status)}',
                      ),
                      const Expanded(child: SizedBox()),
                      Text(
                        formatDate(order.date),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'السعر: ${order.price}',
                      ),
                      const Expanded(child: SizedBox()),
                      Text(
                        formatTime(order.date),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
