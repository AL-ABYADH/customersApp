

// ignore_for_file: unused_import

import 'package:customers_app/screens/tabs_screen/screens/home_screen/provider/brands.dart';
import 'package:customers_app/screens/search_screen/views/search_screen.dart';
import 'package:customers_app/theme/customers_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:http/http.dart';


class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  // Future<List<String>> fetchBrands() async {
  //   final repoUrl =
  //   Uri.parse("https://api.github.com/repos/DrCinco730/brands/contents");
  //   final response = await get(repoUrl);

  //   if (response.statusCode == 200) {
  //     final List<dynamic> data = json.decode(response.body);
  //     List<String> brandNames = [];

  //     for (var item in data) {
  //       brandNames.add(item['name']);
  //     }
  //     return brandNames;
  //   } else {
  //     throw Exception('Failed to load brands');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //     statusBarColor: CustomersTheme.colors.fieldFillColor,
    //     statusBarBrightness: Brightness.dark));
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: CustomersTheme.colors.backgroundColor,
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        const Icon(Icons.search),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: const Text("ابحث عن جهاز"),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    // showSearch(context: context, delegate: DataSearch());
                    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
                    //     statusBarColor: Colors.transparent,
                    //     statusBarBrightness: Brightness.light));
                    PersistentNavBarNavigator.pushNewScreen(context,
                        screen: const SearchScreen(),
                        withNavBar: false,
                        pageTransitionAnimation: PageTransitionAnimation.fade);
                  },
                )),
                GestureDetector(
                    child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  width: 45,
                  height: 44,
                  margin: const EdgeInsets.only(left: 10),
                  padding: const EdgeInsets.all(5),
                  child: Image.asset(
                    "lib/assets/icons/filter.png",
                    color: CustomersTheme.colors.primaryColor,
                  ),
                ))
              ],
            ),
            const SizedBox(height: 15,),
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Row(
            //     children: List<Widget>.generate(10, (index) =>
            //       Padding(padding: const EdgeInsets.all(10),child: CircleAvatar(backgroundColor: CustomersTheme.colors.primaryColor,),),
            //     ),
            //   ),
            // )
            // FutureBuilder<String>(future:fetchBrands(),builder: (BuildContext context,AsyncSnap),){

            // }
          ],
        ),
      ),
    );
  }
}