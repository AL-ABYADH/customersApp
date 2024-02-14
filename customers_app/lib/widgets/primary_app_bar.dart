import 'package:flutter/material.dart';

import '../../../../widgets/bar_border.dart';
import '../theme/customers_theme.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;

  const PrimaryAppBar({
    required this.title,
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: CustomersTheme.colors.backgroundColor,
      elevation: 0,
      title: title,
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(1.0),
        child: BarBorder(),
      ),
      iconTheme: IconThemeData(
        color: CustomersTheme.colors.primaryColor,
      ),
    );
  }
}
