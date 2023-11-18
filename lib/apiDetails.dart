// ignore_for_file: file_names

import 'dart:convert';
import 'package:http/http.dart' as http;

final url = Uri.https(
    "flutter-prep-416c7-default-rtdb.firebaseio.com", 'shopping-list.json');

Future<Response> getResponse(
    dynamic enteredName, dynamic selectedCategory, dynamic enteredQuantity) {
  final res = http.post(
    url,
    headers: {'content-Type': 'application/json'},
    body: json.encode(
      {
        "name": enteredName,
        "category": selectedCategory.title,
        "amount": enteredQuantity
      },
    ),
  );
}

Map<String, dynamic> decodeResponse(
    dynamic enteredName, dynamic selectedCategory, dynamic enteredQuantity) {
  final res = getResponse(enteredName, selectedCategory.title, enteredQuantity);
  final Map<String, dynamic> responseData = json.decode(res.body);

  return responseData;
}
