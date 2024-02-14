import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../../models/product_item.dart';
import '../../../providers/user_provider.dart';
import '../../../theme/customers_theme.dart';
import '../../../utils/display_success_snack_bar.dart';
import '../../../utils/send_delete.dart';
import '../../../utils/send_post.dart';
import '../../../utils/display_http_error_snack_bar.dart';
import '../../cart/providers/cart_provider.dart';
import '../../tabs_screen/screens/home_screen/providers/home_provider.dart';

class ProductItemDetailsProvider with ChangeNotifier {
  Color getSeverityLevelColor(String level) {
    switch (level) {
      case 'verySlight':
        return CustomersTheme.colors.verySlight;
      case 'slight':
        return CustomersTheme.colors.slight;
      case 'noticeable':
        return CustomersTheme.colors.noticeable;
      case 'sever':
        return CustomersTheme.colors.sever;
      case 'verySever':
        return CustomersTheme.colors.verySever;
      default:
        throw Exception('Invalid flaw severity level');
    }
  }

  String getSeverityLevelText(String level) {
    switch (level) {
      case 'verySlight':
        return 'طفيف جداً';
      case 'slight':
        return 'طفيف';
      case 'noticeable':
        return 'ملحوظ';
      case 'sever':
        return 'شديد';
      case 'verySever':
        return 'شديد جداً';
      default:
        throw Exception('Invalid flaw severity level');
    }
  }

  String getWarrantyPeriod(int days) {
    // Define the number of days in a year and a month
    const int daysInYear = 365;
    const int daysInMonth = 30;

    // Calculate the number of years, months
    int years = days ~/ daysInYear;
    int remainingDays = days % daysInYear;
    int months = (remainingDays + daysInMonth - 1) ~/
        daysInMonth; // Round up to the nearest month

    // Adjust for cases where rounding up exceeds 12 months
    if (months >= 12) {
      years += 1;
      months -= 12;
    }

    // Convert numbers to Arabic numerals
    final String yearsInArabic = _toArabicNumerals(years);
    final String monthsInArabic = _toArabicNumerals(months);

    // Construct the output string
    late String warrantyPeriod;
    if (years > 0) {
      warrantyPeriod = '$yearsInArabic سنة';
      if (months > 0) {
        warrantyPeriod = ' و $monthsInArabic شهر';
      }
    } else if (months > 0) {
      warrantyPeriod = '$monthsInArabic شهر';
    } else {
      // This case handles a warranty period of less than a month, which is unlikely but included for completeness
      warrantyPeriod = 'أقل من شهر';
    }

    return warrantyPeriod;
  }

  String _toArabicNumerals(int number) {
    const arabicNumerals = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    return number
        .toString()
        .split('')
        .map((digit) => arabicNumerals[int.parse(digit)])
        .join('');
  }

  var isLoading = false;

  final _client = http.Client();

  Future<void> addToCart({
    required String token,
    required ProductItem productItem,
    required BuildContext ctx,
  }) async {
    final url = Uri.parse('${dotenv.env['URL']}/api/carts/add-to-cart');
    final Map<String, dynamic> requestBody = {
      'productItemId': productItem.id,
    };
    try {
      isLoading = true;
      notifyListeners();

      await sendPost(
        url: url,
        client: _client,
        requestBody: json.encode(requestBody),
        token: token,
      );

      isLoading = false;
      notifyListeners();

      productItem.addToCart();

      if (!ctx.mounted) return;
      final homeProvider = Provider.of<HomeProvider>(ctx, listen: false);
      homeProvider.addToCart(productItem.id);

      final cartProvider = Provider.of<CartProvider>(ctx, listen: false);
      cartProvider.addToCart(productItem.id);

      await Provider.of<UserProvider>(ctx, listen: false)
          .incrementCartItemsCount();
      if (!ctx.mounted) return;
      displaySuccessSnackBar(ctx, 'تمت الإضافة للسلة');
    } catch (err) {
      // print(err);
      isLoading = false;
      notifyListeners();
      if (!ctx.mounted) return;
      displayHttpErrorSnackBar(ctx: ctx, err: err, showServerError: false);
    }
  }

  Future<void> removeFromCart({
    required String token,
    required ProductItem productItem,
    required BuildContext ctx,
  }) async {
    final url = Uri.parse(
        '${dotenv.env['URL']}/api/carts/remove-from-cart/${productItem.id}');
    try {
      isLoading = true;
      notifyListeners();

      await sendDelete(
        url: url,
        client: _client,
        token: token,
      );

      isLoading = false;
      notifyListeners();

      productItem.removeFromCart();

      if (!ctx.mounted) return;
      final homeProvider = Provider.of<HomeProvider>(ctx, listen: false);
      homeProvider.removeFromCart(productItem.id);

      final cartProvider = Provider.of<CartProvider>(ctx, listen: false);
      cartProvider.removeFromCart(productItem.id);

      await Provider.of<UserProvider>(ctx, listen: false)
          .decrementCartItemsCount();
      if (!ctx.mounted) return;
      displaySuccessSnackBar(ctx, 'تم الحذف من السلة');
    } catch (err) {
      // print(err);
      isLoading = false;
      notifyListeners();
      if (!ctx.mounted) return;
      displayHttpErrorSnackBar(ctx: ctx, err: err, showServerError: false);
    }
  }
}
