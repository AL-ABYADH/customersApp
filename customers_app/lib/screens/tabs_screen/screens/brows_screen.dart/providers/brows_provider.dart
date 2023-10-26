import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../../../../../models/product.dart';
import '../../../../../models/feature.dart';
import '../../../../../utils/send_get.dart';

class BrowsProvider with ChangeNotifier {
  final Map<String, String> brands = {
    'Apple':
        'https://m-cdn.phonearena.com/images/manufacturers/74-150/Apple.jpg',
    'Samsung':
        'https://m-cdn.phonearena.com/images/manufacturers/23-150/Samsung.jpg',
    'Google':
        'https://m-cdn.phonearena.com/images/manufacturers/105-150/Google.jpg',
    'LG': 'https://m-cdn.phonearena.com/images/manufacturers/26-150/LG.jpg',
    'Motorola':
        'https://m-cdn.phonearena.com/images/manufacturers/3-150/Motorola.jpg',
    'Sony': 'https://m-cdn.phonearena.com/images/manufacturers/4-150/Sony.jpg',
    'OnePlus':
        'https://m-cdn.phonearena.com/images/manufacturers/157-150/OnePlus.jpg',
    'Huawei':
        'https://m-cdn.phonearena.com/images/manufacturers/82-150/Huawei.jpg',
    'Xiaomi':
        'https://m-cdn.phonearena.com/images/manufacturers/144-150/Xiaomi.jpg',
    'Asus': 'https://m-cdn.phonearena.com/images/manufacturers/86-150/Asus.jpg',
    'ZTE': 'https://m-cdn.phonearena.com/images/manufacturers/83-150/ZTE.jpg',
    'Honor':
        'https://m-cdn.phonearena.com/images/manufacturers/161-150/Honor.jpg',
    'vivo':
        'https://m-cdn.phonearena.com/images/manufacturers/154-150/vivo.jpg',
  };

  List<Product> _products = [
    // Product(
    //   id: 1,
    //   name: 'Product 1',
    //   brand: 'Brand A',
    //   imageUrl:
    //       'https://cdn.dxomark.com/wp-content/uploads/medias/post-65438/galaxynote20.jpg',
    //   flaws: ['Scratch on the side', 'Slight discoloration'],
    //   rating: 4.5,
    //   features: [
    //     Feature(feature: 'Feature 1', type: 'string', value: 'Value 1'),
    //     Feature(feature: 'Feature 2', type: 'number', value: '42'),
    //   ],
    // ),
    // Product(
    //   id: 2,
    //   name: 'Product 2',
    //   brand: 'Brand B',
    //   imageUrl:
    //       'https://cdn.dxomark.com/wp-content/uploads/medias/post-65438/galaxynote20.jpg',
    //   flaws: ['Small dent', 'Cracked screen'],
    //   rating: 4.2,
    //   features: [
    //     Feature(feature: 'Feature 1', type: 'string', value: 'Value 2'),
    //     Feature(feature: 'Feature 2', type: 'number', value: '35'),
    //   ],
    // ),
    // Product(
    //   id: 3,
    //   name: 'Product 3',
    //   brand: 'Brand C',
    //   imageUrl:
    //       'https://cdn.dxomark.com/wp-content/uploads/medias/post-65438/galaxynote20.jpg',
    //   flaws: ['Water damage', 'Minor dents'],
    //   rating: 4.8,
    //   features: [
    //     Feature(feature: 'Feature 1', type: 'string', value: 'Value 3'),
    //     Feature(
    //         feature: 'Feature 2', type: 'list', value: '["Item 1", "Item 2"]'),
    //   ],
    // ),
    // Product(
    //   id: 4,
    //   name: 'Product 4',
    //   brand: 'Brand D',
    //   imageUrl:
    //       'https://cdn.dxomark.com/wp-content/uploads/medias/post-65438/galaxynote20.jpg',
    //   flaws: ['Noticeable scratch', 'Chipped corner'],
    //   rating: 4.0,
    //   features: [
    //     Feature(feature: 'Feature 1', type: 'string', value: 'Value 4'),
    //     Feature(feature: 'Feature 2', type: 'list<number>', value: '[1, 2, 3]'),
    //   ],
    // ),
    // Product(
    //   id: 5,
    //   name: 'Product 5',
    //   brand: 'Brand E',
    //   imageUrl:
    //       'https://cdn.dxomark.com/wp-content/uploads/medias/post-65438/galaxynote20.jpg',
    //   flaws: ['Very severe damage', 'Missing parts'],
    //   rating: 4.7,
    //   features: [
    //     Feature(feature: 'Feature 1', type: 'string', value: 'Value 5'),
    //     Feature(
    //         feature: 'Feature 2',
    //         type: 'list<string>',
    //         value: '["Item A", "Item B"]'),
    //   ],
    // ),
    // Product(
    //   id: 6,
    //   name: 'Product 6',
    //   brand: 'Brand F',
    //   imageUrl:
    //       'https://cdn.dxomark.com/wp-content/uploads/medias/post-65438/galaxynote20.jpg',
    //   flaws: ['Normal wear and tear', 'Dirty screen'],
    //   rating: 3.9,
    //   features: [
    //     Feature(feature: 'Feature 1', type: 'string', value: 'Value 6'),
    //     Feature(
    //         feature: 'Feature 2',
    //         type: 'list<string>',
    //         value: '["Item X", "Item Y"]'),
    //   ],
    // ),
  ];

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

  Future<void> fetchProducts(String token) async {
    final url = Uri.parse(
        '${dotenv.env['URL']}/api/brandProducts?brand=${brands.keys.toList().firstWhere((brand) => brand == brands.keys.toList()[selectedBrandIndex])}');
    try {
      final responseData =
          await sendGet(url: url, client: _client, token: token);

      final List<Product> loadedProducts = [];
      print(responseData);

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
      print(err);
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
