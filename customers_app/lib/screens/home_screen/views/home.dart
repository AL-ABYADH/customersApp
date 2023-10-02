import 'package:flutter/material.dart';
import 'package:searchbar_animation/searchbar_animation.dart';
import 'package:customers_app/theme/customers_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SearchBarAnimation(
        textEditingController: TextEditingController(),
        isOriginalAnimation: true,
        trailingWidget: const Icon(Icons.search, size: 20),
        secondaryButtonWidget: const Icon(Icons.close, size: 20),
        buttonWidget: const Icon(Icons.search, size: 20),
      ),
    );
  }
}
