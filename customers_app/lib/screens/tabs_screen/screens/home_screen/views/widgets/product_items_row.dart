import 'package:flutter/material.dart';

import '../../../../../../models/product_item.dart';
import '../../../../../../theme/customers_theme.dart';
import '../../../../../../widgets/product_item_card.dart';
import '../../../../../../screens/product_item_details_screen/views/product_item_details_screen.dart';
import '../../../../../../widgets/pagination_loading_error.dart';

class ProductItemsRow extends StatefulWidget {
  final List<ProductItem> productItems;
  final String label;
  final bool isLoading;
  final bool isErrorLoading;
  final void Function() fetchItems;

  const ProductItemsRow({
    required this.productItems,
    required this.label,
    required this.isLoading,
    required this.isErrorLoading,
    required this.fetchItems,
    super.key,
  });

  @override
  State<ProductItemsRow> createState() => _ProductItemsRowState();
}

class _ProductItemsRowState extends State<ProductItemsRow> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent) {
      widget.fetchItems();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 10, bottom: 7, left: 15, right: 15),
          child: Text(
            widget.label,
            style: CustomersTheme.textStyles.titleLarge,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          controller: _scrollController,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Row(
              children: [
                ...widget.productItems.map(
                  (item) => ProductItemCard(
                    item: item,
                    onClick: () => Navigator.of(context)
                        .pushNamed(ProductItemDetailsScreen.routeName),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                if (widget.isLoading)
                  SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      color: CustomersTheme.colors.primaryColor,
                      strokeWidth: 3,
                    ),
                  ),
                if (widget.isLoading)
                  const SizedBox(
                    width: 10,
                  ),
                if (widget.isErrorLoading)
                  PaginationLoadingError(refresh: widget.fetchItems),
                if (widget.isErrorLoading)
                  const SizedBox(
                    width: 10,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
