import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:provider/provider.dart';

import '../../../models/product_item.dart';
import '../../../providers/user_provider.dart';
import '../../../theme/customers_theme.dart';
import '../../../widgets/bottom_button.dart';
import '../../../widgets/rating.dart';
import '../../../widgets/product_condition.dart';
import '../../../widgets/warranty.dart';
import '../../view_image_screen.dart';
import '../providers/product_item_details_provider.dart';

class ProductItemDetailsScreen extends StatelessWidget {
  static const routeName = 'product-item-details-screen';

  const ProductItemDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final token = Provider.of<UserProvider>(context, listen: false).token!;

    final routeArgs = ModalRoute.of(context)!.settings.arguments as Map;

    final productItemDetailsProvider =
        Provider.of<ProductItemDetailsProvider>(context, listen: false);

    final ProductItem productItem = routeArgs['productItem']!;
    final String category = routeArgs['category']!;

    String currencyDisplay = '';
    switch (Provider.of<UserProvider>(context).preferredCurrency) {
      case 'USD':
        currencyDisplay = '\$';
        break;
      case 'YER':
        currencyDisplay = 'ريال يمني';
        break;
      case 'SAR':
        currencyDisplay = 'ريال سعودي';
        break;
    }

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 300,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text(
                      productItem.productName,
                      style: CustomersTheme.textStyles.titleLarge.copyWith(
                        color: CustomersTheme.colors.text,
                      ),
                    ),
                    background: Hero(
                      tag: '${productItem.id}$category',
                      child: Material(
                        child: Swiper(
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => ViewImageScreen(
                                    imageUrls: productItem.imageUrls,
                                    imageIndex: index,
                                    heroTag: '${productItem.id}$category',
                                  ),
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  bottomLeft:
                                      Radius.circular(CustomersTheme.radius),
                                  bottomRight:
                                      Radius.circular(CustomersTheme.radius),
                                ),
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    FadeInImage(
                                      placeholder: const AssetImage(
                                          'lib/assets/images/product_placeholder.jpg'),
                                      image: NetworkImage(
                                          productItem.imageUrls[index]),
                                      fit: BoxFit.cover,
                                    ),
                                    Container(
                                      height: double.infinity,
                                      width: double.infinity,
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color.fromARGB(130, 0, 0, 0),
                                            Color.fromARGB(0, 0, 0, 0),
                                            Color.fromARGB(0, 255, 255, 255),
                                            Color.fromARGB(0, 0, 0, 0),
                                            Color.fromARGB(130, 0, 0, 0),
                                          ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          stops: [0, 0.3, 0.5, 0.8, 1],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          autoplay: true,
                          itemCount: productItem.imageUrls.length,
                          control: const SwiperControl(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  backgroundColor: CustomersTheme.colors.primaryColor,
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      // Product Price
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: productItem.price.floor.toString(),
                                    style: CustomersTheme
                                        .textStyles.priceFloorLarge,
                                  ),
                                  TextSpan(
                                    text:
                                        '.${productItem.price.fraction.toString()}',
                                    style: CustomersTheme
                                        .textStyles.priceFractionLarge,
                                  ),
                                  TextSpan(
                                    text: ' $currencyDisplay',
                                    style:
                                        CustomersTheme.textStyles.currencyLarge,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Expanded(
                            child: SizedBox(),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Warranty(
                              warranty:
                                  productItemDetailsProvider.getWarrantyPeriod(
                                      productItem.warrantyEndsIn),
                            ),
                          )
                        ],
                      ),

                      // Product Rating and Condition
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: Row(
                          children: [
                            Rating(rating: 4.0),
                            SizedBox(width: 5),
                            ProductCondition(
                              condition: 'excellent',
                              used: true,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                      // Seller name
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'البائع',
                              style: CustomersTheme.textStyles.titleLarge,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text(
                                productItem.seller,
                                style: CustomersTheme.textStyles.displayLarge,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                      // Model number
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'الموديل',
                              style: CustomersTheme.textStyles.titleLarge,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text(
                                productItem.model,
                                style: CustomersTheme.textStyles.displayLarge,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                      // Item flaws
                      if (productItem.flaws.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'العيوب',
                                style: CustomersTheme.textStyles.titleLarge,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Column(
                                  children: [
                                    ...productItem.flaws.map(
                                      (flaw) => Column(
                                        children: [
                                          Row(
                                            children: [
                                              CircleAvatar(
                                                radius: 4,
                                                backgroundColor:
                                                    productItemDetailsProvider
                                                        .getSeverityLevelColor(
                                                            flaw.severityLevel),
                                              ),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                flaw.flaw,
                                                style: CustomersTheme
                                                    .textStyles.displayLarge,
                                              ),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                productItemDetailsProvider
                                                    .getSeverityLevelText(
                                                        flaw.severityLevel),
                                                style: CustomersTheme
                                                    .textStyles.displayLarge
                                                    .copyWith(
                                                        color: productItemDetailsProvider
                                                            .getSeverityLevelColor(
                                                                flaw.severityLevel)),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (productItem.flaws.isNotEmpty)
                        const SizedBox(
                          height: 15,
                        ),

                      // Product features
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'الوصف',
                              style: CustomersTheme.textStyles.titleLarge,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text(
                                productItem.desc,
                                style: CustomersTheme.textStyles.displayLarge,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 70,
            child: Consumer<ProductItemDetailsProvider>(
                builder: (context, productItemDetailsConsumer, _) {
              return BottomButton(
                icon: Icon(productItem.inCart ? Icons.delete : Icons.add),
                onClick: productItemDetailsConsumer.isLoading
                    ? () {}
                    : (productItem.inCart
                        ? () => productItemDetailsProvider.removeFromCart(
                              token: token,
                              productItem: productItem,
                              ctx: context,
                            )
                        : () => productItemDetailsProvider.addToCart(
                              token: token,
                              productItem: productItem,
                              ctx: context,
                            )),
                color: productItem.inCart
                    ? CustomersTheme.colors.errorColor
                    : CustomersTheme.colors.primaryColor,
                child: productItemDetailsConsumer.isLoading
                    ? const Expanded(
                        child: Row(
                          children: [
                            SizedBox(
                              height: 25,
                              width: 25,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
                            Expanded(
                              child: SizedBox(),
                            ),
                          ],
                        ),
                      )
                    : Expanded(
                        child: Text(
                          productItem.inCart
                              ? 'حذف من سلة المشتريات'
                              : 'إضافة لسلة المشتريات',
                          style:
                              CustomersTheme.textStyles.displayLarger.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
