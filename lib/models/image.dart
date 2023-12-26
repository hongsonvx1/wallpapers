// ignore_for_file: unnecessary_getters_setters

import 'dart:convert';

class WallpaperImage {
  String _id;
  int _width;
  int _height;
  String _description;
  int _likes;
  Map<String, String> _urls;

  WallpaperImage(
    this._id,
    this._width,
    this._height,
    this._description,
    this._likes,
    this._urls,
  );

  String get id => _id;

  set id(String value) => _id = value;

  get width => _width;

  set width(value) => _width = value;

  get height => _height;

  set height(value) => _height = value;

  get description => _description;

  set description(value) => _description = value;

  get likes => _likes;

  set likes(value) => _likes = value;

  get urls => _urls;

  set urls(value) => _urls = value;

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'_id': _id});
    result.addAll({'_width': _width});
    result.addAll({'_height': _height});
    result.addAll({'_description': _description});
    result.addAll({'_likes': _likes});
    result.addAll({'_urls': _urls});

    return result;
  }

  factory WallpaperImage.fromMap(Map<String, dynamic> map) {
    dynamic description = map['description'];
    description ??= map['alt_description'];
    description ??= '';
    WallpaperImage img = WallpaperImage(
      map['id'] as String,
      map['width'] as int,
      map['height'] as int,
      description,
      map['likes'] as int,
      Map<String, String>.from(map['urls']),
    );

    return img;
  }

  String toJson() => json.encode(toMap());

  factory WallpaperImage.fromJson(String source) =>
      WallpaperImage.fromMap(json.decode(source));
}
