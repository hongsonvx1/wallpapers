import 'dart:convert';
import 'dart:io';

import 'package:Wallpapers/models/category.dart';
import 'package:Wallpapers/models/util_api.dart';
import 'package:http/http.dart' as http;

class CategotiesAPI {
  List<Category> parseCategories(String responseBody) {
    final parsed =
        (jsonDecode(responseBody) as List).cast<Map<String, dynamic>>();

    return parsed.map<Category>((json) => Category.fromJson(json)).toList();
  }

  Future<List<Category>> fetchCategories() async {
    final response = await http.get(
      Uri.parse(API_CATEGORIES),
      // Send authorization headers to the backend.
      headers: {
        HttpHeaders.authorizationHeader: VALUE_AUTHORIZATION,
        KEY_ACCEPT_VERSION: VALUE_ACCEPT_VERSION
      },
    );

    print('${response.statusCode}');

    return parseCategories(response.body);
  }
}
