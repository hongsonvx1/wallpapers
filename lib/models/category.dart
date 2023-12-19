class Category {
  String _id;
  String _title;
  String _link;

  Category(this._id, this._title, this._link);

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  String get link => _link;

  set link(String value) {
    _link = value;
  }

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      json['id'] as String,
      json['title'] as String,
      json['links']['photos'] as String,
    );
  }
}
