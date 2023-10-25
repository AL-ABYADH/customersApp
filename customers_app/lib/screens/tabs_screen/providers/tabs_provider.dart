// ignore_for_file: unused_import

import 'package:customers_app/screens/tabs_screen/screens/home_screen/views/home_screen.dart';
import 'package:customers_app/screens/tabs_screen/screens/home_screen/providers/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/my_orders_screen/providers/my_order_provider.dart';
import '../screens/my_orders_screen/views/my_order_screen.dart';

import '../../../theme/customers_theme.dart';

class TabsProvider with ChangeNotifier {
  List<Widget> pages = [
    ChangeNotifierProvider.value(
      value: HomeProvider(),
      child: const HomeScreen(),
    ),
    ChangeNotifierProvider.value(
      value: HomeProvider(),
      child: const HomeScreen(),
    ),
    ChangeNotifierProvider.value(
      value: MyOrdersProvider(),
      child: const MyOrdersScreen(),
    ),
  ];

  int selectedPageIndex = 1;
  void updateSelectedPageIndex(int index) {
    selectedPageIndex = index;
    notifyListeners();
  }

  void selectPage(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  PageController pageController = PageController(initialPage: 1);

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }
}