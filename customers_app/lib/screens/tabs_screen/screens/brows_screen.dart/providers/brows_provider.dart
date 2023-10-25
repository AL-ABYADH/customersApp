import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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

  var productsFetched = false;
  void refetchProducts() {
    productsFetched = false;
    notifyListeners();
  }

  int selectedBrandIndex = 0;
  void selectBrand(int index) {
    if (index != selectedBrandIndex) {
      cancelRequest();
      selectedBrandIndex = index;
      notifyListeners();
      refetchProducts();
    }
  }

  var client = http.Client();

  void cancelRequest() {
    client.close();
    client = http.Client();
  }

  Future<void> fetchProducts() async {}
}
