import 'dart:convert';

import 'package:customers_app/screens/home_screen/provider/brands.dart';
import 'package:customers_app/screens/search_screen/views/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:customers_app/theme/customers_theme.dart';
import 'package:flutter/services.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:http/http.dart';

// class HomePage extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => _home_age();
// }
//
// class _home_age extends State<HomePage>{
//   Future<List<String>> fetchBrands() async {
//     final repoUrl =
//     Uri.parse("https://api.github.com/repos/DrCinco730/brands/contents");
//     final response = await get(repoUrl);
//
//     if (response.statusCode == 200) {
//       final List<dynamic> data = json.decode(response.body);
//       List<String> brandNames = [];
//
//       for (var item in data) {
//         brandNames.add(item['name']);
//       }
//       return brandNames;
//     } else {
//       throw Exception('Failed to load brands');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//     //     statusBarColor: CustomersTheme.colors.fieldFillColor,
//     //     statusBarBrightness: Brightness.dark));
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//         backgroundColor: CustomersTheme.colors.backgroundColor,
//         appBar: AppBar(
//           // toolbarHeight: 40,
//           systemOverlayStyle: SystemUiOverlayStyle( statusBarColor: CustomersTheme.colors.primaryColor,
//               statusBarBrightness: Brightness.dark,statusBarIconBrightness: Brightness.dark),
//           leading: Icon(Icons.support_agent,color: CustomersTheme.colors.primaryColor,size: 35,),
//             backgroundColor: CustomersTheme.colors.backgroundColor,
//             actions:  [Icon(Icons.account_circle,color: CustomersTheme.colors.primaryColor,size: 35,),const SizedBox(width: 15,)],
//             // title: const Text("الصفحة الرئيسية"),
//             // titleTextStyle: CustomersTheme.textStyles.titleLarge,
//             elevation: 0.0),
//         body: Column(
//           children: [
//             Row(
//               children: [
//                 Expanded(
//                     child: GestureDetector(
//                   child: Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(5),
//                       color: Colors.white,
//                     ),
//                     margin: const EdgeInsets.all(10),
//                     padding: const EdgeInsets.all(10),
//                     child: Row(
//                       children: [
//                         const Icon(Icons.search),
//                         Container(
//                           padding: const EdgeInsets.symmetric(horizontal: 10),
//                           child: const Text("ابحث عن جهاز"),
//                         ),
//                       ],
//                     ),
//                   ),
//                   onTap: () {
//                     // showSearch(context: context, delegate: DataSearch());
//                     // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
//                     //     statusBarColor: Colors.transparent,
//                     //     statusBarBrightness: Brightness.light));
//                     PersistentNavBarNavigator.pushNewScreen(context,
//                         screen: const SearchScreen(),
//                         withNavBar: false,
//                         pageTransitionAnimation: PageTransitionAnimation.fade);
//                   },
//                 )),
//                 GestureDetector(
//                     child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(5),
//                     color: Colors.white,
//                   ),
//                   width: 45,
//                   height: 44,
//                   margin: const EdgeInsets.only(left: 10),
//                   padding: const EdgeInsets.all(5),
//                   child: Image.asset(
//                     "lib/assets/filter.png",
//                     color: CustomersTheme.colors.primaryColor,
//                   ),
//                 ))
//               ],
//             ),
//             SizedBox(height: 15,),
//             // SingleChildScrollView(
//             //   scrollDirection: Axis.horizontal,
//             //   child: Row(
//             //     children: List<Widget>.generate(10, (index) =>
//             //       Padding(padding: const EdgeInsets.all(10),child: CircleAvatar(backgroundColor: CustomersTheme.colors.primaryColor,),),
//             //     ),
//             //   ),
//             // )
//             FutureBuilder<String>(future:fetchBrands(),builder: (BuildContext context,AsyncSnap),){
//
//             }
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GitHubData extends ChangeNotifier {
  List<Map<String, dynamic>> _data = [];
  bool _isLoading = false;

  List<Map<String, dynamic>> get data => _data;
  bool get isLoading => _isLoading;

  Future<void> fetchData() async {
    _isLoading = true;
    notifyListeners();

    final response = await http.get(
      Uri.https("api.github.com", "repos/DrCinco730/brands/contents"),
    );

    if (response.statusCode == 200) {
      List<dynamic> responseData = json.decode(response.body);
      _data = responseData.cast<Map<String, dynamic>>();
    } else {
      // Handle error here
    }

    _isLoading = false;
    notifyListeners();
  }
}
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GitHub Repository Contents'),
      ),
      body: Consumer<GitHubData>(
        builder: (context, gitHubData, child) {
          if (gitHubData.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (gitHubData.data.isEmpty) {
            return Center(
              child: Text('No data available.'),
            );
          } else {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: gitHubData.data.map((item) {
                  return CircleAvatar(
                    child: Container(
                      child: Text(item['name']),
                      margin: EdgeInsets.all(10),
                    ),
                  );
                }).toList(),
              ),
            );
          }
        },
      ),
    );
  }
}

