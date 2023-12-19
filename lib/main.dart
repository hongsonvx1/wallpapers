import 'package:Wallpapers/models/categories_api.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'views/categories_view.dart';

void main() {
  runApp(const WallpaperApp());
}

class WallpaperApp extends StatelessWidget {
  const WallpaperApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallpapers',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const TabBarCategories(),
    );
  }
}
