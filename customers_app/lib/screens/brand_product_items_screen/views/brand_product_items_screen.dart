import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../theme/customers_theme.dart';
import '../providers/brand_product_items_provider.dart';
import '../../../widgets/loading_error.dart';
import '../../../providers/user_provider.dart';
import '../../../widgets/product_items_grid.dart';

class BrandProductItemsScreen extends StatelessWidget {
  static const routeName = 'brand-product-item-screen';

  const BrandProductItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final token = Provider.of<UserProvider>(context, listen: false).token!;

    final navArgs = ModalRoute.of(context)!.settings.arguments as Map;
    final int productId = navArgs['productId'];
    final String productName = navArgs['productName'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomersTheme.colors.primaryColor,
        title: Text(productName),
      ),
      backgroundColor: CustomersTheme.colors.backgroundColor,
      body: Scaffold(
        body: Consumer<BrandProductItemsProvider>(
            builder: (context, brandProductItemConsumer, _) {
          return FutureBuilder(
            future: !brandProductItemConsumer.productItemsFetched
                ? brandProductItemConsumer.fetchBrandProductItems(
                    token, productId)
                : null,
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
                        refresh: brandProductItemConsumer.refetchProductItems,
                      )
                    : LoadingError(
                        message: 'حدث خطأ ما في النظام، قم',
                        refresh: brandProductItemConsumer.refetchProductItems,
                      );
              } else {
                return ProductsItemsGrid(
                  items: brandProductItemConsumer.productItems,
                  category: '',
                );
              }
            },
          );
        }),
      ),
    );
  }
}
