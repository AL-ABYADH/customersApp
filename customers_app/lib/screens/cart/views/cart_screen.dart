import 'dart:ui';
import 'package:customers_app/theme/customers_theme.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: CustomersTheme.colors.primaryColor,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              "سلة المشتريات",
              style: CustomersTheme.textStyles.titleLarge.copyWith(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView.builder(
                itemCount: 3, // Replace with your actual item count
                padding: EdgeInsets.all(12),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: CustomersTheme.colors.fieldFillColor,
                        borderRadius: BorderRadius.circular(CustomersTheme.radius),
                      ),
                      child: ListTile(
                        leading: Image.network(
                          'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif', // Replace with actual asset path
                          height: 36,
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Item ${index + 1}', // Replace with actual item name
                              style: CustomersTheme.textStyles.titleMedium,
                            ),
                            Text(
                              '\$10.00', // Replace with actual price
                              style: CustomersTheme.textStyles.labelSmall,
                            ),
                          ],
                        ),
                        trailing: SizedBox.shrink(), // Remove IconButton
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(36.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(CustomersTheme.radius),
                color: CustomersTheme.colors.successColor,
              ),
              padding: const EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'السعر الإجمالي',
                        style: CustomersTheme.textStyles.display.copyWith(
                          color: CustomersTheme.colors.primaryColor,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '\$30.00', // Replace with actual total price
                        style: CustomersTheme.textStyles.titleMedium.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: CustomersTheme.colors.primaryColor),
                      borderRadius: BorderRadius.circular(28),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: const [
                        Text(
                          'اطلب الآن',
                          style: TextStyle(color: Colors.white),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
