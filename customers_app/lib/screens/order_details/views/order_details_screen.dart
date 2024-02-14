import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting

import '/theme/customers_theme.dart';

// Your CustomersTheme and related classes should be defined above or in a separate file and imported.

class Order {
  final String sellerFullName;
  final String orderStatus;
  final DateTime orderDateTime;
  final double totalPrice;
  final int itemCount;
  final List<String> itemsList;

  Order({
    required this.sellerFullName,
    required this.orderStatus,
    required this.orderDateTime,
    required this.totalPrice,
    required this.itemCount,
    required this.itemsList,
  });
}

class OrderDetailsScreen extends StatelessWidget {
  final Order order;
  const OrderDetailsScreen({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('معلومات الطلب', style: CustomersTheme.textStyles.titleLarge),
        backgroundColor: const Color.fromARGB(255, 248, 250, 255),
        centerTitle: false,
        elevation: 1,
      ),
      body: Container(
        color: CustomersTheme
            .colors.backgroundColor, // Set the background color here

        child: ListView(
          children: [
            Card(
              margin: EdgeInsets.zero, // No space around the card
              elevation: 0,
              child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .stretch, // Stretch the columns to the full width of the card
                      children: [
                        Text(
                          'البائع',
                          style: CustomersTheme.textStyles.titleLarge,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text(
                            order.sellerFullName,
                            style: CustomersTheme.textStyles.displayLarge,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'تاريخ الطلب',
                          style: CustomersTheme.textStyles.titleLarge,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text(
                            DateFormat('dd MMM yyyy – hh:mm a')
                                .format(order.orderDateTime),
                            style: CustomersTheme.textStyles.displayLarge,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'حالة الطلب',
                          style: CustomersTheme.textStyles.titleLarge,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text(
                            order.orderStatus,
                            style: CustomersTheme.textStyles.displayLarge,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'عدد الأجهزة',
                          style: CustomersTheme.textStyles.titleLarge,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text(
                            order.itemCount.toString(),
                            style: CustomersTheme.textStyles.displayLarge,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'قائمة الأجهزة',
                          style: CustomersTheme.textStyles.titleLarge,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 0.0),
                          child: Column(
                            children: [
                              ...order.itemsList
                                  .map(
                                    (item) => GestureDetector(
                                      onTap: () {
                                        print('Clicked on item: $item');
                                      },
                                      
                                      child: ListTile(
                                        title: Text(
                                          item,
                                          style: CustomersTheme
                                              .textStyles.titleMedium
                                              .copyWith(
                                                  color: CustomersTheme.colors
                                                      .fieldContentColor),
                                        ),
                                        
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // Action to cancel the order
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    CustomersTheme.colors.errorColor),
                              ),
                              child: Text(
                                'إلغاء',
                                style: CustomersTheme.textStyles.titleMedium
                                    .copyWith(
                                        color: CustomersTheme.colors.text),
                              ),
                            ),
                          ],
                        ),
                      ])),

              //       _buildDetailItem('عدد الأجهزة', order.itemCount.toString()),
              //       _buildDivider(),
              //       ListTile(
              //         title: Text(
              //           'قائمة الأجهزة',
              //           style: CustomersTheme.textStyles.titleLarge
              //               .copyWith(fontWeight: FontWeight.bold),
              //         ),
              //       ),

              //     ],
              //   ),
              // ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget _buildDetailItem(String label, String value) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 8),
  //     child: RichText(
  //       text: TextSpan(
  //         style: CustomersTheme.textStyles.display
  //             .copyWith(color: CustomersTheme.colors.fieldContentColor),
  //         children: [
  //           TextSpan(
  //             text: '$label: ',
  //             style: CustomersTheme.textStyles.titleMedium
  //                 .copyWith(fontWeight: FontWeight.bold),
  //           ),
  //           TextSpan(text: value),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // Widget _buildDivider() {
  //   return Divider(color: CustomersTheme.colors.primaryColorTransparent);
  // }

  // }
}
