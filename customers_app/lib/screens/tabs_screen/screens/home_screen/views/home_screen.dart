import 'package:customers_app/screens/tabs_screen/screens/home_screen/providers/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../screens/search_screen/views/search_screen.dart';
import '../../../../../theme/customers_theme.dart';
import './widgets/product_items_row.dart';
import '../../../../../models/product_item.dart';
import '../../../../../widgets/bottom_sheet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Future<List<String>> fetchBrands() async {
  //   final repoUrl =
  //   Uri.parse("https://api.github.com/repos/DrCinco730/brands/contents");
  //   final response = await get(repoUrl);

  //   if (response.statusCode == 200) {
  //     final List<dynamic> data = json.decode(response.body);
  //     List<String> brandNames = [];

  //     for (var item in data) {
  //       brandNames.add(item['name']);
  //     }
  //     return brandNames;
  //   } else {
  //     throw Exception('Failed to load brands');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);

    final Map<String, List<ProductItem>> productItemsRows = {
      'الأحدث في المتجر': homeProvider.recentlyAddedItems,
      'الأعلى تقييماً': homeProvider.highRatedItems,
    };

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: CustomersTheme.colors.backgroundColor,
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: GestureDetector(
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
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('ابحث عن جهاز',
                              style: CustomersTheme.textStyles.fieldLabel),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed(SearchScreen.routeName);
                  },
                )),
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
                  ),
                  onTap: () {
                    CustomBottomSheet.showCustomBottomSheet(context);
                  },
                )
              ],
            ),
            Expanded(
                child: ListView(
              children: [
                const SizedBox(
                  height: 15,
                ),
                ProductItemsRow(
                  label:
                      productItemsRows.keys.toList()[0], // 'الأحدث في المتجر'
                  productItems: productItemsRows.values.toList()[0],
                ),
                const SizedBox(
                  height: 10,
                ),
                ProductItemsRow(
                  label: productItemsRows.keys.toList()[1], // 'الأعلى تقييماً'
                  productItems: productItemsRows.values.toList()[1],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
