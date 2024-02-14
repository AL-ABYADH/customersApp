import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:retry/retry.dart';
import '../models/http_exception.dart';

Future sendPost({
  required Uri url,
  required http.Client client,
  required requestBody,
  required String token,
}) async {
  // print(url);
  final headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token',
  };
  try {
    const r = RetryOptions(maxAttempts: 2);
    final response = await r.retry(
      () => client
          .post(
            url,
            headers: headers,
            body: requestBody,
          )
          .timeout(
            const Duration(seconds: 15),
          ),
    );

    if (response.statusCode == 400) {
      throw HttpException(json.decode(response.body)['message']);
    } else if (response.statusCode != 200) {
      // print(response.body);
      throw HttpException('حدث خطأ ما في النظام');
    }

    final responseData = json.decode(response.body);

    return responseData;
  } catch (err) {
    // print(err);
    rethrow;
  }
}
