import 'package:flutter/material.dart';

import '../../../theme/customers_theme.dart';

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
}
