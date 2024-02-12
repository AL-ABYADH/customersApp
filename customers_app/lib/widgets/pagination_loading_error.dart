import 'package:flutter/material.dart';

class PaginationLoadingError extends StatelessWidget {
  final void Function()? refresh;

  const PaginationLoadingError({
    required this.refresh,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: refresh,
      icon: const Icon(Icons.replay),
    );
  }
}
