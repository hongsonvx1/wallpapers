import 'dart:convert';
import 'dart:io';

import 'package:Wallpapers/models/category.dart';
import 'package:Wallpapers/models/image.dart';
import 'package:Wallpapers/models/util_api.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart' as found;

class UnplashAPI {
  List<Category> parseCategories(String responseBody) {
    final parsed =
        (jsonDecode(responseBody) as List).cast<Map<String, dynamic>>();

    return parsed.map<Category>((json) => Category.fromJson(json)).toList();
  }

  Future<List<Category>> fetchCategories() async {
    final response = await http.get(
      Uri.parse(API_CATEGORIES),
      headers: {
        HttpHeaders.authorizationHeader: VALUE_AUTHORIZATION,
        KEY_ACCEPT_VERSION: VALUE_ACCEPT_VERSION
      },
    );

    if (found.kDebugMode) {
      // ignore: avoid_print
      print('${response.statusCode}');
    }

    return parseCategories(response.body);
  }

  List<WallpaperImage> parsePhotos(String responseBody) {
    final parsed =
        (jsonDecode(responseBody) as List).cast<Map<String, dynamic>>();

    return parsed
        .map<WallpaperImage>((json) => WallpaperImage.fromMap(json))
        .toList();
  }

  Future<List<WallpaperImage>> fetchPhotos(Category category) async {
    print('Link ${category.link}');
    // final response = await http.get(
    //   Uri.parse(category.link),
    //   headers: {
    //     HttpHeaders.authorizationHeader: VALUE_AUTHORIZATION,
    //     KEY_ACCEPT_VERSION: VALUE_ACCEPT_VERSION
    //   },
    // );

    final queryParameters = {
      'per_page': '100',
      'page': '1',
    };

    var uri = Uri.https(
      API_PHOTOS,
      '/topics/${category.id}/photos',
      queryParameters,
    );
    final response = await http.get(
      uri,
      headers: {
        HttpHeaders.authorizationHeader: VALUE_AUTHORIZATION,
        KEY_ACCEPT_VERSION: VALUE_ACCEPT_VERSION
      },
    );

    print('URI ${uri.toString()}');

    if (found.kDebugMode) {
      // ignore: avoid_print
      print('${response.statusCode}');
    }

    return parsePhotos(response.body);
  }
}
