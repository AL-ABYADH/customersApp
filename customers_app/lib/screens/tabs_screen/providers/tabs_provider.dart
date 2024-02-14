import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/orders_screen/providers/order_provider.dart';
import '../screens/orders_screen/views/order_screen.dart';
import '../screens/home_screen/views/home_screen.dart';
import '../screens/brows_screen.dart/views/brows_screen.dart';
import '../screens/brows_screen.dart/providers/brows_provider.dart';

class TabsProvider with ChangeNotifier {
  List<Widget> pages = [
    const HomeScreen(),
    ChangeNotifierProvider.value(
      value: BrowsProvider(),
      child: const BrowsScreen(),
    ),
    ChangeNotifierProvider.value(
      value: OrdersProvider(),
      child: const OrdersScreen(),
    ),
  ];

  int _selectedPageIndex = 0;
  PageController pageController = PageController();

  int get selectedPageIndex => _selectedPageIndex;

  void updateSelectedPageIndex(int index) {
    _selectedPageIndex = index;
    notifyListeners();
  }

  void selectPage(int index) {
    pageController.jumpToPage(index);
    updateSelectedPageIndex(index);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
