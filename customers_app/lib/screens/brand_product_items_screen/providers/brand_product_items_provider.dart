import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../../../models/product_item.dart';
import '../../../models/price.dart';
import '../../../models/feature.dart';
import '../../../models/flaw.dart';
import '../../../utils/send_get.dart';

class BrandProductItemsProvider with ChangeNotifier {
  List<ProductItem> _items = [];

  List<ProductItem> get items => _items;

  final _client = http.Client();

  var itemsFetched = false;
  void refetchItems() {
    itemsFetched = false;
    notifyListeners();
  }

  Future<void> fetchBrandProductItems(String token, int productId) async {
    final url = Uri.parse(
        '${dotenv.env['URL']}/api/product-items/all-product-items/$productId');
    print(url);
    try {
      final responseData =
          await sendGet(url: url, client: _client, token: token);

      final List<ProductItem> loadedProductItems =
          getLoadedProductItems(responseData);
      itemsFetched = true;
      _items = loadedProductItems;
      notifyListeners();
    } catch (err) {
      print(err);
      itemsFetched = true;
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
          price: Price(
              price: productItem['price'], currency: productItem['currency']),
          primImageUrl: '${dotenv.env['URL']}${productItem['primImageUrl']}',
          imageUrls: productItem['imageUrls']
              .map((url) => '${dotenv.env['URL']}url')
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
}
