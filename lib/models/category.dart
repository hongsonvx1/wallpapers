// ignore_for_file: unnecessary_getters_setters, unnecessary_this, non_constant_identifier_names

import 'package:Wallpapers/models/image.dart';

class Category {
  String _id;
  String _title;
  String _link_photos;
  int _total_photos;
  WallpaperImage _cover;

  Category(this._id, this._title, this._link_photos, this._total_photos,
      this._cover);

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  String get link => _link_photos;

  set link(String value) {
    _link_photos = value;
  }

  int get total_photos => this._total_photos;

  set total_photos(int value) => this._total_photos = value;

  WallpaperImage get cover => _cover;

  set cover(WallpaperImage value) => _cover = value;

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      json['id'] as String,
      json['title'] as String,
      json['links']['photos'] as String,
      json['total_photos'] as int,
      WallpaperImage.fromMap(json['cover_photo']),
    );
  }
}
