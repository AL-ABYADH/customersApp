import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/user_provider.dart';
import '../../cart/views/cart_screen.dart';
import '../providers/tabs_provider.dart';
import './widgets/my_bottom_nav_bar.dart';
import './widgets/my_drawer.dart';
import '../../../theme/customers_theme.dart';
import '../../../widgets/count_badge.dart';

class TabsScreen extends StatelessWidget {
  TabsScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final tabsProvider = Provider.of<TabsProvider>(context);

    tabsProvider.pageController = PageController(
      initialPage: tabsProvider.selectedPageIndex,
    );

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu,
              color: CustomersTheme.colors.primaryColor, size: 35),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        backgroundColor: CustomersTheme.colors.backgroundColor,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(CartScreen.routeName),
            icon: Consumer<UserProvider>(builder: (context, userConsumer, _) {
              return userConsumer.cartItemsCount == 0
                  ? Icon(
                      Icons.shopping_cart,
                      color: CustomersTheme.colors.primaryColor,
                      size: 35,
                    )
                  : CountBadge(
                      value: userConsumer.cartItemsCount.toString(),
                      color: CustomersTheme.colors.errorColor,
                      child: Icon(
                        Icons.shopping_cart,
                        color: CustomersTheme.colors.primaryColor,
                        size: 35,
                      ),
                    );
            }),
          ),
        ],
      ),
      drawer: MyDrawer(
        scaffoldKey: _scaffoldKey,
      ),
      backgroundColor: CustomersTheme.colors.primaryColor,
      bottomNavigationBar: const MyBottomNavBar(),
      body: PageView(
        controller: tabsProvider.pageController,
        onPageChanged: tabsProvider.updateSelectedPageIndex,
        children: tabsProvider.pages,
      ),
    );
  }
}
