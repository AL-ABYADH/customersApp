import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget implements PreferredSizeWidget {
  static const routeName = 'search-screen';

  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xfff0f0f0),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            backgroundColor: const Color(0xfff0f0f0),
            elevation: 0.0,
            automaticallyImplyLeading: false,
            title: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
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
          ),
        ),
      ),
    );
  }

  @override
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
