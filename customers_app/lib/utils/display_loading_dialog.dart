import 'package:flutter/material.dart';

import '../widgets/loading_dialog.dart';

void displayLoadingDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (ctx) => LoadingDialog(message: message),
  );
}
