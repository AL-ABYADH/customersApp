import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './brand_row_item.dart';
import '../../providers/brows_provider.dart';

class BrandsRow extends StatelessWidget {
  final List<String> brands;
  final int selectedBrandIndex;

  const BrandsRow({
    required this.brands,
    required this.selectedBrandIndex,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final browsProvider = Provider.of<BrowsProvider>(context);

    // Set up the chat row items
    final List<Widget> chatRowItems = [];
    for (String brand in brands) {
      chatRowItems.addAll(
        [
          BrandRowItem(
            brand: brand,
            imageUrl: browsProvider.brands[brand]!,
            brandIndex: browsProvider.brands.keys.toList().indexOf(brand),
            selectedBrandIndex: browsProvider.selectedBrandIndex,
          ),
          const SizedBox(
            width: 15,
          ),
        ],
      );
    }

    return SizedBox(
      height: 70, // Adjust the height as needed
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: chatRowItems,
        ),
      ),
    );
  }
}
