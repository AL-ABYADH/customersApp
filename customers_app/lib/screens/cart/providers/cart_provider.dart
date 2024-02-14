import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../../models/feature.dart';
import '../../../models/flaw.dart';
import '../../../models/price.dart';
import '../../../models/product_item.dart';
import '../../../providers/user_provider.dart';
import '../../../utils/display_http_error_snack_bar.dart';
import '../../../utils/display_success_snack_bar.dart';
import '../../../utils/send_delete.dart';
import '../../../utils/send_get.dart';
import '../../../utils/send_post.dart';
import '../../tabs_screen/screens/home_screen/providers/home_provider.dart';

class CartProvider with ChangeNotifier {
  List<ProductItem> _cartProductItems = [];

  List<ProductItem> get cartProductItems => _cartProductItems;

  final _client = http.Client();

  var cartProductItemsFetched = false;
  void refetchCartProductItems() {
    cartProductItemsFetched = false;
    notifyListeners();
  }

  Future<void> fetchCartProductItems(String token) async {
    final url = Uri.parse('${dotenv.env['URL']}/api/carts/cart-items');
    // print(url);
    try {
      final responseData =
          await sendGet(url: url, client: _client, token: token);

      final List<ProductItem> loadedProductItems =
          getLoadedProductItems(responseData);
      cartProductItemsFetched = true;
      _cartProductItems = loadedProductItems;
      notifyListeners();
    } catch (err) {
      print(err);
      cartProductItemsFetched = true;
      notifyListeners();
      rethrow;
    }
  }

  var isLoading = false;

  Future<void> createOrder({
    required String token,
    required BuildContext ctx,
  }) async {
    final url =
        Uri.parse('${dotenv.env['URL']}/api/customers/orders/create-order');
    try {
      isLoading = true;
      notifyListeners();

      await sendPost(
        url: url,
        client: _client,
        requestBody: json.encode({}),
        token: token,
      );

      isLoading = false;
      notifyListeners();

      if (!ctx.mounted) return;
      displaySuccessSnackBar(ctx, 'تم الطلب بنجاح');

      await Provider.of<UserProvider>(ctx, listen: false).emptyCartItemsCount();

      _cartProductItems.clear();
      if (!ctx.mounted) return;
      Provider.of<HomeProvider>(ctx, listen: false).refetchHomeProductItems();
      Navigator.of(ctx).pop();
    } catch (err) {
      // print(err);
      isLoading = false;
      notifyListeners();
      if (!ctx.mounted) return;
      displayHttpErrorSnackBar(ctx: ctx, err: err, showServerError: true);
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

  var isRemoving = false;
  Future<void> removeItemFromCart({
    required String token,
    required ProductItem productItem,
    required BuildContext ctx,
  }) async {
    final url = Uri.parse(
        '${dotenv.env['URL']}/api/carts/remove-from-cart/${productItem.id}');
    try {
      isRemoving = true;
      notifyListeners();

      await sendDelete(
        url: url,
        client: _client,
        token: token,
      );

      isRemoving = false;
      notifyListeners();

      productItem.removeFromCart();

      if (!ctx.mounted) return;
      final homeProvider = Provider.of<HomeProvider>(ctx, listen: false);
      homeProvider.removeFromCart(productItem.id);

      final cartProvider = Provider.of<CartProvider>(ctx, listen: false);
      cartProvider.removeFromCart(productItem.id);

      await Provider.of<UserProvider>(ctx, listen: false)
          .decrementCartItemsCount();
      if (!ctx.mounted) return;
      displaySuccessSnackBar(ctx, 'تم الحذف من السلة');
    } catch (err) {
      // print(err);
      isRemoving = false;
      notifyListeners();
      if (!ctx.mounted) return;
      displayHttpErrorSnackBar(ctx: ctx, err: err, showServerError: false);
    }
  }

  void addToCart(int productItemId) {
    refetchCartProductItems();
    final items = _cartProductItems
        .where((productItem) => productItem.id == productItemId);
    for (final item in items) {
      item.addToCart();
    }
  }

  void removeFromCart(int productItemId) {
    refetchCartProductItems();
    final items = _cartProductItems
        .where((productItem) => productItem.id == productItemId);
    for (final item in items) {
      item.removeFromCart();
    }
  }

  double get totalPrice {
    double price = 0;
    for (final item in _cartProductItems) {
      price += item.price.price;
    }
    return price;
  }
}
