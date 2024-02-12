import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class ViewImageScreen extends StatefulWidget {
  final List<String> imageUrls;
  final String heroTag;
  int imageIndex;

  ViewImageScreen({
    required this.imageUrls,
    required this.heroTag,
    required this.imageIndex,
    super.key,
  });

  @override
  State<ViewImageScreen> createState() => _ViewImageScreenState();
}

class _ViewImageScreenState extends State<ViewImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
            '${widget.imageUrls.length} / ${(widget.imageIndex + 1).toString()}'),
        backgroundColor: Colors.black,
      ),
      body: Hero(
        tag: widget.heroTag,
        child: Swiper(
          itemBuilder: (context, index) => Center(
            child: Image.network(
              widget.imageUrls[index],
              fit: BoxFit.fill,
            ),
          ),
          itemCount: widget.imageUrls.length,
          onIndexChanged: (index) => setState(() => widget.imageIndex = index),
        ),
      ),
    );
  }
}
