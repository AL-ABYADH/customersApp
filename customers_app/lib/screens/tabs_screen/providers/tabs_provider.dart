import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/orders_screen/providers/order_provider.dart';
import '../screens/orders_screen/views/order_screen.dart';
import '../screens/home_screen/views/home_screen.dart';
import '../screens/home_screen/providers/home_provider.dart';
import '../screens/brows_screen.dart/views/brows_screen.dart';
import '../screens/brows_screen.dart/providers/brows_provider.dart';

class TabsProvider with ChangeNotifier {
  List<Widget> pages = [
    ChangeNotifierProvider.value(
      value: HomeProvider(),
      child: const HomeScreen(),
    ),
    ChangeNotifierProvider.value(
      value: BrowsProvider(),
      child: const BrowsScreen(),
    ),
    ChangeNotifierProvider.value(
      value: OrdersProvider(),
      child: const OrdersScreen(),
    ),
  ];

  int selectedPageIndex = 0;
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

  PageController pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }
}
