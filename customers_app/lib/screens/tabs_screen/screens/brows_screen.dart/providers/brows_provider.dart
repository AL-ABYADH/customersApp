import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../../../../../models/product.dart';
import '../../../../../models/feature.dart';
import '../../../../../utils/send_get.dart';

class BrowsProvider with ChangeNotifier {
  final Map<String, String> brands = {
    'Samsung': 'lib/assets/images/brands/Samsung.jpg',
    'Google': 'lib/assets/images/brands/Google.jpg',
    'Xiaomi': 'lib/assets/images/brands/Xiaomi.jpg',
  };

  List<Product> _products = [];

  List<Product> get products => _products;

  int selectedBrandIndex = 0;
  void selectBrand(int index) {
    if (index != selectedBrandIndex) {
      cancelRequest();
      selectedBrandIndex = index;
      notifyListeners();
      refetchProducts();
    }
  }

  var _client = http.Client();

  var productsFetched = false;
  void refetchProducts() {
    productsFetched = false;
    notifyListeners();
  }

  Future<void> fetchBrandProducts(String token) async {
    final url = Uri.parse(
        '${dotenv.env['URL']}/api/products/brand-products?brand=${brands.keys.toList().firstWhere((brand) => brand == brands.keys.toList()[selectedBrandIndex])}');
    try {
      final responseData =
          await sendGet(url: url, client: _client, token: token);

      final List<Product> loadedProducts = [];
      // print(responseData);

      for (final product in responseData) {
        loadedProducts.add(
          Product(
            id: product['id'],
            name: product['name'],
            brand: product['brand'],
            imageUrl:
                'https://cdn.dxomark.com/wp-content/uploads/medias/post-65438/galaxynote20.jpg',
            rating: product['rating'],
            flaws: json.decode(product['flaws']),
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
      productsFetched = true;
      _products = loadedProducts;
      notifyListeners();
    } catch (err) {
      // print(err);
      productsFetched = true;
      notifyListeners();
      rethrow;
    }
  }

  void cancelRequest() {
    _client.close();
    _client = http.Client();
  }
}
