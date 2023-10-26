import '../models/feature.dart';

class Product {
  final int id;
  final String name;
  final String brand;
  final String imageUrl;
  final List flaws;
  final double rating;
  final List<Feature> features;

  Product({
    required this.id,
    required this.name,
    required this.brand,
    required this.imageUrl,
    required this.flaws,
    required this.rating,
    required this.features,
  });
}
