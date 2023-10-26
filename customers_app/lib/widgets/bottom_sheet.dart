import 'package:customers_app/theme/customers_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/bottom_sheet_provider.dart';
import '../screens/tabs_screen/screens/brows_screen.dart/providers/brows_provider.dart';

class CustomBottomSheet {
  static void showCustomBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return ChangeNotifierProvider.value(
          value: BottomSheetProvider(),
          child: FractionallySizedBox(
            heightFactor: 0.8,
            child: Consumer<BottomSheetProvider>(
              builder: (context, show, child) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      const Padding(padding: EdgeInsets.all(10)),
                      Center(
                        child: Text(
                          "تصفية",
                          style: CustomersTheme.textStyles.titleLarge.copyWith(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 0.5,
                        height: 30,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(right: 20),
                            child: Text(
                              "العلامات التجارية:",
                              textAlign: TextAlign.right,
                              style: CustomersTheme.textStyles.titleMedium.copyWith(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Wrap(
                            children: [],
                          ),
                        ],
                      ),
                      Wrap(
                        children: List.generate(
                          show.max,
                              (index) {
                            String brand = BrowsProvider().brands.values.elementAt(index);
                            bool isSelected = show.selectedItems.contains(index); // Check if the item is selected

                            return GestureDetector(
                              child: Container(
                                width: 80,
                                height: 80,
                                margin: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: isSelected
                                      ? Border.all(color: Colors.blue, width: 2.0) // Apply border for selected items
                                      : null,
                                ),
                                child: Image.network(brand),
                              ),
                              onTap: () {
                                if (isSelected) {
                                  // Deselect the item
                                  show.deselectItem(index);
                                } else {
                                  // Select the item
                                  show.selectItem(index);
                                }
                              },
                            );
                          },
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          show.showMore(BrowsProvider().brands.length);
                        },
                        child: Text(show.message),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
