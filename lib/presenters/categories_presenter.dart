import 'dart:core';

import 'package:Wallpapers/models/unplash_api.dart';
import 'package:Wallpapers/models/category.dart';

abstract class CategoriesPresenter {
  Future<List<Category>> getCategories();
}

class BaseCategoriesPresenter implements CategoriesPresenter {
  UnplashAPI _mCategoriesAPI;

  BaseCategoriesPresenter(
    this._mCategoriesAPI,
  ) {
    _mCategoriesAPI = UnplashAPI();
  }

  @override
  Future<List<Category>> getCategories() {
    return _mCategoriesAPI.fetchCategories();
  }
}
