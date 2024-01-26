import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../../../../../models/product_item.dart';
import '../../../../../models/feature.dart';
import '../../../../../models/flaw.dart';
import '../../../../../models/price.dart';
import '../../../../../utils/send_get.dart';

class HomeProvider with ChangeNotifier {
  List<ProductItem> _recentlyAddedItems = [];

  List<ProductItem> _highRatedItems = [
    // ProductItem(
    //   id: 1,
    //   desc: 'This is the first product description.',
    //   productId: 101,
    //   productName: 'Product 1',
    //   price: Price(price: 99.99, currency: 'USD'),
    //   primImageUrl:
    //       'https://cdn.dxomark.com/wp-content/uploads/medias/post-65438/galaxynote20.jpg',
    //   imageUrls: [
    //     'https://cdn.dxomark.com/wp-content/uploads/medias/post-65438/galaxynote20.jpg',
    //     'https://cdn.dxomark.com/wp-content/uploads/medias/post-65438/galaxynote20.jpg'
    //   ],
    //   rating: 4.5,
    //   warrantyEndsIn: 365,
    //   usedProduct: false,
    //   usedProductCondition: 'excellent',
    //   flaws: [
    //     Flaw(flaw: 'Scratch on the side', severityLevel: 'noticeable'),
    //     Flaw(flaw: 'Small dent', severityLevel: 'slight'),
    //   ],
    //   features: [
    //     Feature(feature: 'Feature 1', type: 'string', value: 'Value 1'),
    //     Feature(feature: 'Feature 2', type: 'number', value: '42'),
    //   ],
    // ),
    // ProductItem(
    //   id: 2,
    //   desc: 'This is the second product description.',
    //   productId: 102,
    //   productName: 'Product 2',
    //   price: Price(price: 149.99, currency: 'USD'),
    //   primImageUrl:
    //       'https://cdn.dxomark.com/wp-content/uploads/medias/post-65438/galaxynote20.jpg',
    //   imageUrls: [
    //     'https://cdn.dxomark.com/wp-content/uploads/medias/post-65438/galaxynote20.jpg',
    //     'https://cdn.dxomark.com/wp-content/uploads/medias/post-65438/galaxynote20.jpg'
    //   ],
    //   rating: 4.2,
    //   warrantyEndsIn: 180,
    //   usedProduct: true,
    //   usedProductCondition: 'good',
    //   flaws: [
    //     Flaw(flaw: 'Slight discoloration', severityLevel: 'slight'),
    //   ],
    //   features: [
    //     Feature(feature: 'Feature 1', type: 'string', value: 'Value 2'),
    //     Feature(feature: 'Feature 2', type: 'number', value: '35'),
    //   ],
    // ),
    // ProductItem(
    //   id: 3,
    //   desc: 'This is the third product description.',
    //   productId: 103,
    //   productName: 'Product 3',
    //   price: Price(price: 199.99, currency: 'USD'),
    //   primImageUrl:
    //       'https://cdn.dxomark.com/wp-content/uploads/medias/post-65438/galaxynote20.jpg',
    //   imageUrls: [
    //     'https://cdn.dxomark.com/wp-content/uploads/medias/post-65438/galaxynote20.jpg',
    //     'https://cdn.dxomark.com/wp-content/uploads/medias/post-65438/galaxynote20.jpg'
    //   ],
    //   rating: 4.8,
    //   warrantyEndsIn: 90,
    //   usedProduct: true,
    //   usedProductCondition: 'normal',
    //   flaws: [],
    //   features: [
    //     Feature(feature: 'Feature 1', type: 'string', value: 'Value 3'),
    //     Feature(
    //         feature: 'Feature 2', type: 'list', value: '["Item 1", "Item 2"]'),
    //   ],
    // ),
    // ProductItem(
    //   id: 4,
    //   desc: 'This is the fourth product description.',
    //   productId: 104,
    //   productName: 'Product 4',
    //   price: Price(price: 249.99, currency: 'USD'),
    //   primImageUrl:
    //       'https://cdn.dxomark.com/wp-content/uploads/medias/post-65438/galaxynote20.jpg',
    //   imageUrls: [
    //     'https://cdn.dxomark.com/wp-content/uploads/medias/post-65438/galaxynote20.jpg',
    //     'https://cdn.dxomark.com/wp-content/uploads/medias/post-65438/galaxynote20.jpg'
    //   ],
    //   rating: 4.0,
    //   warrantyEndsIn: 30,
    //   usedProduct: true,
    //   usedProductCondition: 'bad',
    //   flaws: [
    //     Flaw(flaw: 'Cracked screen', severityLevel: 'sever'),
    //   ],
    //   features: [
    //     Feature(feature: 'Feature 1', type: 'string', value: 'Value 4'),
    //     Feature(feature: 'Feature 2', type: 'list<number>', value: '[1, 2, 3]'),
    //   ],
    // ),
    // ProductItem(
    //   id: 5,
    //   desc: 'This is the fifth product description.',
    //   productId: 105,
    //   productName: 'Product 5',
    //   price: Price(price: 299.99, currency: 'USD'),
    //   primImageUrl:
    //       'https://cdn.dxomark.com/wp-content/uploads/medias/post-65438/galaxynote20.jpg',
    //   imageUrls: [
    //     'https://cdn.dxomark.com/wp-content/uploads/medias/post-65438/galaxynote20.jpg',
    //     'https://cdn.dxomark.com/wp-content/uploads/medias/post-65438/galaxynote20.jpgg'
    //   ],
    //   rating: 4.7,
    //   warrantyEndsIn: 270,
    //   usedProduct: false,
    //   usedProductCondition: 'terrible',
    //   flaws: [
    //     Flaw(flaw: 'Water damage', severityLevel: 'verySever'),
    //   ],
    //   features: [
    //     Feature(feature: 'Feature 1', type: 'string', value: 'Value 5'),
    //     Feature(
    //         feature: 'Feature 2',
    //         type: 'list<string>',
    //         value: '["Item A", "Item B"]'),
    //   ],
    // ),
    // ProductItem(
    //   id: 6,
    //   desc: 'This is the sixth product description.',
    //   productId: 106,
    //   productName: 'Product 6',
    //   price: Price(price: 129.99, currency: 'USD'),
    //   primImageUrl:
    //       'https://cdn.dxomark.com/wp-content/uploads/medias/post-65438/galaxynote20.jpg',
    //   imageUrls: [
    //     'https://cdn.dxomark.com/wp-content/uploads/medias/post-65438/galaxynote20.jpgg',
    //     'https://cdn.dxomark.com/wp-content/uploads/medias/post-65438/galaxynote20.jpgg'
    //   ],
    //   rating: 3.9,
    //   warrantyEndsIn: 120,
    //   usedProduct: false,
    //   usedProductCondition: 'good',
    //   flaws: [
    //     Flaw(flaw: 'Minor dents', severityLevel: 'slight'),
    //   ],
    //   features: [
    //     Feature(feature: 'Feature 1', type: 'string', value: 'Value 6'),
    //     Feature(
    //         feature: 'Feature 2',
    //         type: 'list<string>',
    //         value: '["Item X", "Item Y"]'),
    //   ],
    // ),
  ];

  List<ProductItem> get recentlyAddedItems => _recentlyAddedItems;
  List<ProductItem> get highRatedItems => _highRatedItems;

  final _client = http.Client();

  var recentlyAddedItemsFetched = false;
  void refetchRecentlyAddedItems() {
    recentlyAddedItemsFetched = false;
    notifyListeners();
  }

  Future<void> fetchRecentlyAddedItems(String token) async {
    final url = Uri.parse('${dotenv.env['URL']}/api/recentlyAddedProductItems');
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
      recentlyAddedItemsFetched = true;
      _recentlyAddedItems = loadedProductItems;
      notifyListeners();
    } catch (err) {
      // print(err);
      recentlyAddedItemsFetched = true;
      notifyListeners();
      rethrow;
    }
  }

  var highRatedItemsFetched = false;
  void refetchHighRatedItems() {
    recentlyAddedItemsFetched = false;
    notifyListeners();
  }

  Future<void> fetchHighRatedItems(String token) async {
    final url = Uri.parse('${dotenv.env['URL']}/api/highRatedProductItems');
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
      highRatedItemsFetched = true;
      _highRatedItems = loadedProductItems;
      notifyListeners();
    } catch (err) {
      // print(err);
      highRatedItemsFetched = true;
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
