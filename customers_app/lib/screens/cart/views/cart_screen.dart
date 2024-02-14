import 'dart:async';
import 'dart:io';

import 'package:customers_app/theme/customers_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/user_provider.dart';
import '../../../widgets/bottom_button.dart';
import '../../../widgets/loading_error.dart';
import '../../../widgets/primary_app_bar.dart';
import '../providers/cart_provider.dart';
import './widgets/cart_items_list.dart';

class CartScreen extends StatelessWidget {
  static const routeName = 'cart-screen';

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    final token = Provider.of<UserProvider>(context, listen: false).token!;

    String currencyDisplay = '';
    switch (Provider.of<UserProvider>(context).preferredCurrency) {
      case 'USD':
        currencyDisplay = '\$';
        break;
      case 'YER':
        currencyDisplay = 'ريال يمني';
        break;
      case 'SAR':
        currencyDisplay = 'ريال سعودي';
        break;
    }

    return Scaffold(
      appBar: PrimaryAppBar(
        title: Text(
          'سلة المشتريات',
          style: CustomersTheme.textStyles.titleLarge,
        ),
      ),
      backgroundColor: CustomersTheme.colors.backgroundColor,
      body: RefreshIndicator(
        onRefresh: () async => await cartProvider.fetchCartProductItems(token),
        color: CustomersTheme.colors.primaryColor,
        child: FutureBuilder(
          future: cartProvider.cartProductItemsFetched
              ? null
              : cartProvider.fetchCartProductItems(token),
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
                      refresh: cartProvider.refetchCartProductItems,
                    )
                  : LoadingError(
                      message: 'حدث خطأ ما في النظام، قم',
                      refresh: cartProvider.refetchCartProductItems,
                    );
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: CartItemsList(
                      cartProductItems: cartProvider.cartProductItems,
                    ),
                  ),
                  if (cartProvider.cartProductItems.isNotEmpty)
                    SizedBox(
                      height: 70,
                      child: BottomButton(
                        onClick:
                            cartProvider.isLoading || cartProvider.isRemoving
                                ? () {}
                                : () async => await cartProvider.createOrder(
                                      token: token,
                                      ctx: context,
                                    ),
                        color: CustomersTheme.colors.primaryColor,
                        icon: const Icon(Icons.shopping_cart),
                        child: cartProvider.isLoading
                            ? const Expanded(
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: 25,
                                      width: 25,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    ),
                                    Expanded(
                                      child: SizedBox(),
                                    ),
                                  ],
                                ),
                              )
                            : Expanded(
                                child: Row(
                                  children: [
                                    Text(
                                      'اطلب الآن!',
                                      style: CustomersTheme
                                          .textStyles.displayLarger
                                          .copyWith(
                                        color: Colors.white,
                                      ),
                                    ),
                                    const Expanded(child: SizedBox()),
                                    Text(
                                      '${cartProvider.totalPrice.toStringAsFixed(2)} $currencyDisplay',
                                      style: CustomersTheme
                                          .textStyles.displayLarge
                                          .copyWith(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                      ),
                    ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
