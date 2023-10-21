import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/services.dart';
// ignore: unused_import
import '../../../theme/customers_theme.dart';

class SearchScreen extends StatelessWidget implements PreferredSizeWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //     statusBarColor: Color(0xfff0f0f0),
    //     statusBarBrightness: Brightness.dark));
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            backgroundColor: const Color(0xfff0f0f0),
            // backgroundColor: CustomersTheme.colors.backgroundColor,
            // appBar: AppBar(backgroundColor: CustomersTheme.colors.backgroundColor,elevation: 0.0,),
            appBar: PreferredSize(preferredSize: Size.fromHeight(50),
            child:Row(
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
    ),))])
            // AppBar(
            //     backgroundColor: const Color(0xfff0f0f0),
            //     elevation: 0.0,
            //     automaticallyImplyLeading: false,
            //     title: const TextField(
            //       decoration: InputDecoration(
            //           prefixIcon: Icon(Icons.search),
            //           border: InputBorder.none,
            //           fillColor: Color(0xfff8f8f9),
            //           filled: true,
            //           iconColor: Colors.black),
            //     ),
            //     actions: [
            //       TextButton(
            //           onPressed: () {
            //             Navigator.pop(context, false);
            //           },
            //           child: const Text("إلغاء"))
            //     ],
            //   ),
            )));
    // ))));
    // Container(
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(5),
    //         color: Colors.white,
    //       ),
    //       margin: const EdgeInsets.only(left: 10),
    //       padding: const EdgeInsets.all(5),
    //       child: Text("cancel"),
    //     )
    // ],
    // ),
    // );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize {
    return const Size.fromHeight(kToolbarHeight);
  }
}
//
// // class DataSearch extends SearchDelegate{
// //   @override
// //   List<Widget>? buildActions(BuildContext context) {
// //     return [IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_forward))];
// //   }
// //
// //   @override
// //   Widget? buildLeading(BuildContext context) {
// //     return TextButton(onPressed: (){}, child: Center(child:Text("إلغاء")));
// //   }
// //
// //   @override
// //   Widget buildResults(BuildContext context) {
// //     return Container();
// //   }
// //
// //   @override
// //   Widget buildSuggestions(BuildContext context) {
// //     return const Center(child: Text("search"),);
// //   }
// //
// // }
//
// import 'package:flutter/material.dart';
// import 'package:search_appbar_tool/search_appbar_tool.dart';
//
//
//
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   State<MyHomePage> createState() =>
//       _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   final controller = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return   Directionality(
//         textDirection: TextDirection.rtl,
//         child:Scaffold(
//           appBar: AppBar(),
//           body:const SearchBar()
//         ));
//   }
// }
//
//
// // SearchAppBar(
// // fillColor: Colors.white,
// // prefixIconColor: Colors.black,
// // suffixIconColor: Colors.black,
// // leadingIconBtnColor: Colors.black,
// // controller: controller,
// // callBack: (value) {},
// // )
