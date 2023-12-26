import 'package:Wallpapers/models/image.dart';
import 'package:flutter/material.dart';

class WallpaperView extends StatelessWidget {
  final WallpaperImage _image;

  const WallpaperView(this._image, {super.key});

  @override
  Widget build(BuildContext context) {
    String imageURL = _image.urls['regular'];

    return InkWell(
        onTap: () {},
        child: SizedBox(
          height: 900,
          width: 300,
          child: Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 5,
            margin: const EdgeInsets.all(10),
            child: Image.network(
              imageURL,
              fit: BoxFit.fill,
            ),
          ),
        ));
  }
}
