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
    final url =
        Uri.parse('${dotenv.env['URL']}/api/brandProductItems/$productId');
    try {
      final responseData =
          await sendGet(url: url, client: _client, token: token);

      final List<ProductItem> loadedProductItems = [];

      for (final productItem in responseData) {
        loadedProductItems.add(
          ProductItem(
            id: productItem['id'],
            desc: productItem['desc'],
            productId: productItem['productId'],
            productName: productItem['productName'],
            price: Price(
                price: productItem['price'], currency: productItem['currency']),
            primImageUrl:
                'https://cdn.dxomark.com/wp-content/uploads/medias/post-65438/galaxynote20.jpg',
            imageUrls: [
              'https://cdn.dxomark.com/wp-content/uploads/medias/post-65438/galaxynote20.jpgg',
              'https://cdn.dxomark.com/wp-content/uploads/medias/post-65438/galaxynote20.jpgg'
            ],
            rating: productItem['rating'],
            warrantyEndsIn: productItem['warrantyEndsIn'],
            usedProduct: productItem['usedProduct'] == 1 ? true : false,
            usedProductCondition: productItem['usedProductCondition'],
            flaws: [
              Flaw(flaw: 'Minor dents', severityLevel: 'slight'),
            ],
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
      itemsFetched = true;
      _items = loadedProductItems;
      notifyListeners();
    } catch (err) {
      // print(err);
      itemsFetched = true;
      notifyListeners();
      rethrow;
    }
  }

  List<Flaw> _assignFlaws(dynamic flaws) {
    final List<Flaw> assignedFlaws = [];
    for (final flaw in flaws) {
      assignedFlaws
          .add(Flaw(flaw: flaw['flaw'], severityLevel: flaw['severityLevel']));
    }
    return assignedFlaws;
  }

  List<Feature> _assignFeatures(dynamic features) {
    final List<Feature> assignedFeatures = [];
    for (final feature in features) {
      assignedFeatures.add(Feature(
          feature: feature['feature'],
          type: feature['type'],
          value: feature['value']));
    }
    return assignedFeatures;
  }
}
