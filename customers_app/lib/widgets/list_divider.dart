import 'package:flutter/material.dart';

import '../theme/customers_theme.dart';

class ListDivider extends StatelessWidget {
  final String label;

  const ListDivider({
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 370,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 17, top: 10, left: 5),
            child: Text(
              label,
              style: CustomersTheme.textStyles.listDividerLabel,
            ),
          ),
          Expanded(
            child: Container(
              height: 1.0,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: CustomersTheme.colors.primaryColor.withOpacity(0.3),
                    width: 1.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
