import 'dart:core';

import 'package:Wallpapers/models/categories_api.dart';
import 'package:Wallpapers/models/category.dart';

abstract class CategoriesPresenter {
  Future<List<Category>> getCategories();
}

class BaseCategoriesPresenter implements CategoriesPresenter {
  CategotiesAPI _mCategoriesAPI;

  BaseCategoriesPresenter(
    this._mCategoriesAPI,
  ) {
    _mCategoriesAPI = CategotiesAPI();
  }

  @override
  Future<List<Category>> getCategories() {
    return _mCategoriesAPI.fetchCategories();
  }
}
