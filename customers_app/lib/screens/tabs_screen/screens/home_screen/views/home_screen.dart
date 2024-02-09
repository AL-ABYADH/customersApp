import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/home_provider.dart';
import '../../../../../screens/search_screen/views/search_screen.dart';
import '../../../../../theme/customers_theme.dart';
import './widgets/product_items_row.dart';
import '../../../../../models/product_item.dart';
import '../../../../../providers/user_provider.dart';
import '../../../../../widgets/loading_error.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final token = Provider.of<UserProvider>(context, listen: false).token!;

    final homeProvider = Provider.of<HomeProvider>(context);

    final Map<String, List<ProductItem>> productItemsRows = {
      'الأحدث في المتجر': homeProvider.recentlyAddedItems,
      'الأعلى تقييماً': homeProvider.highRatedItems,
      'جديد': homeProvider.newItems,
      'مستخدم نظيف': homeProvider.excellentItems,
    };

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: CustomersTheme.colors.backgroundColor,
        body: FutureBuilder(
          future: !homeProvider.homeProductItemsFetched
              ? homeProvider.fetchHomeProductItems(token)
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
                      refresh: homeProvider.refetchHomeProductItems,
                    )
                  : LoadingError(
                      message: 'حدث خطأ ما في النظام، قم',
                      refresh: homeProvider.refetchHomeProductItems,
                    );
            }
            return ListView(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text('ابحث عن جهاز',
                                    style:
                                        CustomersTheme.textStyles.fieldLabel),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(SearchScreen.routeName);
                        },
                      ),
                    ),
                    GestureDetector(
                        child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      width: 45,
                      height: 44,
                      margin: const EdgeInsets.only(left: 10),
                      padding: const EdgeInsets.all(5),
                      child: Image.asset(
                        "lib/assets/icons/filter.png",
                        color: CustomersTheme.colors.primaryColor,
                      ),
                    ))
                  ],
                ),
                if (homeProvider.recentlyAddedItems.isNotEmpty)
                  const SizedBox(
                    height: 15,
                  ),
                if (homeProvider.recentlyAddedItems.isNotEmpty)
                  ProductItemsRow(
                    isErrorLoading:
                        homeProvider.isErrorLoadingRecentlyAddedItems,
                    fetchItems: () =>
                        homeProvider.fetchRecentlyAddedItems(token),
                    isLoading: homeProvider.isLoadingRecentlyAddedItems,
                    label:
                        productItemsRows.keys.toList()[0], // 'الأحدث في المتجر'
                    productItems: productItemsRows.values.toList()[0],
                  ),
                if (homeProvider.highRatedItems.isNotEmpty)
                  const SizedBox(
                    height: 10,
                  ),
                if (homeProvider.highRatedItems.isNotEmpty)
                  ProductItemsRow(
                    isErrorLoading: homeProvider.isErrorLoadingHighRatedItems,
                    fetchItems: () => homeProvider.fetchHighRatedItems(token),
                    isLoading: homeProvider.isLoadingHighRatedItems,
                    label:
                        productItemsRows.keys.toList()[1], // 'الأعلى تقييماً'
                    productItems: productItemsRows.values.toList()[1],
                  ),
                if (homeProvider.newItems.isNotEmpty)
                  const SizedBox(
                    height: 10,
                  ),
                if (homeProvider.newItems.isNotEmpty)
                  ProductItemsRow(
                    isErrorLoading: homeProvider.isErrorLoadingNewItems,
                    fetchItems: () => homeProvider.fetchNewItems(token),
                    isLoading: homeProvider.isLoadingNewItems,
                    label: productItemsRows.keys.toList()[2], // 'جديد'
                    productItems: productItemsRows.values.toList()[2],
                  ),
                if (homeProvider.excellentItems.isNotEmpty)
                  const SizedBox(
                    height: 10,
                  ),
                if (homeProvider.excellentItems.isNotEmpty)
                  ProductItemsRow(
                    isErrorLoading: homeProvider.isErrorLoadingExcellentItems,
                    fetchItems: () => homeProvider.fetchExcellentItems(token),
                    isLoading: homeProvider.isLoadingExcellentItems,
                    label: productItemsRows.keys.toList()[3], // 'مستخدم نظيف'
                    productItems: productItemsRows.values.toList()[3],
                  ),
                const SizedBox(
                  height: 10,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
