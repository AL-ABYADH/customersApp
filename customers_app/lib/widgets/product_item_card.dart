import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product_item.dart';
import '../providers/user_provider.dart';
import '../screens/product_item_details_screen/views/product_item_details_screen.dart';
import '../theme/customers_theme.dart';
import './product_condition.dart';
import './rating.dart';

class ProductItemCard extends StatelessWidget {
  final ProductItem item;
  final String category;

  const ProductItemCard({
    required this.item,
    required this.category,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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

    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(
        ProductItemDetailsScreen.routeName,
        arguments: {'productItem': item, 'category': category},
      ),
      child: SizedBox(
        height: 305,
        width: 170,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(CustomersTheme.radius),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: 170,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(CustomersTheme.radius),
                    topRight: Radius.circular(CustomersTheme.radius),
                  ),
                  child: Hero(
                    tag: '${item.id}$category',
                    child: SizedBox(
                      height: 200,
                      width: 170,
                      child: Image.network(
                        item.primImageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(item.productName,
                    style: CustomersTheme.textStyles.titleLarge),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: item.price.floor.toString(),
                        style: CustomersTheme.textStyles.priceFloor,
                      ),
                      TextSpan(
                        text: '.${item.price.fraction.toString()}',
                        style: CustomersTheme.textStyles.priceFraction,
                      ),
                      TextSpan(
                        text: ' $currencyDisplay',
                        style: CustomersTheme.textStyles.currency,
                      ),
                    ],
                  ),
                ),
              ),
              const Expanded(child: SizedBox()),
              ProductCondition(
                  condition: item.usedProductCondition, used: item.usedProduct),
              Padding(
                padding: const EdgeInsets.only(left: 8, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Rating(rating: item.rating),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
