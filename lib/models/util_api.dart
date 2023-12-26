// ignore_for_file: constant_identifier_names

import 'dart:io';

import 'package:flutter/foundation.dart';

// const String _KEY_AUTHORIZATION = 'Authorization';
const String VALUE_AUTHORIZATION =
    'Client-ID F-yGM9fIEOgHSE71aXsWZkOg2g0sxmcopoJZIlq4yVM';
const String KEY_ACCEPT_VERSION = 'Accept-Version';
const String VALUE_ACCEPT_VERSION = 'v1';

const String ROOT_API = 'https://api.unsplash.com/';
const String API_CATEGORIES = '${ROOT_API}topics';
const String API_PHOTOS = 'api.unsplash.com';
const Map<String, String> authorizationHeader = {
  HttpHeaders.authorizationHeader: VALUE_AUTHORIZATION,
  KEY_ACCEPT_VERSION: VALUE_ACCEPT_VERSION
};

bool isDebuMode = kDebugMode;
