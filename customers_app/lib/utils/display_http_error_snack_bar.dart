import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import 'display_error_snack_bar.dart';

void displayHttpErrorSnackBar({
  required BuildContext ctx,
  required Object err,
  required bool showServerError,
}) {
  if (ScaffoldMessenger.maybeOf(ctx) != null) {
    ScaffoldMessenger.maybeOf(ctx)!.hideCurrentSnackBar();

    if (err is TimeoutException || err is SocketException) {
      displayErrorSnackBar(ctx, 'تحقق من اتصالك بالشبكة');
    } else if (showServerError) {
      displayErrorSnackBar(ctx, err.toString());
    } else {
      displayErrorSnackBar(ctx, 'فشلت العملية، حدث خطأ ما في النظام');
    }
  }
}
