import 'package:Wallpapers/models/category.dart';
import 'package:Wallpapers/models/image.dart';
import 'package:Wallpapers/models/unplash_api.dart';
import 'package:Wallpapers/views/wallpapers_view.dart';
import 'package:flutter/material.dart';

class GridWallpapers extends StatefulWidget {
  final Category _category;

  const GridWallpapers(this._category, {super.key});

  @override
  State<StatefulWidget> createState() => _GridWallpaperState();
}

class _GridWallpaperState extends State<GridWallpapers> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: UnplashAPI().fetchPhotos(widget._category),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Text('Loading...');
          }

          List<WallpaperImage> images = snapshot.data;
          print('Images leng ${images.length}');
          return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                childAspectRatio: widget._category.cover.width /
                    widget._category.cover.height,
              ),
              itemCount: images.length,
              itemBuilder: (context, index) {
                return GridTile(child: WallpaperView(images[index]));
              });
        });
  }
}
