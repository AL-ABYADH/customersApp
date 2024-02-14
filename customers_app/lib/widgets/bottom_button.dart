import 'package:flutter/material.dart';

import '../theme/customers_theme.dart';

class BottomButton extends StatelessWidget {
  final Widget child;
  final Widget? icon;
  final void Function()? onClick;
  final Color color;

  const BottomButton({
    required this.child,
    required this.onClick,
    required this.color,
    this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: ElevatedButton(
        onPressed: onClick,
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(CustomersTheme.radius),
              topRight: Radius.circular(CustomersTheme.radius),
              // Bottom corners will remain unchanged, i.e., no radius
            ),
          ),
          padding: const EdgeInsets.all(16),
          backgroundColor: color,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon!,
            if (icon != null)
              const SizedBox(
                width: 10,
              ),
            child,
          ],
        ),
      ),
    );
  }
}
