import 'package:flutter/material.dart';

import '../theme/customers_theme.dart';

class PrimaryButton extends StatelessWidget {
  final Widget child;
  final Widget? icon;
  final void Function()? onClick;

  const PrimaryButton({
    required this.child,
    required this.icon,
    required this.onClick,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: ElevatedButton(
        onPressed: onClick,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(CustomersTheme.radius),
            ),
          ),
          padding: MaterialStateProperty.all(const EdgeInsets.all(16)),
          backgroundColor:
              MaterialStateProperty.all(CustomersTheme.colors.primaryColor),
        ),
        child: Center(
          child: icon != null
              ? Row(
                  children: [
                    icon!,
                    const SizedBox(
                      width: 10,
                    ),
                    child,
                  ],
                )
              : child,
        ),
      ),
    );
  }
}
