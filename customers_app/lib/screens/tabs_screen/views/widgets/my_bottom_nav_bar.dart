import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../theme/Customers_theme.dart';
import '../../providers/tabs_provider.dart';
import './my_nav_bar_item.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TabsProvider>(builder: (context, tabsScreenConsumer, _) {
      return BottomNavigationBar(
        onTap: tabsScreenConsumer.selectPage,
        // Set the size of the labels to zero to hide them and apply a custom label
        selectedLabelStyle: const TextStyle(fontSize: 0),
        // elevation: 0,
        unselectedLabelStyle: const TextStyle(fontSize: 0),
        backgroundColor: CustomersTheme.colors.backgroundColor,
        unselectedItemColor: Colors.grey,
        selectedItemColor: CustomersTheme.colors.primaryColor,
        currentIndex: tabsScreenConsumer.selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: MyNavBarItem(
              icon: const Icon(Icons.home),
              title: 'الرئيسية',
              selected: tabsScreenConsumer.selectedPageIndex == 0,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: MyNavBarItem(
              icon: const Icon(Icons.add),
              title: 'تصفح',
              selected: tabsScreenConsumer.selectedPageIndex == 1,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: MyNavBarItem(
              icon: const Icon(Icons.shopping_cart),
              title: 'طلباتي',
              selected: tabsScreenConsumer.selectedPageIndex == 2,
            ),
            label: '',
          ),
        ],
      );
    });
  }
}
