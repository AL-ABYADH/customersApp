import 'package:flutter/material.dart';

import '../../../../../models/product_item.dart';
import '../../../../../models/feature.dart';
import '../../../../../models/flaw.dart';
import '../../../../../models/price.dart';

class HomeProvider with ChangeNotifier {
  final List<ProductItem> _recentlyAddedItems = [
    ProductItem(
      id: 1,
      desc: 'This is the first product description.',
      productId: 101,
      productName: 'Product 1',
      price: Price(price: 99.99, currency: 'USD'),
      primImageUrl:
          'https://cdn.dxomark.com/wp-content/uploads/medias/post-65438/galaxynote20.jpg',
      imageUrls: [
        'https://cdn.dxomark.com/wp-content/uploads/medias/post-65438/galaxynote20.jpg',
        'https://cdn.dxomark.com/wp-content/uploads/medias/post-65438/galaxynote20.jpg'
      ],
      rating: 4.5,
      warrantyEndsIn: 365,
      usedProduct: false,
      usedProductCondition: 'excellent',
      flaws: [
        Flaw(flaw: 'Scratch on the side', severityLevel: 'noticeable'),
        Flaw(flaw: 'Small dent', severityLevel: 'slight'),
      ],
      features: [
        Feature(feature: 'Feature 1', type: 'string', value: 'Value 1'),
        Feature(feature: 'Feature 2', type: 'number', value: '42'),
      ],
    ),
    ProductItem(
      id: 2,
      desc: 'This is the second product description.',
      productId: 102,
      productName: 'Product 2',
      price: Price(price: 149.99, currency: 'USD'),
      primImageUrl:
          'https://cdn.dxomark.com/wp-content/uploads/medias/post-65438/galaxynote20.jpg',
      imageUrls: [
        'https://cdn.dxomark.com/wp-content/uploads/medias/post-65438/galaxynote20.jpg',
        'https://cdn.dxomark.com/wp-content/uploads/medias/post-65438/galaxynote20.jpg'
      ],
      rating: 4.2,
      warrantyEndsIn: 180,
      usedProduct: true,
      usedProductCondition: 'good',
      flaws: [
        Flaw(flaw: 'Slight discoloration', severityLevel: 'slight'),
      ],
      features: [
        Feature(feature: 'Feature 1', type: 'string', value: 'Value 2'),
        Feature(feature: 'Feature 2', type: 'number', value: '35'),
      ],
    ),
    ProductItem(
      id: 3,
      desc: 'This is the third product description.',
      productId: 103,
      productName: 'Product 3',
      price: Price(price: 199.99, currency: 'USD'),
      primImageUrl:
          'https://cdn.dxomark.com/wp-content/uploads/medias/post-65438/galaxynote20.jpg',
      imageUrls: [
        'https://cdn.dxomark.com/wp-content/uploads/medias/post-65438/galaxynote20.jpg',
        'https://cdn.dxomark.com/wp-content/uploads/medias/post-65438/galaxynote20.jpg'
      ],
      rating: 4.8,
      warrantyEndsIn: 90,
      usedProduct: true,
      usedProductCondition: 'normal',
      flaws: [],
      features: [
        Feature(feature: 'Feature 1', type: 'string', value: 'Value 3'),
        Feature(
            feature: 'Feature 2', type: 'list', value: '["Item 1", "Item 2"]'),
      ],
    ),
    ProductItem(
      id: 4,
      desc: 'This is the fourth product description.',
      productId: 104,
      productName: 'Product 4',
      price: Price(price: 249.99, currency: 'USD'),
      primImageUrl:
          'https://www.cnet.com/a/img/resize/18d0dd7b9b45eea598e112e5d63d1091a9e6168b/hub/2020/08/28/e2c94e50-3e9c-4723-ae4d-bdebca59261b/note20-mysticgreen.jpg?auto=webp&fit=crop&height=1200&width=1200',
      imageUrls: [
        'https://www.cnet.com/a/img/resize/18d0dd7b9b45eea598e112e5d63d1091a9e6168b/hub/2020/08/28/e2c94e50-3e9c-4723-ae4d-bdebca59261b/note20-mysticgreen.jpg?auto=webp&fit=crop&height=1200&width=1200',
        'https://www.cnet.com/a/img/resize/18d0dd7b9b45eea598e112e5d63d1091a9e6168b/hub/2020/08/28/e2c94e50-3e9c-4723-ae4d-bdebca59261b/note20-mysticgreen.jpg?auto=webp&fit=crop&height=1200&width=1200'
      ],
      rating: 4.0,
      warrantyEndsIn: 30,
      usedProduct: true,
      usedProductCondition: 'bad',
      flaws: [
        Flaw(flaw: 'Cracked screen', severityLevel: 'sever'),
      ],
      features: [
        Feature(feature: 'Feature 1', type: 'string', value: 'Value 4'),
        Feature(feature: 'Feature 2', type: 'list<number>', value: '[1, 2, 3]'),
      ],
    ),
    ProductItem(
      id: 5,
      desc: 'This is the fifth product description.',
      productId: 105,
      productName: 'Product 5',
      price: Price(price: 299.99, currency: 'USD'),
      primImageUrl:
          'https://www.cnet.com/a/img/resize/18d0dd7b9b45eea598e112e5d63d1091a9e6168b/hub/2020/08/28/e2c94e50-3e9c-4723-ae4d-bdebca59261b/note20-mysticgreen.jpg?auto=webp&fit=crop&height=1200&width=1200',
      imageUrls: [
        'https://www.cnet.com/a/img/resize/18d0dd7b9b45eea598e112e5d63d1091a9e6168b/hub/2020/08/28/e2c94e50-3e9c-4723-ae4d-bdebca59261b/note20-mysticgreen.jpg?auto=webp&fit=crop&height=1200&width=1200',
        'https://www.cnet.com/a/img/resize/18d0dd7b9b45eea598e112e5d63d1091a9e6168b/hub/2020/08/28/e2c94e50-3e9c-4723-ae4d-bdebca59261b/note20-mysticgreen.jpg?auto=webp&fit=crop&height=1200&width=1200g'
      ],
      rating: 4.7,
      warrantyEndsIn: 270,
      usedProduct: false,
      usedProductCondition: 'terrible',
      flaws: [
        Flaw(flaw: 'Water damage', severityLevel: 'verySever'),
      ],
      features: [
        Feature(feature: 'Feature 1', type: 'string', value: 'Value 5'),
        Feature(
            feature: 'Feature 2',
            type: 'list<string>',
            value: '["Item A", "Item B"]'),
      ],
    ),
    ProductItem(
      id: 6,
      desc: 'This is the sixth product description.',
      productId: 106,
      productName: 'Product 6',
      price: Price(price: 129.99, currency: 'USD'),
      primImageUrl:
          'https://www.cnet.com/a/img/resize/18d0dd7b9b45eea598e112e5d63d1091a9e6168b/hub/2020/08/28/e2c94e50-3e9c-4723-ae4d-bdebca59261b/note20-mysticgreen.jpg?auto=webp&fit=crop&height=1200&width=1200',
      imageUrls: [
        'https://www.cnet.com/a/img/resize/18d0dd7b9b45eea598e112e5d63d1091a9e6168b/hub/2020/08/28/e2c94e50-3e9c-4723-ae4d-bdebca59261b/note20-mysticgreen.jpg?auto=webp&fit=crop&height=1200&width=1200g',
        'https://www.cnet.com/a/img/resize/18d0dd7b9b45eea598e112e5d63d1091a9e6168b/hub/2020/08/28/e2c94e50-3e9c-4723-ae4d-bdebca59261b/note20-mysticgreen.jpg?auto=webp&fit=crop&height=1200&width=1200g'
      ],
      rating: 3.9,
      warrantyEndsIn: 120,
      usedProduct: false,
      usedProductCondition: 'good',
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
  ];
  
  final List<ProductItem> _highRatedItems = [
    ProductItem(
      id: 1,
      desc: 'This is the first product description.',
      productId: 101,
      productName: 'Product 1',
      price: Price(price: 99.99, currency: 'USD'),
      primImageUrl:
          'https://cdn.dxomark.com/wp-content/uploads/medias/post-65438/galaxynote20.jpg',
      imageUrls: [
        'https://cdn.dxomark.com/wp-content/uploads/medias/post-65438/galaxynote20.jpg',
        'https://cdn.dxomark.com/wp-content/uploads/medias/post-65438/galaxynote20.jpg'
      ],
      rating: 4.5,
      warrantyEndsIn: 365,
      usedProduct: false,
      usedProductCondition: 'excellent',
      flaws: [
        Flaw(flaw: 'Scratch on the side', severityLevel: 'noticeable'),
        Flaw(flaw: 'Small dent', severityLevel: 'slight'),
      ],
      features: [
        Feature(feature: 'Feature 1', type: 'string', value: 'Value 1'),
        Feature(feature: 'Feature 2', type: 'number', value: '42'),
      ],
    ),
    ProductItem(
      id: 2,
      desc: 'This is the second product description.',
      productId: 102,
      productName: 'Product 2',
      price: Price(price: 149.99, currency: 'USD'),
      primImageUrl:
          'https://cdn.dxomark.com/wp-content/uploads/medias/post-65438/galaxynote20.jpg',
      imageUrls: [
        'https://cdn.dxomark.com/wp-content/uploads/medias/post-65438/galaxynote20.jpg',
        'https://cdn.dxomark.com/wp-content/uploads/medias/post-65438/galaxynote20.jpg'
      ],
      rating: 4.2,
      warrantyEndsIn: 180,
      usedProduct: true,
      usedProductCondition: 'good',
      flaws: [
        Flaw(flaw: 'Slight discoloration', severityLevel: 'slight'),
      ],
      features: [
        Feature(feature: 'Feature 1', type: 'string', value: 'Value 2'),
        Feature(feature: 'Feature 2', type: 'number', value: '35'),
      ],
    ),
    ProductItem(
      id: 3,
      desc: 'This is the third product description.',
      productId: 103,
      productName: 'Product 3',
      price: Price(price: 199.99, currency: 'USD'),
      primImageUrl:
          'https://cdn.dxomark.com/wp-content/uploads/medias/post-65438/galaxynote20.jpg',
      imageUrls: [
        'https://cdn.dxomark.com/wp-content/uploads/medias/post-65438/galaxynote20.jpg',
        'https://cdn.dxomark.com/wp-content/uploads/medias/post-65438/galaxynote20.jpg'
      ],
      rating: 4.8,
      warrantyEndsIn: 90,
      usedProduct: true,
      usedProductCondition: 'normal',
      flaws: [],
      features: [
        Feature(feature: 'Feature 1', type: 'string', value: 'Value 3'),
        Feature(
            feature: 'Feature 2', type: 'list', value: '["Item 1", "Item 2"]'),
      ],
    ),
    ProductItem(
      id: 4,
      desc: 'This is the fourth product description.',
      productId: 104,
      productName: 'Product 4',
      price: Price(price: 249.99, currency: 'USD'),
      primImageUrl:
          'https://cdn.dxomark.com/wp-content/uploads/medias/post-65438/galaxynote20.jpg',
      imageUrls: [
        'https://cdn.dxomark.com/wp-content/uploads/medias/post-65438/galaxynote20.jpg',
        'https://cdn.dxomark.com/wp-content/uploads/medias/post-65438/galaxynote20.jpg'
      ],
      rating: 4.0,
      warrantyEndsIn: 30,
      usedProduct: true,
      usedProductCondition: 'bad',
      flaws: [
        Flaw(flaw: 'Cracked screen', severityLevel: 'sever'),
      ],
      features: [
        Feature(feature: 'Feature 1', type: 'string', value: 'Value 4'),
        Feature(feature: 'Feature 2', type: 'list<number>', value: '[1, 2, 3]'),
      ],
    ),
    ProductItem(
      id: 5,
      desc: 'This is the fifth product description.',
      productId: 105,
      productName: 'Product 5',
      price: Price(price: 299.99, currency: 'USD'),
      primImageUrl:
          'https://cdn.dxomark.com/wp-content/uploads/medias/post-65438/galaxynote20.jpg',
      imageUrls: [
        'https://cdn.dxomark.com/wp-content/uploads/medias/post-65438/galaxynote20.jpg',
        'https://cdn.dxomark.com/wp-content/uploads/medias/post-65438/galaxynote20.jpgg'
      ],
      rating: 4.7,
      warrantyEndsIn: 270,
      usedProduct: false,
      usedProductCondition: 'terrible',
      flaws: [
        Flaw(flaw: 'Water damage', severityLevel: 'verySever'),
      ],
      features: [
        Feature(feature: 'Feature 1', type: 'string', value: 'Value 5'),
        Feature(
            feature: 'Feature 2',
            type: 'list<string>',
            value: '["Item A", "Item B"]'),
      ],
    ),
    ProductItem(
      id: 6,
      desc: 'This is the sixth product description.',
      productId: 106,
      productName: 'Product 6',
      price: Price(price: 129.99, currency: 'USD'),
      primImageUrl:
          'https://cdn.dxomark.com/wp-content/uploads/medias/post-65438/galaxynote20.jpg',
      imageUrls: [
        'https://cdn.dxomark.com/wp-content/uploads/medias/post-65438/galaxynote20.jpgg',
        'https://cdn.dxomark.com/wp-content/uploads/medias/post-65438/galaxynote20.jpgg'
      ],
      rating: 3.9,
      warrantyEndsIn: 120,
      usedProduct: false,
      usedProductCondition: 'good',
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
  ];

  List<ProductItem> get recentlyAddedItems => _recentlyAddedItems;
  List<ProductItem> get highRatedItems => _highRatedItems;
}
