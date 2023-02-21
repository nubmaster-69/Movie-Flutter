import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_application/model/book.dart';
import 'package:http/http.dart' as http;

class NetworkRequest {
  static const url = 'https://simple-books-api.glitch.me/books';

  static List<Book> parseBook(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;

    return list.map((model) => Book.fromJson(model)).toList();
  }

  static Future<List<Book>> fetchBooks() async {
    final response = await http.get(Uri.parse('$url'));

    if (response.statusCode == 200) {
      return compute(parseBook, response.body);
    } else if (response.statusCode == 404)
      throw Exception('Not found');
    else
      throw Exception('Unable to call api!');
  }
}
