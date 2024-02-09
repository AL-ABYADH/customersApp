import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../theme/customers_theme.dart';
import '../../providers/brows_provider.dart';

class BrandRowItem extends StatelessWidget {
  final String brand;
  final String imageUrl;
  final int brandIndex;
  final int selectedBrandIndex;

  const BrandRowItem({
    required this.brand,
    required this.imageUrl,
    required this.brandIndex,
    required this.selectedBrandIndex,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Provider.of<BrowsProvider>(context, listen: false)
          .selectBrand(brandIndex),
      splashFactory: NoSplash.splashFactory,
      child: Column(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: selectedBrandIndex == brandIndex
                ? CustomersTheme.colors.primaryColor
                : CustomersTheme.colors.primaryColorTransparent,
            child: CircleAvatar(
              radius: 23,
              backgroundColor: CustomersTheme.colors.backgroundColor,
              child: CircleAvatar(
                backgroundColor: CustomersTheme.colors.primaryColor,
                foregroundImage: AssetImage(
                  imageUrl,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          SizedBox(
            width: 60,
            height: 13,
            child: FittedBox(
              child: Text(
                brand,
                style: CustomersTheme.textStyles.display
                    .copyWith(color: CustomersTheme.colors.primaryColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
