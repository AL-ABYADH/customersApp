import 'price.dart';
import 'product_item.dart';

class Order {
  final int id;
  final String status;
  final String sellerName;
  final Price totalPrice;
  final DateTime date;
  final List<ProductItem> productItems;

  Order({
    required this.id,
    required this.status,
    required this.sellerName,
    required this.totalPrice,
    required this.date,
    required this.productItems,
  });
}
