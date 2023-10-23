import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../theme/customers_theme.dart';
import '../../providers/tabs_provider.dart';
import './drawer_item.dart';
import '../../../../providers/user_provider.dart';
import '../../../../widgets/my_alert_dialog.dart';
import '../../../../widgets/loading_dialog.dart';
import '../../../../widgets/dialog_button.dart';

class MyDrawer extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const MyDrawer({
    required this.scaffoldKey,
    Key? key,
  }) : super(key: key);

  void _confirmLogOutDialog(
      BuildContext context, Future<void> Function(BuildContext) logout) {
    showDialog(
      context: context,
      builder: (ctx) => MyAlertDialog(
        label: 'هل أنت متأكد من تسجيل الخروج من حسابك؟',
        leftButton: Expanded(
          child: DialogButton(
            onClick: () async {
              Navigator.of(ctx).pop();
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (ctx) =>
                    const LoadingDialog(message: 'جار تسجيل الخروج'),
              );
              await logout(context);
              if (!context.mounted) return;
              Navigator.of(context).pop();
            },
            label: 'تأكيد',
            color: CustomersTheme.colors.errorColor,
          ),
        ),
        rightButton: Expanded(
          child: DialogButton(
            onClick: () => Navigator.of(context).pop(),
            label: 'تراجع',
            color: CustomersTheme.colors.firstSecondaryColor,
          ),
        ),
        borderColor: CustomersTheme.colors.errorColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Consumer<TabsProvider>(builder: (context, tabsScreenConsumer, _) {
        return Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Container(
                  width: double.infinity,
                  height: 170,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('E:/customersApp/customers_app/lib/assets/images/background.png'), // Replace with the actual image path
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 170,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    gradient: CustomersTheme.gradients.verticalGradient,
                  ),
                ),
                ListTile(
                  leading: const CircleAvatar(
                    backgroundImage: AssetImage('E:/customersApp/customers_app/lib/assets/images/background.png'), // Replace with the actual image path
                  ),
                  title: Text(
                    'username', // Replace with the actual username
                    style: CustomersTheme.textStyles.titleMedium
                        .copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            DrawerItem(
              icon: const Icon(Icons.add),
              label: 'تصفح',
              selectedPageIndex: tabsScreenConsumer.selectedPageIndex,
              onClick: () {
                Navigator.of(context).pop();
                tabsScreenConsumer.selectPage(1);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            DrawerItem(
              icon: const Icon(Icons.shopping_cart),
              label: 'طلباتي',
              selectedPageIndex: tabsScreenConsumer.selectedPageIndex,
              onClick: () {
                Navigator.of(context).pop();
                tabsScreenConsumer.selectPage(2);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            DrawerItem(
              icon: const Icon(Icons.home),
              label: 'الرئيسية',
              selectedPageIndex: tabsScreenConsumer.selectedPageIndex,
              onClick: () {
                Navigator.of(context).pop();
                tabsScreenConsumer.selectPage(0);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            // Add more DrawerItems here as needed

            DrawerItem(
              icon: const Icon(Icons.logout),
              label: 'تسجيل الخروج',
              selectedPageIndex: tabsScreenConsumer.selectedPageIndex,
              onClick: () => _confirmLogOutDialog(
                context,
                Provider.of<UserProvider>(context, listen: false).logout,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        );
      }),
    );
  }
}
