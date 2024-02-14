// import 'package:customers_app/theme/customers_theme.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart'; // For date formatting

// // Your CustomersTheme and related classes should be defined above or in a separate file and imported.

// class OrderListItem {
//   final String sellerFullName;
//   final DateTime orderDateTime;
//   final double totalPrice;
//   final int itemCount;
//   final List<String> itemsList;

//   OrderListItem({
//     required this.sellerFullName,
//     required this.orderDateTime,
//     required this.totalPrice,
//     required this.itemCount,
//     required this.itemsList,
//   });
// }

// class OrderDetailsPage extends StatelessWidget {
//   final OrderListItem orderItem;

//   const OrderDetailsPage({required this.orderItem, Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('معلومات الطلب', style: CustomersTheme.textStyles.titleLarge),
//         backgroundColor: CustomersTheme.colors.primaryColor,
//         centerTitle: true,
//         elevation: 0,
//       ),
//       body: ListView(
//         children: [
//           Card(
//             margin: EdgeInsets.zero, // No space around the card
//             elevation: 4,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.zero, // No rounded corners
//             ),
//             child: Padding(
//               padding: EdgeInsets.all(30),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch the columns to the full width of the card
//                 children: [
//                   _buildDetailItem('البائع', orderItem.sellerFullName),
//                   _buildDivider(),
//                   _buildDetailItem(
//                     'تاريخ الطلب',
//                     DateFormat('dd MMM yyyy – hh:mm a').format(orderItem.orderDateTime),
//                   ),
//                   _buildDivider(),
//                   _buildDetailItem(
//                     'السعر الإجمالي',
//                     '\$${orderItem.totalPrice.toStringAsFixed(2)}',
//                   ),
//                   _buildDivider(),
//                   _buildDetailItem('عدد الطلبات', orderItem.itemCount.toString()),
//                   _buildDivider(),
//                   Padding(
//                     padding: EdgeInsets.symmetric(vertical: 8),
//                     child: Text(
//                       'قائمة الطلبات',
//                       style: CustomersTheme.textStyles.titleLarge.copyWith(fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   ...orderItem.itemsList.map((item) => _buildItem(item)).toList(),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildDetailItem(String label, String value) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 8),
//       child: RichText(
//         text: TextSpan(
//           style: CustomersTheme.textStyles.display.copyWith(color: CustomersTheme.colors.fieldContentColor),
//           children: [
//             TextSpan(
//               text: '$label: ',
//               style: CustomersTheme.textStyles.titleMedium.copyWith(fontWeight: FontWeight.bold),
//             ),
//             TextSpan(text: value),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildDivider() {
//     return Divider(color: CustomersTheme.colors.primaryColorTransparent);
//   }

//   Widget _buildItem(String item) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 4),
//       child: Text(
//         item,
//         style: CustomersTheme.textStyles.display.copyWith(color: CustomersTheme.colors.fieldContentColor),
//       ),
//     );
//   }
// }

import 'package:customers_app/theme/customers_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting

// Your CustomersTheme and related classes should be defined above or in a separate file and imported.

class OrderListItem {
  final String sellerFullName;
  final DateTime orderDateTime;
  final double totalPrice;
  final int itemCount;
  final List<String> itemsList;

  OrderListItem({
    required this.sellerFullName,
    required this.orderDateTime,
    required this.totalPrice,
    required this.itemCount,
    required this.itemsList,
  });
}

class OrderDetailsPage extends StatelessWidget {
  final OrderListItem orderItem;

  const OrderDetailsPage({required this.orderItem, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('معلومات الطلب', style: CustomersTheme.textStyles.titleLarge),
        backgroundColor: CustomersTheme.colors.primaryColor,
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        children: [
          Card(
            margin: EdgeInsets.zero, // No space around the card
            elevation: 4,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero, // No rounded corners
            ),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment
                    .stretch, // Stretch the columns to the full width of the card
                children: [
                  _buildDetailItem('البائع', orderItem.sellerFullName),
                  _buildDivider(),
                  _buildDetailItem(
                    'تاريخ الطلب',
                    DateFormat('dd MMM yyyy – hh:mm a')
                        .format(orderItem.orderDateTime),
                  ),
                  _buildDivider(),
                  _buildDetailItem(
                    'السعر الإجمالي',
                    '\$${orderItem.totalPrice.toStringAsFixed(2)}',
                  ),
                  _buildDivider(),
                  _buildDetailItem(
                      'عدد الطلبات', orderItem.itemCount.toString()),
                  _buildDivider(),
                  ListTile(
                    title: Text(
                      'قائمة الطلبات',
                      style: CustomersTheme.textStyles.titleLarge
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  ...orderItem.itemsList
                      .map((item) => _buildItem(item))
                      .toList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: RichText(
        text: TextSpan(
          style: CustomersTheme.textStyles.display
              .copyWith(color: CustomersTheme.colors.fieldContentColor),
          children: [
            TextSpan(
              text: '$label: ',
              style: CustomersTheme.textStyles.titleMedium
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(color: CustomersTheme.colors.primaryColorTransparent);
  }

  Widget _buildItem(String item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        title: Text(
          item,
          style: CustomersTheme.textStyles.display
              .copyWith(color: CustomersTheme.colors.fieldContentColor),
        ),
      ),
    );
  }
}
