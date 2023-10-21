import 'package:customers_app/screens/auth_screen/screens/login_screen/views/login_screen.dart';
import 'package:customers_app/screens/auth_screen/screens/sign_up_screen/views/sign_up_screen.dart';
import 'package:customers_app/screens/home_screen/views/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../theme/customers_theme.dart';
List<Widget> _buildScreens() {
  return [
    const LoginScreen(),
    const LoginScreen(),
     HomeScreen(),
    const Drawer()
  ];
}
List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.shopping_cart),
      title: ("طلباتي"),
      activeColorPrimary: CustomersColors().primaryColor,
      inactiveColorPrimary: CustomersColors().displayTextColor,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.add),
      title: ("تصفح"),
      activeColorPrimary: CustomersColors().primaryColor,
      inactiveColorPrimary: CustomersColors().displayTextColor,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.home),
      title: ("الرئيسية"),
      activeColorPrimary: CustomersColors().primaryColor,
      inactiveColorPrimary: CustomersColors().displayTextColor,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.list_rounded),
      title: ("المزيد"),
      activeColorPrimary: CustomersColors().primaryColor,
      inactiveColorPrimary: CustomersColors().displayTextColor,
    )
  ];
}

class MyApp22 extends StatelessWidget {
  const MyApp22({super.key});



  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties( // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style9, // Choose the nav bar style with this property.
    );
  }
}