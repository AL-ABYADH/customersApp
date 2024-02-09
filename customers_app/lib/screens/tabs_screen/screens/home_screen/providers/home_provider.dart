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
  List<ProductItem> _highRatedItems = [];
  List<ProductItem> _newItems = [];
  List<ProductItem> _excellentItems = [];

  List<ProductItem> get recentlyAddedItems => _recentlyAddedItems;
  List<ProductItem> get highRatedItems => _highRatedItems;
  List<ProductItem> get newItems => _newItems;
  List<ProductItem> get excellentItems => _excellentItems;

  final _client = http.Client();

  var homeProductItemsFetched = false;
  void refetchHomeProductItems() {
    homeProductItemsFetched = false;
    notifyListeners();
  }

  Future<void> fetchHomeProductItems(String token) async {
    final url =
        Uri.parse('${dotenv.env['URL']}/api/product-items/home-screen-items');
    try {
      final responseData =
          await sendGet(url: url, client: _client, token: token);

      // print(responseData);

      final loadedRecentlyAddedItems =
          responseData['data']['recentlyAddedItems'];
      final loadedHighRatedItems = responseData['data']['highRatedItems'];
      final loadedNewItems = responseData['data']['newItems'];
      final loadedExcellentItems = responseData['data']['excellentItems'];

      homeProductItemsFetched = true;
      _recentlyAddedItems = getLoadedProductItems(loadedRecentlyAddedItems);
      _highRatedItems = getLoadedProductItems(loadedHighRatedItems);
      _newItems = getLoadedProductItems(loadedNewItems);
      _excellentItems = getLoadedProductItems(loadedExcellentItems);
      notifyListeners();
    } catch (err) {
      print(err);
      homeProductItemsFetched = true;
      notifyListeners();
      rethrow;
    }
  }

  var recentlyAddedItemsFetched = false;
  void refetchRecentlyAddedItems() {
    recentlyAddedItemsFetched = false;
    notifyListeners();
  }

  var recentlyAddedItemsPage = 1;
  var isRecentlyAddedItemsPageEnd = false;
  var isLoadingRecentlyAddedItems = false;
  var isErrorLoadingRecentlyAddedItems = false;

  Future<void> fetchRecentlyAddedItems(String token) async {
    final url = Uri.parse(
        '${dotenv.env['URL']}/api/product-items/recently-added-items?page=$recentlyAddedItemsPage');
    try {
      isErrorLoadingRecentlyAddedItems = false;
      isLoadingRecentlyAddedItems = true;
      notifyListeners();

      final responseData =
          await sendGet(url: url, client: _client, token: token);

      final List<ProductItem> loadedProductItems =
          getLoadedProductItems(responseData['data']);

      if (loadedProductItems.isEmpty) {
        isLoadingRecentlyAddedItems = false;
        isRecentlyAddedItemsPageEnd = true;
        notifyListeners();
        return;
      }

      recentlyAddedItemsFetched = true;
      isLoadingRecentlyAddedItems = false;
      recentlyAddedItemsPage++;
      _recentlyAddedItems.addAll(loadedProductItems);
      notifyListeners();
    } catch (err) {
      // print(err);
      recentlyAddedItemsFetched = true;
      isLoadingRecentlyAddedItems = false;
      isErrorLoadingRecentlyAddedItems = true;
      notifyListeners();
      rethrow;
    }
  }

  var highRatedItemsFetched = false;
  void refetchHighRatedItems() {
    highRatedItemsFetched = false;
    notifyListeners();
  }

  var highRatedItemsPage = 1;
  var isHighRatedItemsPageEnd = false;
  var isLoadingHighRatedItems = false;
  var isErrorLoadingHighRatedItems = false;

  Future<void> fetchHighRatedItems(String token) async {
    final url = Uri.parse(
        '${dotenv.env['URL']}/api/product-items/high-rated-items?page=$highRatedItemsPage');
    try {
      isErrorLoadingHighRatedItems = false;
      isLoadingHighRatedItems = true;
      notifyListeners();

      final responseData =
          await sendGet(url: url, client: _client, token: token);

      final List<ProductItem> loadedProductItems =
          getLoadedProductItems(responseData['data']);

      if (loadedProductItems.isEmpty) {
        isLoadingHighRatedItems = false;
        isHighRatedItemsPageEnd = true;
        notifyListeners();
        return;
      }

      highRatedItemsFetched = true;
      isLoadingHighRatedItems = false;
      highRatedItemsPage++;
      _highRatedItems.addAll(loadedProductItems);
      notifyListeners();
    } catch (err) {
      // print(err);
      highRatedItemsFetched = true;
      isLoadingHighRatedItems = false;
      isErrorLoadingHighRatedItems = true;
      notifyListeners();
      rethrow;
    }
  }

  var newItemsFetched = false;
  void refetchNewItems() {
    newItemsFetched = false;
    notifyListeners();
  }

  var newItemsPage = 1;
  var isNewItemsPageEnd = false;
  var isLoadingNewItems = false;
  var isErrorLoadingNewItems = false;

  Future<void> fetchNewItems(String token) async {
    final url = Uri.parse(
        '${dotenv.env['URL']}/api/product-items/new-items?page=$newItemsPage');
    try {
      isErrorLoadingNewItems = false;
      isLoadingNewItems = true;
      notifyListeners();

      final responseData =
          await sendGet(url: url, client: _client, token: token);

      final List<ProductItem> loadedProductItems =
          getLoadedProductItems(responseData['data']);

      if (loadedProductItems.isEmpty) {
        isLoadingNewItems = false;
        isNewItemsPageEnd = true;
        notifyListeners();
        return;
      }

      newItemsFetched = true;
      isLoadingNewItems = false;
      newItemsPage++;
      _newItems.addAll(loadedProductItems);
      notifyListeners();
    } catch (err) {
      // print(err);
      newItemsFetched = true;
      isLoadingNewItems = false;
      isErrorLoadingNewItems = true;
      notifyListeners();
      rethrow;
    }
  }

  var excellentItemsFetched = false;
  void refetchExcellentItems() {
    excellentItemsFetched = false;
    notifyListeners();
  }

  var excellentItemsPage = 1;
  var isExcellentItemsPageEnd = false;
  var isLoadingExcellentItems = false;
  var isErrorLoadingExcellentItems = false;

  Future<void> fetchExcellentItems(String token) async {
    final url = Uri.parse(
        '${dotenv.env['URL']}/api/product-items/excellent-items?page=$excellentItemsPage');
    try {
      isErrorLoadingExcellentItems = false;
      isLoadingExcellentItems = true;
      notifyListeners();

      final responseData =
          await sendGet(url: url, client: _client, token: token);

      final List<ProductItem> loadedProductItems =
          getLoadedProductItems(responseData['data']);

      if (loadedProductItems.isEmpty) {
        isLoadingExcellentItems = false;
        isExcellentItemsPageEnd = true;
        notifyListeners();
        return;
      }

      excellentItemsFetched = true;
      isLoadingExcellentItems = false;
      excellentItemsPage++;
      _excellentItems.addAll(loadedProductItems);
      notifyListeners();
    } catch (err) {
      // print(err);
      excellentItemsFetched = true;
      isLoadingExcellentItems = false;
      isErrorLoadingExcellentItems = true;
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
