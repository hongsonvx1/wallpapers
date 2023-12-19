import 'package:Wallpapers/models/categories_api.dart';
import 'package:Wallpapers/models/category.dart';
import 'package:Wallpapers/presenters/categories_presenter.dart';
import 'package:flutter/material.dart';

class TabBarCategories extends StatefulWidget {
  const TabBarCategories({super.key});

  @override
  State<StatefulWidget> createState() => _TabBarState();
}

class _TabBarState extends State<TabBarCategories> {
  late CategoriesPresenter _mCategoriesPresenter;

  @override
  void initState() {
    super.initState();
    _mCategoriesPresenter = BaseCategoriesPresenter(CategotiesAPI());
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _mCategoriesPresenter.getCategories(),
        builder: (context, snapshot) {
          List<Category>? categories = snapshot.data;

          if (categories == null) {
            return const Text('Has error');
          }

          return DefaultTabController(
            initialIndex: 1,
            length: categories.length,
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Wallpaper'),
                bottom: TabBar(
                  tabs: categories.map((e) => Text(e.title)).toList(),
                ),
              ),
              body: TabBarView(
                children: categories
                    .map((e) => Text('${e.title} this is content'))
                    .toList(),
              ),
            ),
          );
        });
  }
}
