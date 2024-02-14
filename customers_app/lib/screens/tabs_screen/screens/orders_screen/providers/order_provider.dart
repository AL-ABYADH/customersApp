import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../../../../../models/feature.dart';
import '../../../../../models/flaw.dart';
import '../../../../../models/order.dart';
import '../../../../../models/price.dart';
import '../../../../../models/product_item.dart';
import '../../../../../utils/send_get.dart';

class OrdersProvider with ChangeNotifier {
  List<Order> _awaitingOrders = [];
  List<Order> _confirmedOrders = [];
  List<Order> _testingOrders = [];
  List<Order> _confirmingOrders = [];

  List<Order> get awaitingOrders => _awaitingOrders;
  List<Order> get confirmedOrders => _confirmedOrders;
  List<Order> get testingOrders => _testingOrders;
  List<Order> get confirmingOrders => _confirmingOrders;

  final _client = http.Client();

  var ordersFetched = false;
  void refetchOrders() {
    ordersFetched = false;
    notifyListeners();
  }

  Future<void> fetchOrders(String token) async {
    final url =
        Uri.parse('${dotenv.env['URL']}/api/customers/orders/ongoing-orders');
    try {
      final responseData =
          await sendGet(url: url, client: _client, token: token);

      final loadedAwaitingOrders =
          responseData.where((order) => order['status'] == 'awaiting');
      final loadedConfirmingOrders =
          responseData.where((order) => order['status'] == 'confirming');
      final loadedConfirmedOrders =
          responseData.where((order) => order['status'] == 'confirmed');
      final loadedTestingOrders =
          responseData.where((order) => order['status'] == 'testing');

      _awaitingOrders = getLoadedOrders(loadedAwaitingOrders);
      _confirmingOrders = getLoadedOrders(loadedConfirmingOrders);
      _confirmedOrders = getLoadedOrders(loadedConfirmedOrders);
      _testingOrders = getLoadedOrders(loadedTestingOrders);

      ordersFetched = true;
      notifyListeners();
    } catch (err) {
      print(err);
      ordersFetched = true;
      notifyListeners();
      rethrow;
    }
  }

  List<Order> getLoadedOrders(fetchedOrders) {
    final List<Order> loadedProductItems = [];

    for (final order in fetchedOrders) {
      loadedProductItems.add(
        Order(
          id: order['id'],
          status: order['status'],
          sellerName: order['seller']['full_name'],
          date: DateTime.parse(order['created_at']),
          totalPrice: Price(
            price: order['total_price'],
            floor: order['total_price'].floor(),
            fraction: int.parse(order['total_price']
                .toString()
                .substring(order['total_price'].toString().length - 2)),
          ),
          productItems: getLoadedProductItems(
            order['orderItems'],
            order['seller']['full_name'],
          ),
        ),
      );
    }
    return loadedProductItems;
  }

  List<ProductItem> getLoadedProductItems(fetchedItems, String seller) {
    final List<ProductItem> loadedProductItems = [];

    for (final productItem in fetchedItems) {
      loadedProductItems.add(
        ProductItem(
          id: productItem['id'],
          desc: productItem['productItem']['description'],
          productId: productItem['productItem']['product_id'],
          productName: productItem['productItem']['product']['name'],
          seller: seller,
          model: productItem['productItem']['model'],
          inCart: false,
          price: Price(
            price: productItem['productItem']['price']['price'],
            floor: productItem['productItem']['price']['price'].floor(),
            fraction: int.parse(productItem['productItem']['price']['price']
                .toString()
                .substring(productItem['productItem']['price']['price']
                        .toString()
                        .length -
                    2)),
          ),
          primImageUrl:
              '${dotenv.env['URL']}${(productItem['productItem']['imagesGroup']['imageItems'] as List).firstWhere((imageItem) => imageItem['is_primary'] == 1 ? true : false)['image_url']}',
          imageUrls: productItem['productItem']['imagesGroup']['imageItems']
              .map((imageItem) =>
                  '${dotenv.env['URL']}${imageItem['image_url']}')
              .whereType<String>()
              .toList(),
          rating: productItem['productItem']['orderItemName']['rating'],
          warrantyEndsIn: productItem['productItem']['warranty_ends_in'],
          usedProduct:
              productItem['productItem']['used_product'] == 1 ? true : false,
          usedProductCondition: productItem['productItem']
              ['used_product_condition'],
          flaws: productItem['productItem']['flaws']
              .map((flaw) => Flaw(
                  flaw: flaw['flaw'], severityLevel: flaw['severity_level']))
              .whereType<Flaw>()
              .toList(),
          features: [
            Feature(feature: 'Feature 1', type: 'string', value: 'Value 6'),
            Feature(
                feature: 'Feature 2',
                type: 'list<string>',
                value: '["Item X", "Item Y"]'),
          ],
        ),
      );
    }
    return loadedProductItems;
  }
}
