import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../providers/user_provider.dart';
import '../../../../../theme/customers_theme.dart';
import '../../../../../widgets/loading_error.dart';
import '../providers/order_provider.dart';
import './widgets/orders_list.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ordersProvider = Provider.of<OrdersProvider>(context);
    final token = Provider.of<UserProvider>(context, listen: false).token!;

    return Scaffold(
      backgroundColor: CustomersTheme.colors.backgroundColor,
      body: RefreshIndicator(
        onRefresh: () async => await ordersProvider.fetchOrders(token),
        color: CustomersTheme.colors.primaryColor,
        child: FutureBuilder(
            future: ordersProvider.ordersFetched
                ? null
                : ordersProvider.fetchOrders(token),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: CustomersTheme.colors.primaryColor,
                  ),
                );
              } else if (snapshot.error != null) {
                return snapshot.error is SocketException ||
                        snapshot.error is TimeoutException
                    ? LoadingError(
                        message: 'تحقق من اتصالك بالشبكة ثم قم',
                        refresh: ordersProvider.refetchOrders,
                      )
                    : LoadingError(
                        message: 'حدث خطأ ما في النظام، قم',
                        refresh: ordersProvider.refetchOrders,
                      );
              }
              return OrdersList(
                awaitingOrders: ordersProvider.awaitingOrders,
                confirmingOrders: ordersProvider.confirmingOrders,
                confirmedOrders: ordersProvider.confirmedOrders,
                testingOrders: ordersProvider.testingOrders,
              );
            }),
      ),
    );
  }
}
