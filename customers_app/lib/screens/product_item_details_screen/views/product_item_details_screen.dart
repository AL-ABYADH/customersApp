// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../theme/customers_theme.dart';
import '../../../widgets/rating.dart';
import '../../../widgets/product_condition.dart';

class ProductItemDetailsScreen extends StatelessWidget {
  static const routeName = 'product-item-details-screen';

  const ProductItemDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'اسم المنتج',
          style: CustomersTheme.textStyles.titleLarge,
        ),
        backgroundColor: CustomersTheme.colors.backgroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: CustomersTheme.colors.primaryColor, size: 35),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: CustomersTheme.colors.primaryColor,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
        ),
        elevation: 0.0,
      ),
      body: ListView(
        children: [
          // Product Image
          SizedBox(
            height: 200, // Limit the image height to 200 pixels
            child: Image.network(
              'https://example.com/product-image.jpg', // Replace with the image URL
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          // Product Price
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 8.0, 0.8),
            child: Text(
              '\$250.00', // Replace with the product price and currency
              style: CustomersTheme.textStyles.titleLarge,
            ),
          ),

          // Product Rating and Condition (in a Row)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Rating(rating: 4.0), // Replace with the actual product rating
                SizedBox(
                    width:
                        5), // Add spacing between Rating and ProductCondition
                ProductCondition(
                  condition: 'excellent', // Replace with the actual condition
                  used:
                      true, // Replace with the actual condition status Replace with the actual product rating
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'اسم البائع:',
                  style: CustomersTheme.textStyles.titleMedium,
                ),
                Text('علي حيدر',
                  style: CustomersTheme.textStyles.display,
                ), // Replace with the actual warranty period
              ],
            ),
          ),

          // Flaws and Severity Level
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Table(
              columnWidths: {
                0: FlexColumnWidth(2), // Adjust the flex value as needed
                1: FlexColumnWidth(3), // Adjust the flex value as needed
              },
              children: [
                TableRow(
                  children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          'العيوب:',
                          style: CustomersTheme.textStyles.titleMedium,
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          'مستوى الخطورة:',
                          style: CustomersTheme.textStyles.titleMedium,
                        ),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          'خدوش بسيطة على السطح',
                          style: CustomersTheme.textStyles.display,
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          'منخفض',
                          style: CustomersTheme.textStyles.display,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Used Condition
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'مستخدم:',
                  style: CustomersTheme.textStyles.titleMedium,
                ),
                Text(
                  'نعم',
                  style: CustomersTheme.textStyles.display,
                ),
                SizedBox(height: 10),
                Text(
                  'الحالة:',
                  style: CustomersTheme.textStyles.titleMedium,
                ),
                Text('جيدة',
                  style: CustomersTheme.textStyles.display,
                ),
              ],
            ),
          ),

          // Warranty Period
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'الضمان:',
                  style: CustomersTheme.textStyles.titleMedium,
                ),
                Text('سنة',
                  style: CustomersTheme.textStyles.display,
                ), // Replace with the actual warranty period
              ],
            ),
          ),

          // Product features
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'مميزات المنتج:',
                  style: CustomersTheme.textStyles.titleMedium,
                ),
                Text(
                  'نص تجريبي لتفاصيل المنتج. '
                  'يمكنك تخصيص هذا النص وإضافة مزيد من التفاصيل هنا. '
                  'نص تجريبي لتفاصيل المنتج. '
                  'يمكنك تخصيص هذا النص وإضافة مزيد من التفاصيل هنا.',
                  style: CustomersTheme.textStyles.display,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// import 'dart:ui';
// import 'package:flutter/material.dart';
// class ProductItemDetailsScreen extends StatelessWidget {
//   const ProductItemDetailsScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//       body: Stack(
//         children: [
//           SizedBox(
//             width: double.infinity,
//             child: Image.asset("assets/imges/Food Picture.png"),
//           ),
//           buttonArrow(context),
//           scroll(),
//         ],
//       ),
//     ));
//   }

//   buttonArrow(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: InkWell(
//         onTap: () {
//           Navigator.pop(context);
//         },
//         child: Container(
//           clipBehavior: Clip.hardEdge,
//           height: 55,
//           width: 55,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(25),
//           ),
//           child: BackdropFilter(
//             filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//             child: Container(
//               height: 55,
//               width: 55,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(25),
//               ),
//               child: const Icon(
//                 Icons.arrow_back_ios,
//                 size: 20,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   scroll() {
//     return DraggableScrollableSheet(
//         initialChildSize: 0.6,
//         maxChildSize: 1.0,
//         minChildSize: 0.6,
//         builder: (context, scrollController) {
//           return Container(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             clipBehavior: Clip.hardEdge,
//             decoration: const BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.only(
//                   topLeft: const Radius.circular(20),
//                   topRight: const Radius.circular(20)),
//             ),
//             child: SingleChildScrollView(
//               controller: scrollController,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(top: 10, bottom: 25),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Container(
//                           height: 5,
//                           width: 35,
//                           color: Colors.black12,
//                         ),
//                       ],
//                     ),
//                   ),
//                   Text(
//                     "Cacao Maca Walnut Milk",
//                     style: Theme.of(context).textTheme.headline2,
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     "Food .60 min",
//                     style: Theme.of(context)
//                         .textTheme
//                         .bodyMedium!
//                         .copyWith(color:Colors.red),
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   Row(
//                     children: [
//                       clicking(
//                         onTap: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) =>
//                                     ProfileTap(showFollowBottomInProfile: true),
//                               ));
//                         },
//                         child: const CircleAvatar(
//                           radius: 25,
//                           backgroundImage:
//                               AssetImage("assets/imges/Avatar3.png"),
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 5,
//                       ),
//                       Text(
//                         "Elena Shelby",
//                         style: Theme.of(context)
//                             .textTheme
//                             .displaySmall!
//                             .copyWith(color: Colors.white),
//                       ),
//                       const Spacer(),
//                       const CircleAvatar(
//                         radius: 25,
//                         backgroundColor: Colors.blueGrey,
//                         child: Icon(
//                           icon.heart,
//                           color: Colors.white,
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 5,
//                       ),
//                       Text(
//                         "273 Likes",
//                         style: Theme.of(context)
//                             .textTheme
//                             .displaySmall!
//                             .copyWith(color: Colors.blueAccent),
//                       ),
//                     ],
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.symmetric(vertical: 15),
//                     child: Divider(
//                       height: 4,
//                     ),
//                   ),
//                   Text(
//                     "Description",
//                     style: Theme.of(context).textTheme.displayLarge,
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     'Your recipe has been uploaded, you can see it on your profile. Your recipe has been uploaded, you can see it on your',
//                     style: Theme.of(context)
//                         .textTheme
//                         .bodyMedium!
//                         .copyWith(color: Colors.lightBlue),
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.symmetric(vertical: 15),
//                     child: Divider(
//                       height: 4,
//                     ),
//                   ),
//                   Text(
//                     "Ingredients",
//                     style: Theme.of(context).textTheme.displayLarge,
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   ListView.builder(
//                     physics: NeverScrollableScrollPhysics(),
//                     shrinkWrap: true,
//                     itemCount: 3,
//                     itemBuilder: (context, index) => ingredients(context),
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.symmetric(vertical: 15),
//                     child: Divider(
//                       height: 4,
//                     ),
//                   ),
//                   Text(
//                     "Steps",
//                     style: Theme.of(context).textTheme.headline1,
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   ListView.builder(
//                     physics: NeverScrollableScrollPhysics(),
//                     shrinkWrap: true,
//                     itemCount: 3,
//                     itemBuilder: (context, index) => steps(context, index),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         });
//   }

//   ingredients(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10),
//       child: Row(
//         children: [
//           const CircleAvatar(
//             radius: 10,
//             backgroundColor: Color(0xFFE3FFF8),
//             child: Icon(
//               Icons.done,
//               size: 15,
//               color: Colors.greenAccent,
//             ),
//           ),
//           const SizedBox(
//             width: 10,
//           ),
//           Text(
//             "4 Eggs",
//             style: Theme.of(context).textTheme.bodyText2,
//           ),
//         ],
//       ),
//     );
//   }

//   steps(BuildContext context, int index) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 20),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           CircleAvatar(
//             backgroundColor: Colors.yellowAccent,
//             radius: 12,
//             child: Text("${index + 1}"),
//           ),
//           Column(
//             children: [
//               SizedBox(
//                 width: 270,
//                 child: Text(
//                   "Your recipe has been uploaded, you can see it on your profile. Your recipe has been uploaded, you can see it on your",
//                   maxLines: 3,
//                   style: Theme.of(context)
//                       .textTheme
//                       .displayMedium!
//                       .copyWith(color: Colors.redAccent),
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Image.asset(
//                 "assets/imges/Rectangle 219.png",
//                 height: 155,
//                 width: 270,
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }