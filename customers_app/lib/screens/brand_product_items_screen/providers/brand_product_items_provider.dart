import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../../../models/product_item.dart';
import '../../../models/feature.dart';
import '../../../models/flaw.dart';
import '../../../utils/send_get.dart';
import '../../../models/price.dart';

class BrandProductItemsProvider with ChangeNotifier {
  List<ProductItem> _productItems = [];

  List<ProductItem> get productItems => _productItems;

  final _client = http.Client();

  var productItemsFetched = false;
  void refetchProductItems() {
    productItemsFetched = false;
    notifyListeners();
  }

  Future<void> fetchBrandProductItems(String token, int productId) async {
    final url = Uri.parse(
        '${dotenv.env['URL']}/api/product-items/all-product-items/$productId');
    // print(url);
    try {
      final responseData =
          await sendGet(url: url, client: _client, token: token);

      final List<ProductItem> loadedProductItems =
          getLoadedProductItems(responseData);
      productItemsFetched = true;
      _productItems = loadedProductItems;
      notifyListeners();
    } catch (err) {
      print(err);
      productItemsFetched = true;
      notifyListeners();
      rethrow;
    }
  }

  List<ProductItem> getLoadedProductItems(fetchedItems) {
    final List<ProductItem> loadedProductItems = [];

    for (final productItem in fetchedItems) {
      loadedProductItems.add(
        ProductItem(
          id: productItem['id'],
          desc: productItem['desc'],
          productId: productItem['productId'],
          productName: productItem['productName'],
          seller: productItem['seller'],
          model: productItem['model'],
          inCart: productItem['inCart'],
          price: Price(
            price: productItem['price'],
            floor: productItem['price'].floor(),
            fraction: int.parse(productItem['price']
                .toString()
                .substring(productItem['price'].toString().length - 2)),
          ),
          primImageUrl: '${dotenv.env['URL']}${productItem['primImageUrl']}',
          imageUrls: productItem['imageUrls']
              .map((url) => '${dotenv.env['URL']}$url')
              .whereType<String>()
              .toList(),
          rating: productItem['rating'],
          warrantyEndsIn: productItem['warrantyEndsIn'],
          usedProduct: productItem['usedProduct'] == 1 ? true : false,
          usedProductCondition: productItem['usedProductCondition'],
          flaws: productItem['flaws']
              .map((flaw) => Flaw(
                  flaw: flaw['flaw'], severityLevel: flaw['severityLevel']))
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

  void addToCart(int productItemId) {
    final items =
        _productItems.where((productItem) => productItem.id == productItemId);
    for (final item in items) {
      item.addToCart();
    }
  }

  void removeFromCart(int productItemId) {
    final items =
        _productItems.where((productItem) => productItem.id == productItemId);
    for (final item in items) {
      item.removeFromCart();
    }
  }
}
