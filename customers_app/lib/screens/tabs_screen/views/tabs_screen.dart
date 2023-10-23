import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../providers/tabs_provider.dart';
import './widgets/my_bottom_nav_bar.dart';
import './widgets/my_drawer.dart';
import '../../../theme/customers_theme.dart';

class TabsScreen extends StatelessWidget {
  TabsScreen({super.key});
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<TabsProvider>(builder: (context, tabsConsumer, _) {
      return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
            // toolbarHeight: 40,
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: CustomersTheme.colors.primaryColor,
                statusBarBrightness: Brightness.dark,
                statusBarIconBrightness: Brightness.dark),
            leading: IconButton(
              // Use an IconButton for the icon
              icon: Icon(Icons.menu,
                  color: CustomersTheme.colors.primaryColor, size: 35),
              onPressed: () {
                // Open the drawer when the IconButton is pressed
                _scaffoldKey.currentState?.openDrawer();
              },
            ),
            backgroundColor: CustomersTheme.colors.backgroundColor,
            actions: [
              Icon(
                Icons.account_circle,
                color: CustomersTheme.colors.primaryColor,
                size: 35,
              ),
              const SizedBox(
                width: 15,
              )
            ],
            // title: const Text("الصفحة الرئيسية"),
            // titleTextStyle: CustomersTheme.textStyles.titleLarge,
            elevation: 0.0),
        drawer: MyDrawer(
          scaffoldKey: _scaffoldKey,
        ),
        backgroundColor: CustomersTheme.colors.primaryColor,
        bottomNavigationBar: const MyBottomNavBar(),
        body: PageView(
          controller: tabsConsumer.pageController,
          onPageChanged: (index) => tabsConsumer.updateSelectedPageIndex(index),
          children: tabsConsumer.pages,
        ),
      );
    });
  }
}
