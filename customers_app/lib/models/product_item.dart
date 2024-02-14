import './flaw.dart';
import '../../../../../models/feature.dart';
import './price.dart';

class ProductItem {
  final int id;
  final String desc;
  final int productId;
  final String productName;
  final String seller;
  final String model;
  final Price price;
  final String primImageUrl;
  final List<String> imageUrls;
  final double rating;
  final int warrantyEndsIn; // Days
  final bool usedProduct;
  final String?
      usedProductCondition; // 'excellent' | 'good' | 'normal' | 'bad' | 'terrible'
  final List<Flaw> flaws;
  final List<Feature> features;
  bool inCart;

  ProductItem({
    required this.id,
    required this.desc,
    required this.productId,
    required this.productName,
    required this.seller,
    required this.model,
    required this.price,
    required this.primImageUrl,
    required this.imageUrls,
    required this.rating,
    required this.warrantyEndsIn,
    required this.usedProduct,
    this.usedProductCondition,
    required this.flaws,
    required this.features,
    required this.inCart,
  });

  void addToCart() {
    inCart = true;
  }

  void removeFromCart() {
    inCart = false;
  }
}
